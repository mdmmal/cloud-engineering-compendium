# Docker Day 2 — Complete Flashcard Set

Captures everything from the Wize backend build: the errors I made, the wrong assumptions, every fix, the commands, and the decisions. Tags: [R] recall (know the fact cold), [J] judgment (answer the reasoning out loud, then check against the model, do NOT memorize my wording).

How to use: cover the answer, say yours out loud first, then check.

====================================================================
SECTION A — CORE CONCEPTS (transferable anywhere)
====================================================================

[R] Q: Image vs container?
A: Image = static, immutable artifact (code + runtime + deps + config, in layers). Container = a running instance of that image.

[R] Q: I built an image successfully. What have I proven and NOT proven?
A: Proven: the image assembles. NOT proven: the app starts. Build success != run success. Always run it and read logs.

[R] Q: Build time vs run time?
A: Build time happens once when the image is made (installs, compiling). Run time happens every container start. Slow one-time work (like compiling TypeScript) belongs at build time so the container starts fast.

[R] Q: What does EXPOSE actually do?
A: Documentation only. Declares the port the app listens on. Does NOT open or publish anything. Publishing happens at run with -p.

[J] Q: In -p 8080:3000, which is host, which is container, and what is actually listening?
A: 8080 = host (outside doorknob). 3000 = container (where the app lives). The app is ALWAYS listening on 3000; -p just wires host 8080 to that already-open port.

[R] Q: How do I pass an environment variable into a container at run time?
A: docker run -e VARNAME=value <image>. (Like -p but for env vars.)

[J] Q: Why never bake a secret (like JWT_SECRET) into an image?
A: Anyone who pulls the image can read baked-in values. Secrets are injected at run time (-e, env files, secret managers), never built into the image.

====================================================================
SECTION B — DEBUGGING SKILLS (the moves that found each problem)
====================================================================

[R] Q: First command when a container misbehaves or exits?
A: docker logs <container>. Read what it printed before dying.

[R] Q: How do I look inside a running container?
A: docker exec -it <container> sh

[R] Q: How do I inspect an image whose container exits instantly?
A: docker run -it <image> sh  (override the start command, drop into a shell)

[J] Q: A build fails. How do I tell if it is my Dockerfile's fault or the host's?
A: Read WHERE it failed. Inside a RUN step = code/config problem. At "exporting to image" after all steps passed = host problem (usually disk). Location of failure tells you the category.

[J] Q: When an error is a wall of text, what is the first move?
A: Sort it into categories. On Day 2 the TS errors were two kinds: "cannot find module" (missing deps) vs real type errors (in test files). Different categories, different fixes. Do not treat one big wall as one problem.

[R] Q: A "cannot find module X" error means what, mechanically?
A: The code imports X but X is not installed/present. Either it was never installed, or it was installed somewhere the code cannot see. (Day 1 express, Day 2 helmet/sentry/bcrypt.)

[J] Q: The overall debugging principle from this whole session?
A: When in doubt, go LOOK (ls, cat, grep, read the deploy config). Almost every wrong assumption I made came from guessing instead of reading.

====================================================================
SECTION C — NATIVE MODULES + BASE IMAGE (Wall 1, my wrong instinct)
====================================================================

[J] Q: I first picked node:20-alpine because "minimal, fewer build tools needed." Why was that reasoning backwards?
A: My app has native modules (bcrypt, better-sqlite3) that COMPILE on install, and compiling needs build tools. Alpine strips those tools out. I picked the toolless image right before a step that needs tools.

[J] Q: Why did node:20 (full) fix it, and what is the tradeoff?
A: The full image ships the complete build toolchain, so native modules compile with no extra work. Tradeoff: ~1GB image. The fix for the size is a multi-stage build.

[R] Q: Why did the native-module compile NOT break my build, when I expected it to?
A: Because I chose the full node:20 image. The earlier base-image decision PREVENTED the wall. (Lesson: prevent walls by reasoning about the next step before locking the base.)

[R] Q: alpine vs slim vs full node image, one line each?
A: alpine = smallest, musl libc, no build tools (native modules hard). slim = small, Debian, normal libc, trimmed tools. full = biggest, complete toolchain (native modules just work).

====================================================================
SECTION D — LOCKFILES + NPM CI vs INSTALL (Wall 5)
====================================================================

[R] Q: What is a lockfile (package-lock.json)?
A: The RECEIPT. package.json lists version ranges ("^6.0.0" = any 6.x). The lockfile pins the EXACT version of every package so every install is byte-for-byte identical. It makes builds reproducible.

[R] Q: npm ci vs npm install?
A: npm ci = strict, installs exact pinned versions from the lockfile, REFUSES to run if package.json and lockfile disagree. npm install = forgiving, resolves ranges fresh, can update the lockfile.

[J] Q: My npm ci failed with "package.json and package-lock.json not in sync." What did that mean for MY repo?
A: Mobile deps (react-native/metro) were added to the root package.json but the lockfile was never regenerated to match. The receipt and the list disagreed. ci refuses on drift by design.

[J] Q: Why did this never break on Railway but broke in my container?
A: Railway uses npm install (forgiving, just resolves and updates the lock). My container used npm ci (strict). The strict tool caught real drift the loose tool had been hiding.

[J] Q: I switched to npm install to unblock. What did I give up, and why was it OK?
A: Gave up ci's reproducibility guarantee. OK because it matches what Railway actually does, and I LOGGED the real fix (regenerate the lockfile locally, test, commit) as a separate task. Knowing tradeoff, not an accident.

[R] Q: How do I check if a specific file exists?
A: ls <path>. Prints the path if it exists, "No such file or directory" if not.

====================================================================
SECTION E — THE MONOREPO + WRONG PACKAGE.JSON (Walls 2-4)
====================================================================

[J] Q: How do I tell which package.json owns the backend in a monorepo?
A: Read name and scripts first. Backend start runs a server (node dist/index.js); frontend runs a bundler (vite build). Then scan deps for the framework tell (express = backend, react/vite = frontend, db driver = backend). The package.json inside the service folder usually owns that service. A bloated root is a kitchen sink.

[J] Q: My Step 0 assumption was "server/package.json owns the backend deps." Why was that wrong?
A: It owned only SOME of them. Others (helmet, sentry, bcrypt, web-push) lived only in the ROOT package.json. The deps are SPLIT. The truth was in railway.json, which installs from root.

[J] Q: Where is the ground truth for how an app really builds and runs?
A: The deployment config (railway.json, Procfile, Dockerfile, CI yaml). Its buildCommand and startCommand override any theory about how it "should" work.

[R] Q: What did railway.json reveal that rewrote three of my Dockerfile lines?
A: (1) installs from ROOT, not server/; (2) two build scripts: build = vite (frontend), build:server = tsc backend; (3) start path is dist/server/index.js, not dist/index.js.

[J] Q: Containerizing surfaced these problems. How do I decide where to fix them?
A: Ask "packaging problem or project problem?" Packaging (wrong COPY) = fix in Dockerfile. Project (split deps, stale lockfile, tests in build) = fix in the repo. Docker often just EXPOSES latent project problems.

[J] Q: Why match Railway instead of refactoring the project to make server/ self-contained?
A: Goal this week is to containerize the real working app and understand it, not re-architect dependency management before camp. Refactor is a worthy but separate task. Containerize reality first.

====================================================================
SECTION F — TYPESCRIPT IN A CONTAINER (Walls 2-4)
====================================================================

[R] Q: Why can't the container just run my .ts files?
A: Node runs JavaScript, not TypeScript. The .ts must be COMPILED to .js (by tsc) before Node can run it. The container runs the compiled output, never the source.

[J] Q: How do I recognize a project needs a compile step?
A: .ts files, a tsconfig.json, and a start script that runs a DIFFERENT file than the source (from dist/ or build/). If start runs dist/index.js but source is .ts, something compiled it and the container must too.

[R] Q: The TS build-then-run sequence?
A: Build time: tsc reads .ts + tsconfig, writes .js to dist/ (once). Run time: node runs the compiled .js. The catch: dist/ only exists if the Dockerfile compiles it.

[J] Q: My build failed compiling test files. Why, and how was it already solved?
A: My `npm run build` used the WRONG tsconfig (server/tsconfig.json, compiles everything including __tests__). The REAL backend build, `npm run build:server`, uses tsconfig.server.json which already excludes tests. Fix = use the right build command, which uses the right config.

[R] Q: What does tsconfig.server.json specify that matters?
A: outDir: dist/server (why the run path is dist/server/index.js), include: server/**/* (compiles only the server folder, expects a folder named server), exclude: tests.

====================================================================
SECTION G — COPY MECHANICS (the tricky folder line)
====================================================================

[J] Q: Why COPY server/ ./server/ instead of COPY server/ ./ ?
A: ./server/ keeps the files inside a folder named server (lands at /home/app/server/...). ./ flattens the contents into the workdir. tsconfig.server.json includes "server/**/*" and expects a server/ FOLDER, so flattening would leave nothing for tsc to compile.

[R] Q: Why did I also need COPY tsconfig.server.json ./ ?
A: The build command is `tsc -p tsconfig.server.json`, so that config file must be present in the image or tsc cannot find it.

[R] Q: When a single COPY has multiple source files, what must the destination be?
A: A directory ending in / (e.g. ./). Because you cannot copy two files onto one filename.

[R] Q: Why copy package.json + lockfile FIRST, before the source code?
A: Layer caching. Deps change rarely, code changes constantly. Copy deps and install first so that layer stays CACHED when you later change code. (Day 1 proof: a no-change rebuild went 9.7s -> 1.4s, all CACHED.)

====================================================================
SECTION H — DISK / CLEANUP (Wall 6)
====================================================================

[J] Q: Build ran through every step then failed at "exporting to image: no space left on device." Whose fault?
A: The host's, not the Dockerfile's. All steps passed; Docker just could not write layers to a full disk.

[R] Q: Why does Docker fill up the disk?
A: It does not auto-clean. Every build leaves layers and cache; old images and stopped containers persist.

[R] Q: Commands to check disk and reclaim space?
A: df -h / (disk), docker system df (Docker's usage), docker system prune -a -f (remove unused images, stopped containers, build cache).

[R] Q: Remove all containers at once?
A: docker rm $(docker ps -aq)

====================================================================
SECTION I — RUNTIME CONFIG (Wall 7, the open one)
====================================================================

[J] Q: My container built but exited with "FATAL: JWT_SECRET not set." Is this a Docker failure?
A: No. The app ran its own startup (made the data dir, enabled foreign keys) and deliberately refused to start without a required secret. The image is correct; the container just lacks runtime config.

[R] Q: How do I find every environment variable my backend reads?
A: grep -rn "process.env" ~/projects/Wize/server --include=*.ts | grep -v __tests__

[R] Q: How do I give the container that secret at run time?
A: docker run -e JWT_SECRET=value ... (one -e per variable).

====================================================================
SECTION J — WIZE-SPECIFIC FACTS (memorize for this app)
====================================================================

[R] Q: What port does the Wize backend listen on and how?
A: Reads process.env.PORT, defaults to 3001.

[R] Q: Which command builds the Wize backend and what does it produce?
A: npm run build:server (= tsc -p tsconfig.server.json). Compiles server/**/* (no tests) into dist/server/.

[R] Q: What is the Wize backend's run command, and what does --import do?
A: node --import ./dist/server/instrument.js dist/server/index.js. The --import preloads Sentry monitoring before the app, so errors are caught from the start. Matches the real start script.

[R] Q: Where do Wize's backend dependencies actually live?
A: Split. Many (helmet, sentry, bcrypt, web-push) are only in the ROOT package.json. Install from root.

[R] Q: What does railway.json say the build and start commands are?
A: build: npm install && npm run build && npm run build:server. start: node dist/server/index.js. Plus a volume at /app/data for SQLite.

[R] Q: Why does Wize have a volume at /app/data (note for Week 2)?
A: The SQLite database persists there. Container data is otherwise lost on restart; volumes give persistence. (Week 2 topic.)
