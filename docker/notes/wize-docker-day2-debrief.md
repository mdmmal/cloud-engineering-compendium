# Wize Backend Dockerization — Full Day 2 Debrief

Date: 2026-06-18 | Week 1, Day 2 | Result: backend image builds clean; the app needs runtime config (env vars) before it will start

This is the full story of building the Wize backend Dockerfile, written in plain language. It keeps every wall, every wrong guess I made, every fix, and the reasoning behind each decision. The point is not just "what we did" but "how to see it coming next time."

---

## The big picture in one paragraph

I set out to write a Dockerfile that packages my Express backend so it runs in a container. I expected the hard part to be a native-module compile error (bcrypt). That never happened, because an earlier decision prevented it. Instead the real walls were things about how MY project is actually put together: my dependencies are split across two package.json files, my lockfile was out of date, my build was compiling the wrong files, and my disk filled up. Each wall taught me something, and almost none of them were Docker's fault. Docker just exposed problems that were already sitting in my repo.

---

## How I built it, step by step (and why each line exists)

I wrote the Dockerfile a few lines at a time and built after the risky steps, instead of writing the whole thing and praying. That habit (build in small testable stages) is the reason I could tell exactly which line caused each failure.

The finished file:
```
FROM node:20
WORKDIR /home/app
COPY package.json package-lock.json ./
RUN npm install
COPY server/ ./server/
COPY tsconfig.server.json ./
RUN npm run build:server
EXPOSE 3001
CMD ["node", "--import", "./dist/server/instrument.js", "dist/server/index.js"]
```

What each line does, in plain terms:
- **FROM node:20** — start from an image that already has Node 20 and a full Linux system with build tools inside.
- **WORKDIR /home/app** — make a folder inside the container and work from there. Every command after this runs from this folder.
- **COPY package.json package-lock.json ./** — bring in the dependency list and the lockfile FIRST, by themselves, so the install layer stays cached when I later change code.
- **RUN npm install** — install the dependencies.
- **COPY server/ ./server/** — bring in the backend source code, keeping it inside a folder named server (this matters, explained below).
- **COPY tsconfig.server.json ./** — bring in the TypeScript build config, because the build command reads it.
- **RUN npm run build:server** — compile the TypeScript into plain JavaScript in dist/server.
- **EXPOSE 3001** — document that the app listens on 3001 (just a label, does not actually open anything).
- **CMD [...]** — when the container starts, run the compiled server and preload Sentry monitoring first.

---

## Step 0: reading my own app before writing anything

Before any Dockerfile lines, I read my own code to get facts instead of guessing. This turned out to be the most important part, because every wrong assumption later came from a place where I had NOT checked.

**What port does the backend listen on?**
I searched index.ts for the word "listen" and found:
```
startServer(Number(process.env.PORT) || 3001);
```
What I learned: the port is NOT hardcoded. The app reads a PORT environment variable, and only falls back to 3001 if nothing is set. So 3001 is the default. This shapes the EXPOSE line and the port mapping at run time.

I also noticed the line above it (`if (import.meta.url === ...`) is the "am I being run directly" check, the JavaScript version of Python's `if __name__ == "__main__"`. That confirmed index.ts is a real entry point and I did not have to go hunting in another file.

**Which package.json owns the backend?**
There are TWO: the root one and server/package.json. I opened both.
- Root package.json: a big mixed bag. React, vite, expo, capacitor, plus express and bcrypt. Stuff I added over time (Sentry, haptics). A "kitchen sink."
- server/package.json: clearly the backend. Its name is literally "wize-backend", its scripts run a compiled server, and it lists express and sqlite.

At the time I concluded "server/package.json owns the backend deps." That felt right and it was PARTLY right. It owns SOME of them. This assumption came back to bite me later (Wall 3).

How to recognize the right one on a stranger's repo: read the name and scripts first (a backend's start script runs a server like `node dist/index.js`; a frontend's runs a bundler like `vite build`), then look at the dependencies for the framework tell (express = backend, react/vite = frontend, a database driver = backend). The package.json inside the service folder usually owns that service.

**What is a lockfile? (I did not know this going in, and said so.)**
In package.json you write version RANGES, like `"bcrypt": "^6.0.0"`, which means "any 6.x version." That is flexible but risky: two people installing months apart could get slightly different versions. The lockfile (package-lock.json) is the RECEIPT: it pins the exact version of every package, so everyone who installs from it gets byte-for-byte the same thing. This matters for Docker because a container is supposed to be an identical artifact every time you build it. The lockfile is what makes that possible.

**The TypeScript problem.**
My code is TypeScript (.ts), but Node only runs JavaScript. So somewhere the .ts has to be COMPILED into .js before Node can run it. The compiler is `tsc`. It reads my source and writes plain JavaScript into a dist/ folder. The container runs the compiled dist files, never my .ts source.

How to recognize this on any project: .ts files, a tsconfig.json, and a start script that runs a DIFFERENT file than the source (from dist/ or build/). When start says `node dist/...` but your source is .ts, there is a compile step and the container has to do it.

The sequence to keep straight:
1. Build time (once, when the image is made): tsc reads the .ts, writes .js into dist/.
2. Run time (every container start): node runs the compiled .js. It never touches the .ts.
3. The catch: dist/ only exists if something compiled it. The Dockerfile MUST do the compile, or there is nothing to run.

---

## Wall 1: the base image decision (and my first wrong instinct)

For the FROM line I first reached for `node:20-alpine` because it is the smallest, and my reasoning was "minimal, fewer build tools needed."

That reasoning was BACKWARDS, and catching it was a real lesson. My app has native modules (bcrypt, better-sqlite3). Native modules COMPILE when they install, and compiling needs build tools. Alpine is small precisely because it strips those tools out. So I had picked the toolless image right before a step that needs tools.

The fix: I switched to the full `node:20` image, which ships the complete build toolchain. My honest reasoning became: "full image so native modules compile without me having to add tools myself."

What I gave up: size. The full image is close to 1GB. That is a real cost and the fix for it (multi-stage build) is the next lesson. But for getting it working, big-but-working was the right trade.

Lesson: when a later step needs tooling, the base image choice decides whether that step is painless or painful. Reason about what is coming BEFORE locking the base.

---

## Wall 2: npm ci succeeded but the app crashed (the throwaway-lab lesson, repeated)

Wait, this was Day 1. On Day 1's practice app I hit: empty build context (COPY copies nothing if the files are not there), the frozen image (editing files does nothing without a rebuild), and the missing `npm install` (package.json is a shopping list, the install is the actual shopping). Those three walls are why I recognized the same SHAPE of problem on Day 2.

---

## Wall 3: the build failed with a wall of TypeScript errors

I added `RUN npm run build` and built. It exploded with dozens of errors. Two different KINDS were mixed together, and telling them apart was the skill:

**Kind 1, "Cannot find module":** bcrypt, @sentry/node, helmet, express-rate-limit, web-push. My code imports these, but tsc could not find them, even though npm had just succeeded.
**Kind 2, real type errors:** long complaints about types, mostly in `__tests__/` files.

I diagnosed it in steps:
1. I checked WHERE the missing modules were listed. They were in the ROOT package.json, not server/package.json. But I had installed from server/package.json only. So npm faithfully installed an INCOMPLETE list, and the compiler then hit imports for things that were never installed. This is the exact same lesson as Day 1's missing express: the code needs a thing that is not installed.
2. I noticed the type errors were in test files, and asked: should a production build even be compiling my tests? No.

So my Step 0 assumption ("server/package.json owns the backend deps") was wrong. The truth: my deps are SPLIT across root and server/. That is a project structure problem, not a Docker problem.

---

## Wall 4: reading railway.json — how my app ACTUALLY builds

To find the truth instead of guessing, I read my deployment config, railway.json. This rewrote three of my decisions:

```
"buildCommand": "npm install && npm run build && npm run build:server"
"startCommand": "node dist/server/index.js"
```
Plus a volume mounted at /app/data for the SQLite database.

What this told me:
1. **Railway installs from the ROOT** (`npm install` at root). That is why production has every dependency: it installs the whole kitchen sink. My container broke because I scoped the install down to server/ where half the deps are missing.
2. **There are TWO build scripts.** `build` is `vite build` (frontend). `build:server` is `tsc -p tsconfig.server.json` (backend). I had only run `npm run build`, which is the FRONTEND build using the wrong config. The backend build is `build:server`.
3. **The start path is `dist/server/index.js`**, not `dist/index.js`. My CMD was pointing at the wrong file.

Then I read tsconfig.server.json (the config the real backend build uses) and it confirmed everything:
```
"outDir": "dist/server"
"include": ["server/**/*"]
"exclude": ["node_modules", "server/**/__tests__/**", "**/*.test.ts"]
```
This config compiles only the server folder, puts output in dist/server, and ALREADY excludes tests. My earlier test-file errors came from the WRONG tsconfig (server/tsconfig.json, which compiles everything including tests). So I did not have to fix the test problem at all, I just had to use the right build command, which uses the right config.

The big decision here: match how the app really deploys (install from root, build with build:server), instead of refactoring my whole project to make server/ self-contained. Reasoning: my goal this week is to containerize my real working app and understand it, not to re-architect dependency management right before camp. I logged the cleanup as a separate future task.

This fixed three lines:
- COPY the ROOT package files, not server/.
- Build with `npm run build:server`, not `npm run build`.
- CMD points at dist/server/index.js.

And one tricky copy detail: tsconfig.server.json says include "server/**/*", which expects a FOLDER named server. So I had to COPY server/ to ./server/ (keeping the folder) instead of flattening it to ./. Flattening would leave no server/ folder and tsc would compile nothing. I also had to COPY tsconfig.server.json itself, because the build command reads it.

---

## Wall 5: npm ci failed because the lockfile was out of sync

After switching to install from root, `npm ci` failed with:
```
npm ci can only install packages when your package.json and package-lock.json are in sync.
```
and a list of missing react-native / metro / hermes packages.

What this means: my root package.json had mobile dependencies added that were never written into the lockfile. The receipt (lockfile) and the shopping list (package.json) disagree. `npm ci` is STRICT by design: it refuses to run on a mismatch, because its whole job is reproducible installs. `npm install` is forgiving: it just resolves whatever and updates the lock.

Why this never broke on Railway: Railway uses `npm install` (forgiving). My container used `npm ci` (strict), so it caught real drift that Railway had been silently tolerating.

The decision: switch the Dockerfile to `npm install` for now. It matches what Railway actually does and unblocks the build. I knowingly gave up ci's reproducibility, and logged "regenerate the root lockfile locally, test, commit" as a real separate fix to do later. I specifically chose NOT to outsource this to an AI tool, because regenerating a lockfile on a LIVE app can pull breaking versions and I need to understand what changes.

Lesson: `npm ci` strict (reproducible, refuses on drift). `npm install` forgiving (resolves fresh, updates lock). Strict tools catch problems loose tools hide.

---

## Wall 6: no space left on device

The next build ran ALL the way through, install fine, `build:server` compiled clean in under 8 seconds (the wall that started this whole saga was finally gone), and then it failed at the very end, at "exporting to image," with:
```
no space left on device
```

This was the key reading skill: every build STEP succeeded. The failure was at the export stage, where Docker writes the finished layers to disk. That means the problem was the HOST, not my Dockerfile. My VM's disk was full.

Why: I had built ~1GB images several times, plus old lab images, plus build cache. Docker does not clean up after itself.

The fix: `docker system prune -a -f` to reclaim space (removes unused images, stopped containers, build cache), then rebuild. After cleanup it built clean and named the image.

Lesson: read WHERE a build fails. Failing inside a RUN step is a code/config problem. Failing at "exporting" after all steps pass is a disk problem. Check with `df -h /` and `docker system df`; reclaim with `docker system prune -a -f`.

---

## Wall 7 (still open): it builds, but the app refuses to start

I ran the container and checked the logs:
```
docker run -d -p 3001:3001 --name wize-test wize-backend:1.0
docker logs wize-test
```
Output:
```
Created data directory: /home/app/dist/data
Foreign keys enabled
FATAL: JWT_SECRET environment variable is not set. Refusing to start.
```

This is a WIN, not a failure. The container ran my actual code: it created its data directory, turned on database foreign keys, and then stopped ON PURPOSE because a required secret was missing. I wrote the app to refuse to start without JWT_SECRET (a security guardrail). So the image is correct; the container just lacks runtime configuration.

Same shape as Day 1's app crashing on a missing MongoDB, one level deeper. A container starts with ONLY what is baked into the image. Real apps need runtime config (secrets, db paths) that you do NOT bake in, because anyone who pulls the image could read baked-in secrets.

Next step (not done yet): find every environment variable the backend reads with
```
grep -rn "process.env" ~/projects/Wize/server --include=*.ts | grep -v __tests__
```
then pass them at run time with `docker run -e VAR=value`, and confirm the app boots.

---

## The decisions that mattered, with reasoning (the interview answers)

1. **node:20 full image, not alpine:** full image has the build toolchain so native modules compile. Cost: ~1GB. Fix for size is multi-stage (next lesson).
2. **Install from root, build with build:server:** matched how the app really deploys, instead of a clean-but-wrong backend-only theory.
3. **npm install over npm ci (for now):** forced by the stale lockfile; matches Railway; reproducibility traded away knowingly and logged.
4. **COPY server/ as ./server/ (folder kept), plus COPY tsconfig.server.json:** the build config expects a server/ folder and reads that tsconfig.
5. **CMD at dist/server/index.js with --import instrument.js:** matches the real outDir and preloads Sentry, exactly like the real start script.

---

## What I got wrong, and corrected (worth remembering)
- Reached for alpine for the wrong reason; corrected to full image once I connected it to native modules.
- Assumed server/package.json owned ALL the backend deps; it owned only some. The truth was in railway.json.
- Used `npm run build` (frontend) instead of `npm run build:server` (backend), which dragged in the wrong tsconfig and the test files.
- Pointed CMD at dist/index.js; the real path is dist/server/index.js.
- Forgot the tsconfig.server.json COPY line at first; the build needs it present.

Each of these came from a place where I assumed instead of reading. The pattern: when in doubt, go LOOK (ls, cat, grep, read the deploy config). Do not guess.

---

## Still open / next
- Runtime env vars -> get the container to actually start (grep process.env, pass with -e).
- Multi-stage build -> shrink the image, closes the last Week 1 gate item.
- Regenerate the root lockfile -> separate cleanup task.
- SQLite volume persistence (/app/data) -> Week 2.
