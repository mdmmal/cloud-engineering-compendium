# Concern 6 — Wize DevOps Curriculum
## Full Spec | Jamal Muhammad | May 2, 2026
## The project that proves everything

---

## WHAT WIZE IS

A productivity PWA that tracks progress and activities across many tasks and
focuses them into one goal or objective. The metrics it tracks allow you to
develop along a path you choose regardless of task and time.

Built entirely with vibe coding and limited code knowledge.
Currently live on Railway (backend) and Vercel (frontend).
Actively deploying from GitHub PRs automatically.
Has a SQLite database with a persistent volume.

This is not a tutorial project. This is a real app in production.
The Wize DevOps build is you taking ownership of infrastructure you
already proved works — and building it yourself from scratch.

---

## WHAT THE RECRUITER FEELS

When they open the Wize project folder six months from now they feel:
blown away. Impressed. Like they're looking at someone who built an entirely
functional app with minimal code knowledge and then mastered the DevOps
layer so completely they can explain every operational decision like the
back of their hand.

That feeling is engineered through specific documentation.
It does not happen by accident.
It happens because the README is honest and specific.
The build-log captures every real struggle and resolution.
The architecture diagram shows the evolution from "I have no idea what
I'm doing" to "here is the exact infrastructure I designed and why."

---

## WHAT YOU ALREADY HAVE WITHOUT KNOWING IT

Looking at your Railway dashboard:
- Live production deployment — real infrastructure running right now
- GitHub PR-triggered deployments — you already have CI/CD, you just didn't
  build it. Railway gave it to you. The GitHub Actions pipeline replaces this
  with something you control and understand.
- Persistent SQLite volume (web-volume) — you already solved the data
  persistence problem. When you containerize, you'll solve it yourself.
- us-west2 region deployment — you've already made an infrastructure decision.

And one more thing you have that you haven't looked at yet: Sentry.

---

## SENTRY — THE OBSERVABILITY YOU ALREADY HAVE

### What Sentry actually is

Sentry is error tracking. When your Express backend throws an unhandled
exception or your React frontend crashes, Sentry captures the full error —
stack trace, the exact line of code that caused it, the user's browser,
the request that triggered it — and sends it to your Sentry dashboard.
You get the information before a user files a complaint.

### What you have right now without knowing it

Every time Wize crashes or throws an error in production, Sentry has been
capturing it. You have a history of real production errors sitting in your
Sentry dashboard right now that you've never looked at.
That is real observability data on a real app.

**Action — do this before the build starts:**
Open your Sentry dashboard. Look at what's there.
What errors exist? Are there recent ones? How often do they occur?
Screenshot the dashboard. That screenshot is a LinkedIn post:

"My app has been running in production.
Here's what Sentry caught while I wasn't looking.
This is why observability matters.
[Sentry dashboard screenshot]"

### How Sentry plays into the Wize build

Sentry is passive right now — it catches errors and you don't look at it.
The build makes it active in two specific places.

**Week 4 (CI/CD) — Release tracking:**
Add a Sentry release notification to the GitHub Actions pipeline.
Every deployment tells Sentry "version X.X just deployed at [timestamp]."
If errors spike after a deployment, Sentry shows you exactly which release
introduced the problem. This is how real engineering teams use Sentry —
not just to catch errors but to connect errors to specific deployments.

Pipeline step to add:
```yaml
- name: Notify Sentry of release
  run: |
    npx @sentry/cli releases new ${{ github.sha }}
    npx @sentry/cli releases set-commits ${{ github.sha }} --auto
    npx @sentry/cli releases finalize ${{ github.sha }}
  env:
    SENTRY_AUTH_TOKEN: ${{ secrets.SENTRY_AUTH_TOKEN }}
    SENTRY_ORG: your-org
    SENTRY_PROJECT: wize-backend
```

Commit:
```
wize: cicd — sentry release tracking added to deploy pipeline
```

**Week 5 (Monitoring) — Active observability stack:**
Sentry becomes one of three monitoring layers alongside CloudWatch
and UptimeRobot. Each layer watches a different thing:

| Tool | Watches | Alerts When |
|---|---|---|
| CloudWatch | Infrastructure (CPU, memory, disk) | Server is unhealthy |
| Sentry | Application errors (crashes, exceptions) | Code is throwing errors |
| UptimeRobot | Uptime (is the app responding?) | App is unreachable |

Together they cover the full picture.
CloudWatch tells you the server is fine.
Sentry tells you the app is crashing.
UptimeRobot tells you users can't reach it.
You need all three because each one catches what the others miss.

**The Week 5 runbook includes Sentry:**
```
When Wize goes down at 2am:

1. Check UptimeRobot — is the app responding at all?
2. Check CloudWatch — is the EC2 instance healthy? CPU, memory, disk.
3. Check Sentry — what errors fired in the last hour?
   Look for: spike in errors, new error types, errors matching deploy time
4. SSH into EC2 — check docker compose ps, check container logs
5. Decision: rollback deployment or fix forward
```

### The Sentry section in the README

Add this to the Wize README under observability:

```markdown
## Observability Stack

| Layer | Tool | What It Watches |
|---|---|---|
| Infrastructure | CloudWatch | EC2 CPU, memory, disk |
| Application errors | Sentry | Crashes, exceptions, failed requests |
| Uptime | UptimeRobot | App availability from outside |

Sentry was set up when the app was first built but never actively used.
During the DevOps build it became part of an active monitoring workflow —
release tracking in the CI/CD pipeline and error triage in the runbook.
```

### Post seed from Sentry

Before the build even starts, looking at the Sentry dashboard generates content.

Post 1 — Before build (open Sentry dashboard now):
"My app has been running in production for months.
Here's what Sentry caught while I wasn't looking at it.
[Sentry error dashboard screenshot]
Observability isn't just setup. It's actually looking at what you set up."

Post 2 — After Week 4 pipeline integration:
"Added Sentry release tracking to my GitHub Actions pipeline.
Now every deployment tells Sentry exactly when it happened.
If errors spike after a push, I know which commit caused it.
[GitHub Actions step showing Sentry release notification]"

Post 3 — After Week 5 runbook:
"Built my 2am runbook for Wize.
Three tools. Three layers. Three different things they each catch.
[Screenshot of runbook or Sentry + CloudWatch side by side]"

The Wize DevOps build is not starting from zero.
It's taking ownership of what already exists.

---

## THE STANDARD

Half-assing the Wize build looks like:
- Minimal contribution, leaving it up to AI
- No weekly commits and no weekly documentation proof
- Shotty work, missing days and missing weeks
- No posts, no proof of work, messy GitHub
- No proper coaching and teaching between each project stage
- No context, no real learning, cheating
- "Here I did this but I don't know how or why. I just followed instructions."

The standard is the opposite of every item above.
This statement lives as the first entry in build-log.md before any code is written.

---

## PRE-DAY 15 ORIENTATION — REQUIRED BEFORE DOCKERFILE

**When:** Before May 11. One session. 20 minutes.
**Where:** Wize chat — coach mode, not builder mode.
**What:** Answer these four questions about your own backend.

The Wize chat walks you through the codebase to find:

```
1. Entry point file
   What is the main file that starts the Express server?
   (Probably server.js, index.js, or app.js in the root or src/)
   Why it matters: The Dockerfile's CMD instruction runs this file.

2. Port number
   What port does the Express server listen on?
   (Look for app.listen(PORT) or process.env.PORT)
   Why it matters: Docker EXPOSE and -p flag need this exact port.

3. Environment variables
   What variables does the app expect? (Look for process.env.ANYTHING)
   Why it matters: The container needs these passed in or it breaks silently.

4. Dependencies
   Does package.json have a start script?
   Are there any native dependencies that need OS packages?
   Why it matters: The Dockerfile installs these before starting the app.
```

After this session you can answer: "What does my backend need to run?"
If you cannot answer that question, you are not ready to write a Dockerfile.

**Wize chat coaching format:**
Explain first. Then ask you to prove you understood.
It calls upon things you should know from your current track.
It has context from CONTEXT.md about where you are in the curriculum.
It bridges gaps — if you don't understand something, it connects it to
a concept you've already learned in bash or Python.

---

## THE WEEK-BY-WEEK BUILD

One thing per week. Done properly. No rushing.
Weeks align with your Docker track starting in June.
The codebase orientation happens in the 9 days before Week 1.

---

### PRE-WEEK — Orientation (Before May 11)

**Goal:** Know your own backend before you touch it.

**Tasks:**
- Open Wize backend codebase
- Wize chat session: find entry point, port, env vars, dependencies
- Answer the four orientation questions without help
- Write first build-log entry (the standard statement)
- Update architecture.md with current state (Railway + Vercel baseline)

**Commit:**
```
wize: docs — pre-week orientation, baseline architecture documented
```

**Post:**
"Before you can DevOps something you have to understand it.
I built this app. Then I let Railway run it for me.
Now I'm taking it back. Starting with understanding what's actually in it.
[screenshot of Railway dashboard showing live deployment]"

**Wize chat coaching questions you must answer:**
- What file starts your Express server?
- What port does it listen on?
- What happens if PORT environment variable isn't set?

---

### WEEK 1 — Dockerize the Backend (May 11–17)

**Concepts required:** Docker basics (LabEx Docker labs must be started)
**Goal:** Express backend runs in a Docker container locally.

**What you're doing:**
Writing a Dockerfile that packages the Express app so it runs anywhere
without Railway. The container replaces Railway's managed environment
with something you built and control.

**The SQLite volume problem:**
SQLite is a file on disk. When a container stops, the file disappears
unless you mount a volume. This is your first real DevOps problem.
You'll solve it the same way Railway solved it — with a persistent volume.
But you'll do it yourself.

**Tasks:**
- Read the orientation answers from pre-week
- Write Dockerfile for Express backend
- Build the image: `docker build -t wize-backend .`
- Run it: `docker run -p 3000:3000 wize-backend`
- Hit it with curl: `curl http://localhost:3000/health`
- Fix what breaks (something will break)
- Add volume mount for SQLite: `-v $(pwd)/data:/app/data`
- Document what broke and what fixed it in build-log.md

**Expected breakpoints:**
- Wrong CMD instruction (app doesn't start)
- Port mismatch (container port vs host port)
- Missing environment variables (app starts but crashes)
- SQLite file not found (volume not mounted correctly)

**Commit sequence:**
```
wize: project — Dockerfile backend v1, first build attempt
wize: project — Dockerfile backend v2, port fix
wize: project — Dockerfile backend v3, SQLite volume mount working
wize: docs — week1 build-log, what broke and what fixed it
```

**Post (post when something breaks AND when it fixes):**
Break post:
"Dockerizing my own app for the first time.
3 hours in. Container keeps crashing on startup.
The error: [screenshot of error output]
Working through it. #DevOps #BuildingInPublic"

Fix post:
"Fixed it. The Dockerfile was using the wrong entry point.
Container is running. SQLite volume mounted.
Curl returning 200. Here's what the Dockerfile looks like now.
[screenshot of terminal showing successful curl response]"

**Wize chat coaching questions you must answer after Week 1:**
- What does FROM in a Dockerfile tell Docker?
- Why does the SQLite data disappear without a volume mount?
- What's the difference between EXPOSE and -p when you run the container?

**Architecture at end of Week 1:**
```
Frontend: Vercel (unchanged)
Backend:  Docker container (local) — replacing Railway locally
Database: SQLite in Docker volume (local)
CI/CD:    Railway still running in production
```

---

### WEEK 2 — Dockerize the Frontend + Compose (May 18–24)

**Concepts required:** Docker Compose basics
**Goal:** Frontend and backend run together locally with Docker Compose.

**The networking problem:**
The React frontend needs to call the Express backend API.
In production they're on different domains.
In Docker Compose they're on the same Docker network — same problem as VPC.
You configure them to talk to each other by container name, not IP.
This is DNS inside Docker. Same concept from the networking trainer.

**Tasks:**
- Write Dockerfile for React frontend (Vite build + serve)
- Write docker-compose.yml with both services
- Configure frontend to call backend by container name
- Run both: `docker compose up`
- Test the full flow: frontend loads, calls backend, data returns
- Document the networking configuration in build-log.md

**Expected breakpoints:**
- CORS errors (frontend and backend on different origins even in Docker)
- Container can't reach backend by hostname (DNS not configured in compose)
- Vite build produces static files but serve command wrong
- Environment variables not passed to React build (VITE_ prefix required)

**Commit sequence:**
```
wize: project — Dockerfile frontend v1, Vite build
wize: project — docker-compose.yml v1, both services
wize: project — docker-compose.yml v2, networking fixed
wize: docs — week2 build-log, CORS and container DNS documented
```

**Post:**
"Two containers. One compose file. They're talking to each other.
The frontend calls the backend by container name — same as DNS in a VPC.
I built the networking trainer. Now I'm using it on my own app.
[screenshot of docker compose up with both services running]"

**Wize chat coaching questions you must answer after Week 2:**
- How do containers on the same Docker network find each other?
- Why does VITE_API_URL have to be set at build time not runtime?
- What does `docker compose down` do to your data?

**Architecture at end of Week 2:**
```
Frontend: Docker container (local, Vite build served by nginx)
Backend:  Docker container (local, Express)
Database: SQLite in Docker volume
Network:  Docker bridge network (containers talk by name)
CI/CD:    Railway still running in production
```

---

### WEEK 3 — Deploy to EC2 (May 25–31)

**Concepts required:** AWS EC2, VPC basics, SSH (already know from Linux track)
**Goal:** Both containers running on a real EC2 instance. App accessible via public IP.

**This is where networking becomes real:**
You're deploying into a VPC. You'll configure a security group
to allow port 3000 (backend) and port 80 (frontend).
You'll SSH into the EC2 instance — same as your Linux labs but on real AWS infrastructure.
The networking trainer scenarios you've been running are exactly this.

**Tasks:**
- Launch EC2 instance (t2.micro, Ubuntu, free tier)
- SSH into it: `ssh -i key.pem ubuntu@[public-ip]`
- Install Docker on EC2
- Push Docker images to Docker Hub (or build on EC2 directly)
- Run docker-compose.yml on EC2
- Configure security group: allow 80, 443, 22, 3000
- Access Wize from your laptop via EC2 public IP
- Document every AWS decision in build-log.md

**Expected breakpoints:**
- Security group blocking ports (networking trainer scenario)
- Docker not installed correctly on EC2
- SQLite volume data not persisting (need EC2 volume or EBS)
- Frontend calling localhost instead of EC2 public IP (env var issue)
- SSH timeout (wrong key or security group blocking 22)

**Commit sequence:**
```
wize: project — EC2 deployment v1, SSH working
wize: project — EC2 deployment v2, containers running
wize: docs — week3 build-log, AWS security group config documented
wize: docs — architecture updated, EC2 deployment diagram
```

**Post:**
"My app is running on infrastructure I control.
Not Railway. Not Vercel's managed platform.
An EC2 instance I configured, SSHed into, and deployed to myself.
Here's the security group that almost blocked me.
[screenshot of terminal SSHed into EC2 running docker compose ps]"

**Wize chat coaching questions you must answer after Week 3:**
- What is a security group and why did you need to configure it?
- What's the difference between the public IP and private IP of your EC2 instance?
- Why does your app data disappear if you terminate the EC2 instance?

**Architecture at end of Week 3:**
```
Frontend: Docker container on EC2 t2.micro (us-east-1)
Backend:  Docker container on EC2 t2.micro (us-east-1)
Database: SQLite on EC2 instance storage (temporary)
Network:  VPC, public subnet, security group (80, 443, 22, 3000)
CI/CD:    Railway still running (will replace next)
```

---

### WEEK 4 — GitHub Actions CI/CD Pipeline (June 1–7)

**Concepts required:** GitHub Actions basics, Docker Hub
**Goal:** Push to main branch automatically deploys Wize to EC2.

**The connection:**
You've been watching Railway deploy Wize automatically on every PR.
You didn't build that pipeline — Railway did.
This week you build it yourself with GitHub Actions.
Every push to main: builds both Docker images, pushes to Docker Hub,
SSHes into EC2, pulls new images, restarts containers.
You replace Railway with something you understand completely.

**Tasks:**
- Create Docker Hub account, push both images
- Write .github/workflows/deploy.yml
- Configure GitHub secrets (EC2 IP, SSH key, Docker credentials)
- Push a change to main, watch the pipeline run
- Verify the change deployed to EC2 automatically
- Document the pipeline stages in build-log.md

**Expected breakpoints:**
- GitHub secrets misconfigured (pipeline fails at auth)
- SSH into EC2 from GitHub Actions (needs proper key setup)
- Docker pull fails on EC2 (credentials not passed)
- Old containers not stopped before new ones start

**Commit sequence:**
```
wize: cicd — github actions deploy.yml v1
wize: cicd — github actions deploy.yml v2, SSH fix
wize: cicd — github actions deploy.yml v3, full pipeline working
wize: docs — week4 build-log, CI/CD pipeline documented end to end
```

**Post:**
"I pushed a change to main.
47 seconds later it was live on my EC2 instance. Automatically.
I built this pipeline. Here's every stage and what each one does.
[screenshot of GitHub Actions workflow running green]"

**Wize chat coaching questions you must answer after Week 4:**
- Walk through every stage in your deploy.yml and explain what it does.
- What happens if the Docker build fails? Does the old version stay up?
- What's the difference between GitHub Actions and what Railway was doing?

**Architecture at end of Week 4:**
```
Frontend: Docker on EC2, auto-deployed via GitHub Actions
Backend:  Docker on EC2, auto-deployed via GitHub Actions
Database: SQLite on EC2 instance storage
Network:  VPC, public subnet, security group
CI/CD:    GitHub Actions (push to main → build → push → deploy)
Railway:  Decommissioned. You replaced it.
```

---

### WEEK 5 — Monitoring + Observability (June 8–14)

**Concepts required:** CloudWatch basics, basic Prometheus understanding
**Goal:** Know when Wize is down before users do.

**Tasks:**
- Set up CloudWatch alarm on EC2 CPU utilization
- Add a basic health check endpoint to Express if not already there
- Configure uptime monitoring (UptimeRobot free tier)
- Add logging to the GitHub Actions pipeline
- Document what you'd check if Wize went down at 2am (runbook)

**Commit sequence:**
```
wize: monitoring — CloudWatch CPU alarm configured
wize: monitoring — health check endpoint added to Express
wize: docs — week5 build-log, observability layer documented
wize: docs — runbook, what to check when Wize goes down
```

**Post:**
"Set up monitoring on my app today.
Got paged by a CloudWatch alarm I triggered on purpose.
Here's my runbook — what I'd check if Wize went down at 2am.
[screenshot of CloudWatch alarm in ALARM state]"

---

### WEEK 6 — Terraform (June 15–21)

**Concepts required:** Terraform basics (from Phase 2 curriculum)
**Goal:** Recreate the EC2 + VPC + security group from code, not the console.

**The payoff:**
Everything you clicked through in the AWS console to set up Week 3
gets replaced by a Terraform config. You run `terraform apply` and
the entire infrastructure rebuilds from scratch. You run `terraform destroy`
and it disappears cleanly. This is infrastructure as code.

**Tasks:**
- Write main.tf with VPC, subnet, security group, EC2 instance
- Run `terraform plan` — review what it will create
- Run `terraform apply` — watch it build the infrastructure
- Verify Wize still deploys correctly to the new infrastructure
- Run `terraform destroy` — watch it clean up completely
- Document state management in build-log.md

**Commit sequence:**
```
wize: terraform — main.tf VPC and security group
wize: terraform — main.tf EC2 instance and outputs
wize: terraform — terraform.tfvars with variables
wize: docs — week6 build-log, IaC replacing manual console setup
```

**Post:**
"Ran one command. My entire AWS infrastructure rebuilt from scratch.
Ran another command. It disappeared cleanly.
This is Terraform. This is why infrastructure as code matters.
[screenshot of terraform apply showing resources created]"

---

## THE BUILD-LOG FORMAT

Every week gets one entry. Written after the work is done.
Honest. Specific. Your words.

```markdown
## Week [X] — [What You Did] ([Date range])

### What I did
[Bullet points. Specific actions taken.]

### What broke
[Honest account. The exact error. How long it took.]
[This is the most important section.]

### What I learned
[The concept this forced you to understand.]
[Not what the docs say. What YOU now know.]

### The decision I made and why
[One infrastructure or configuration decision you made intentionally.]
[Why you chose this approach over alternatives.]

### Architecture at end of this week
[Simple text description of current state.]

### What I'd do differently
[One thing. Honest reflection.]

### Commits this week
[List of commit messages]

### Post published
[Link or text of what you posted]
```

---

## THE ARCHITECTURE EVOLUTION

This document starts simple and grows every week.
The progression is the story.

```markdown
# Wize Architecture — Evolution

## Baseline (Before DevOps Build)
Frontend: Vercel (managed, no control)
Backend:  Railway (managed, auto-deploy from GitHub PRs)
Database: SQLite on Railway volume (managed)
CI/CD:    Railway handles automatically
Monitoring: Sentry for errors only

## After Week 1 (Docker Local)
Backend: Docker container (local)
Database: SQLite in Docker volume (local)
[I understand what's inside my own app now]

## After Week 2 (Compose Local)
Frontend: Docker container (local, nginx serving Vite build)
Backend:  Docker container (local)
Network:  Docker bridge (containers talk by name — same as DNS)
[I understand how my two services communicate]

## After Week 3 (EC2 Deploy)
Frontend: Docker on EC2 t2.micro (us-east-1)
Backend:  Docker on EC2 t2.micro (us-east-1)
Network:  VPC, public subnet, security group (80, 443, 22, 3000)
[I control the infrastructure now]

## After Week 4 (GitHub Actions)
CI/CD: GitHub Actions — push to main → build → push → deploy
Railway: Decommissioned. Replaced with something I built.
[I understand CI/CD because I built it]

## After Week 5 (Monitoring)
Monitoring: CloudWatch CPU alarm, UptimeRobot uptime
Observability: Health check endpoint, pipeline logging
[I know when Wize is down before users do]

## After Week 6 (Terraform)
Infrastructure: Defined as code in main.tf
IaC: terraform apply rebuilds everything from scratch
[I can destroy and recreate my entire infrastructure in one command]
```

---

## THE WIZE CHAT — COACHING FORMAT

The Wize chat is a coach. Not a builder. Not an AI doing the work.

What it does:
- Explains what you're about to touch before you touch it
- Connects it to concepts you've already learned (bash, networking, Python)
- Asks questions you must answer before it helps with the next step
- Surfaces the three things you need to know for the current task
- Reads CONTEXT.md to know where you are in the curriculum
- Does NOT write the Dockerfile for you
- Does NOT debug your code without you attempting it first

Coaching trigger phrases:
"I'm about to do Week X of the Wize build"
→ Wize chat explains what Week X involves and asks orientation questions

"Something broke"
→ Wize chat asks: what command did you run, what was the output,
  what did you try already — before suggesting anything

"I don't understand X"
→ Wize chat explains X then connects it to something you already know:
  "This is the same as [bash concept] but in Docker context"

---

## THE README — FINAL STATE (Write as you go, update weekly)

```markdown
# Wize — DevOps Build

## What Wize Is
[3 sentences. What the app does. Who it's for. What problem it solves.]

I built Wize with limited code knowledge using AI assistance.
It's been live in production since [date].
Then I decided to take full ownership of the infrastructure.

## Before the DevOps Build
- Frontend: Vercel (I clicked deploy, it handled everything)
- Backend: Railway (auto-deployed from GitHub PRs)
- CI/CD: Railway gave it to me for free
- Monitoring: Sentry, set up in an afternoon
- My understanding of the infrastructure: zero

## The DevOps Build
[Table showing each week, what was added, and the key thing learned]

| Week | What I Added | Key Learning |
|---|---|---|
| Pre | Codebase orientation | I didn't understand my own app |
| 1 | Dockerized backend | Containers, volumes, SQLite persistence |
| 2 | Dockerized frontend + Compose | Container networking = DNS |
| 3 | Deployed to EC2 | VPC, security groups, SSH |
| 4 | GitHub Actions pipeline | I replaced Railway with something I built |
| 5 | CloudWatch monitoring | Know when it's down before users do |
| 6 | Terraform | Infrastructure as code, destroy and rebuild |

## Current Architecture
[Final architecture diagram]

## What Broke (The Honest Section)
[This section is the most important one for a recruiter to read]
[Every major breakpoint. How long it took. What fixed it.]

## Build Log
[Link to build-log.md]

## The Things I Can Explain
- Why the SQLite volume matters and what happens without it
- How the frontend finds the backend in Docker (container DNS)
- What a security group does and why port 3000 wasn't open by default
- Every stage in the GitHub Actions pipeline and what would break if removed
- How Terraform knows what already exists and what needs to change
```

---

## RUNNING LOG ITEMS FROM THIS CONCERN

**→ Execution list — Pre-Week orientation:**
Wize chat session before May 11. Four questions. Twenty minutes.
Entry point, port, env vars, dependencies. Must answer without help after.

**→ Execution list — Write first build-log entry before any code:**
The standard statement. "Half-assing looks like this. I will not do this."
Commit it before Week 1 starts.

**→ Concern 3 (Documentation):**
Wize folder structure already defined. build-log.md and architecture.md
templates from Concern 3 apply directly to this curriculum.
Weekly commits follow the naming convention from Concern 3.

**→ Concern 4 (Networking):**
Week 2 (container networking) and Week 3 (VPC, security groups) are where
the networking trainer concepts become real. The DNS scenarios from the
trainer map directly to container-to-container communication in Compose.
The security group scenarios map directly to Week 3 EC2 deployment.

**→ Concern 2 (Continuity):**
Wize chat needs CONTEXT.md access to know curriculum position.
Session output format applies to Wize chat sessions.
Weekly build-log entry = weekly summary input for that track.

**→ Concern 12 (Ultimate DevOps Trainer):**
Every breakpoint in the Wize build is a future scenario in the DevOps trainer.
SQLite volume disappearing, CORS blocking cross-container calls,
security group locking out SSH — these are real incidents.
Document them in build-log.md. They become trainer content.
