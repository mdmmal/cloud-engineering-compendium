# Concern 3 — Documentation and Visibility
## Full Scope Spec | Jamal Muhammad | Cloud Engineering Compendium
## Addressed: May 2, 2026 | Covers: Week 5 → December 2026

---

## THE UNIFYING PRINCIPLE

Everything in the repo agrees with everything else because everything follows the same rules.
The folder structure, the note format, the commit messages, the README style, the weekly
summaries — they all speak the same language.

A recruiter opening it six months from now doesn't see a collection of files.
They see a system someone built intentionally.

The story it tells: started somewhere, built something real, documented every step.
That story is visible in two places simultaneously — inside the repo (commit history,
folder progression, build logs) and in a narrative document that connects it all.

---

## COMPONENT 1 — Git Architecture (Full Journey)

### The One Rule

```
main = only clean, reviewed, working code
       nothing goes to main without a commit message that means something
       no experiment branches, no "test123", no unnamed pushes

feature branches = where work happens
                   named precisely
                   merged when the work is complete
                   deleted after merge
```

### Branch Naming Convention — Global

```
[track]/[type]/[descriptor]

track:       linux | python | networking | aws | docker | wize | terraform | k8s
type:        lab | review | script | project | notes | challenge
descriptor:  short, lowercase, hyphens only

Examples:
linux/challenge/bash-14day
linux/lab/week2-day3
python/script/log-analyzer
python/lab/guided-week1
networking/notes/dns-dhcp
aws/project/vpc-build
wize/project/dockerize
wize/project/ec2-deploy
wize/project/cicd-pipeline
terraform/lab/week1
```

### Commit Message Convention — Global

```
[track]: [type] — [what it does]

linux: script — readiness_check.sh deployment gate validator
linux: lab — week2 day3 file system operations
linux: docs — scripts README DevOps context index
python: script — log_analyzer.py error counter with file output
python: lab — guided week1 functions and variables
networking: notes — DNS and DHCP Jeremy's IT Lab video 3
aws: lab — IAM user role policy least privilege
wize: project — Dockerfile Express backend v1
wize: docs — week1 build log what broke and why
docs: weekly — week6 summary all tracks
docs: readme — top level portfolio README update
```

### What Gets Committed — Global Rules

```
ALWAYS commit:
  Every script written (lab, review, challenge, project)
  Every note file after a video or lab
  Every weekly summary
  Every README update
  Every diagram (photo or file)
  Every project milestone

NEVER commit:
  Half-written scripts with broken syntax
  Empty files as placeholders
  Files named "test" or "temp" or "untitled"
  Secrets, API keys, passwords
  Node_modules or build artifacts
```

---

## COMPONENT 2 — Full Folder Architecture

Scales to everything confirmed in this project.
Not a redesign — an extension of what exists with consistent rules applied globally.

```
cloud-engineering-compendium/
│
├── README.md                          ← top-level portfolio README
├── PROJECT-STATE.md                   ← living state document
│
├── _daily/                            ← daily session files
│   ├── today.md                       ← active day file (overwritten each day)
│   └── archive/                       ← past today.md files if needed
│
├── _weekly/                           ← weekly summaries (permanent record)
│   ├── week-05-summary.md
│   ├── week-06-summary.md
│   └── ...
│
├── linux/
│   ├── README.md
│   ├── scripts/
│   │   ├── README.md                  ← script index with DevOps context
│   │   ├── challenge/
│   │   │   └── 14-day/               ← all 14-day challenge scripts
│   │   ├── guided/
│   │   │   ├── week1/
│   │   │   ├── week2/
│   │   │   └── ...
│   │   └── projects/                  ← scripts that belong to a project
│   └── notes/
│       ├── README.md
│       ├── week1/
│       │   ├── day1-bash-basics.md
│       │   └── day2-variables.md
│       └── week2/
│
├── python/
│   ├── README.md
│   ├── scripts/
│   │   ├── README.md
│   │   ├── challenge/
│   │   ├── guided/
│   │   │   ├── week1/
│   │   │   └── week2/
│   │   └── projects/
│   └── notes/
│       ├── week1/
│       └── week2/
│
├── networking/
│   ├── README.md
│   └── notes/
│       ├── ccna/
│       │   ├── video-01-tcp-ip-model.md
│       │   ├── video-02-ipv4-addressing.md
│       │   └── ...
│       └── trainer-sessions/
│           ├── session-01.md
│           └── ...
│
├── aws/
│   ├── README.md
│   ├── labs/
│   │   ├── week8-iam.md
│   │   └── week9-vpc-build.md
│   └── notes/
│
├── docker/
│   ├── README.md
│   └── labs/
│
├── cicd/
│   ├── README.md
│   └── labs/
│
├── terraform/
│   ├── README.md
│   └── labs/
│
├── kubernetes/
│   ├── README.md
│   └── labs/
│
├── projects/
│   ├── README.md
│   └── wize-devops/
│       ├── README.md                  ← what Wize is + full DevOps build story
│       ├── build-log.md               ← weekly: what was done, what broke, learned
│       ├── architecture.md            ← current diagram + evolution over time
│       ├── docker/
│       │   ├── Dockerfile.backend
│       │   ├── Dockerfile.frontend
│       │   └── docker-compose.yml
│       ├── cicd/
│       │   └── .github/workflows/
│       ├── terraform/
│       │   └── main.tf
│       └── monitoring/
│           └── cloudwatch-setup.md
│
├── certifications/
│   ├── README.md
│   ├── cloud-practitioner/
│   │   ├── study-notes.md
│   │   └── practice-exam-scores.md
│   └── saa-c03/
│       ├── study-notes.md
│       └── practice-exam-scores.md
│
├── career/
│   ├── README.md
│   ├── resume-current.md
│   ├── job-applications.md            ← tracker: company, role, date, status
│   └── interview-prep/
│       ├── linux-troubleshooting.md
│       ├── networking-scenarios.md
│       └── system-design.md
│
└── templates/
    ├── today-template.md
    ├── weekly-summary-template.md
    ├── note-template.md
    ├── script-header-template.sh
    └── handoff-template.md
```

---

## COMPONENT 3 — The Top-Level README

Combination document — professional structure, your voice, your journey visible.
Fill in the brackets. Commit today.

```markdown
# Cloud Engineering Compendium
### Jamal Muhammad | CS Student → Junior DevOps Engineer | DFW

---

This repo is the proof of work.

I'm a CS student at East Central University graduating December 2026,
building toward a junior DevOps/SRE role in the DFW area.
Everything in here is real — scripts I wrote, labs I ran,
concepts I worked through, and projects I built.

Not a course certificate. Not a tutorial clone.
Work I did.

---

## What's in here

| Track | What It Is | Status |
|---|---|---|
| [Linux + Bash](./linux/) | Shell scripting, system admin, ops automation | Active |
| [Python](./python/) | Automation scripts, file I/O, API calls | Active |
| [Networking](./networking/) | TCP/IP, DNS, subnetting, VPC concepts | Active |
| [AWS](./aws/) | Hands-on labs, VPC builds, IAM, EC2 | Starting Week 8 |
| [Docker](./docker/) | Containerization, Dockerfiles, Compose | Starting June |
| [Projects](./projects/) | Real deployments — Wize PWA DevOps build | Starting May |
| [Certifications](./certifications/) | Cloud Practitioner, SAA-C03 study | In progress |
| [Career](./career/) | Resume, applications, interview prep | Active |

---

## Current focus

[Update this line every week]
14-day bash scripting challenge — Day X of 14.
Writing one DevOps-relevant script per day.
Every script maps to a real production scenario.

→ [See the scripts](./linux/scripts/)
→ [Follow the build on LinkedIn]([your LinkedIn URL])

---

## The goal

Junior DevOps Engineer role by December 2026.
Building the foundation: Linux, Python, Bash, Networking, AWS, Docker, CI/CD, Terraform.
Documenting everything publicly.

---

## Connect

GitHub: github.com/mdmmal
LinkedIn: [your LinkedIn URL]
```

---

## COMPONENT 4 — The Note Template

The unifier. Every note file across every track follows this exact format.
No more flat text. No more inconsistent AI-generated notes.
One template. Applied everywhere.

```markdown
# [Topic Name]
**Track:** Linux | Python | Networking | AWS | Docker | Terraform | Kubernetes
**Source:** [LabEx lab name | Jeremy's IT Lab video # | CS50P week # | other]
**Date:** [date]
**Week:** Week [X] | Day [X]

---

## What This Is
[2–3 sentences in your own words. What is this concept?
Not a definition. Your understanding of it.]

---

## How It Works
[The mechanism. Step by step if needed.
Short. No filler. What actually happens.]

---

## The DevOps Connection
[One paragraph. Where does this show up in real DevOps work?
What breaks if you don't understand it?
What tool does this become later?]

---

## Commands / Syntax
[Only what's relevant. Code blocks only.
No walls of commands you'll never use.]

​```bash
# example with comment explaining why
command --flag argument
​```

---

## What I Got Wrong First
[Honest. What confused you or what you had to fix.
This is the most valuable section for future you.]

---

## Quick Recall
[3–5 bullet points. The things you'd need to remember
in an interview or in a terminal at 2am.]

-
-
-

---

## Connected To
[What came before this that it builds on.
What comes after this that it feeds into.]

Before: [concept]
After: [concept / tool]
```

---

## COMPONENT 5 — The Script Header Template

Goes at the top of every script. Same session as the commit. Non-negotiable.
When you sit down to write a post, this comment block is the post.
You already wrote it at commit time.

```bash
#!/bin/bash
# ============================================================
# Script:       [filename.sh]
# Track:        Linux / Bash
# Week:         Week [X] | Day [X]
# Challenge:    [challenge name if applicable]
# ============================================================
# What it does:
#   [2–3 sentences. Plain language. What happens when you run it.]
#
# DevOps context:
#   [Where this shows up in real DevOps work.
#    What production scenario this maps to.]
#
# Real scenario:
#   [One sentence. The actual situation. "On-call engineer runs
#    this before approving an emergency deploy at 2am."]
# ============================================================
```

---

## COMPONENT 6 — The Weekly Summary Template

Daily logs roll up here. This is what stays permanently.
`today.md` gets overwritten each day.
Weekly summary is the permanent record.

```markdown
# Week [X] Summary
**Dates:** [Monday] — [Sunday]
**Challenge:** [Active challenge name + day range this week]
**Phase:** Phase 1 | Phase 2 | etc.

---

## What Got Done

### Linux / Bash
- [script name]: [one sentence — what it does]
- [script name]: [one sentence — what it does]

### Python
- [script or concept]: [one sentence]

### Networking
- [videos or trainer sessions]: [one sentence]

### Projects
- [Wize or other]: [what stage, what was added]

### Career
- Commits this week: [number]
- LinkedIn posts: [number + topics]
- X posts: [number]
- Connections made: [number]

---

## The Most Important Thing I Built This Week
[One paragraph. The script, concept, or project milestone
that mattered most. Why it mattered. Your words.]

---

## What Broke and What Fixed It
[Honest account of what didn't work.
How you diagnosed it. What the fix was.
This section is interview content.]

---

## DevOps Connections Made This Week
[The moments where something clicked —
where a concept connected to a real tool or real scenario.]

---

## Commits This Week
[Copy from git log --oneline | head -20]

---

## What's Next
[Top 3 priorities for next week. Specific. Named.]
1.
2.
3.

---

## Post Seeds Collected
[Post ideas from this week — saved here for Sunday post]
-
-
-
```

---

## COMPONENT 7 — The Wize Project Folder Spec

What a recruiter finds when they open `projects/wize-devops/` six months from now.

### wize-devops/README.md

Two sections. What Wize is — brief, your words, what the app does and what stack it runs on.
The DevOps build story — what you added week by week, what the final architecture looks like.
Written in your voice. Not generated. Updated each milestone.

### wize-devops/build-log.md

The honest weekly record. What you tried, what broke, what you learned, what you fixed.
This is the document that proves you actually did the work.
A recruiter reading this knows within two minutes whether you understand what you built.

```markdown
# Wize DevOps Build Log

## What Wize Is
[3 sentences. What the app does. Tech stack. What you built from scratch.]

Wize is a PWA built with React 18, Express 5, SQLite, JWT auth, and Sentry.
It runs on Vercel (frontend) and Railway (backend).
I built it. Now I'm DevOps-ing it.

---

## Week 1 — Dockerize the Backend (Date range)

### What I did
[Specific actions taken]

### What broke
[Honest. What failed. What the error was.]

### What I learned
[The concept that this forced you to understand]

### Architecture at end of this week
[Simple text diagram or description]
Backend: Express app → Dockerfile → Docker container (local)
Frontend: Still on Vercel

---

## Week 2 — Dockerize the Frontend + Compose (Date range)

### What I did
### What broke
### What I learned
### Architecture at end of this week

[Continues through every week of the build]
```

### wize-devops/architecture.md

Starts simple. Evolves with each stage. The progression is the story.

```markdown
# Wize Architecture — Evolution

## Week 1 (Baseline — before DevOps)
Frontend: Vercel
Backend: Railway
Database: SQLite (embedded)
Auth: JWT + bcrypt
Monitoring: Sentry

## Week 3 (After Dockerize)
Frontend: Vercel
Backend: Docker container (local → EC2)
Database: SQLite in Docker volume
CI/CD: None yet

## Week 5 (After EC2 Deploy)
Frontend: Vercel
Backend: Docker on EC2 (t2.micro, us-east-1)
Database: SQLite in Docker volume
Networking: VPC, public subnet, security group (443, 22)
CI/CD: None yet

## Week 8 (After GitHub Actions)
[continues]

## Week 12 (After Terraform)
[final state]
```

---

## COMPONENT 8 — The Posting System (Full Scope, All Stages)

Not just the 14-day challenge. Every stage through December has a defined post type.

### Stage 1 — Foundation (Now → Week 7)
**Post type:** Challenge posts. Daily X. Weekly LinkedIn recap.
**Visual:** Terminal output screenshots. Script side-by-sides.
**Frequency:** Daily X. Sunday LinkedIn.

### Stage 2 — AWS Hands-On (Week 8–10)
**Post type:** "I built X on AWS" posts. Architecture diagrams.
**Visual:** AWS architecture diagrams (Excalidraw). VPC diagrams drawn by hand.
**Frequency:** 2x per week LinkedIn. Daily X.

### Stage 3 — Docker + Wize Project (June–July)
**Post type:** "Here's what I added to my app this week."
**Visual:** App running in Docker. docker-compose output. EC2 terminal.
**Frequency:** Weekly LinkedIn on project milestone. Daily X.

### Stage 4 — CI/CD + Terraform (August)
**Post type:** "Here's the pipeline I built." Architecture evolution posts.
**Visual:** GitHub Actions workflow running. Terraform plan output.
**Frequency:** Weekly LinkedIn. Daily X.

### Stage 5 — Applying (September+)
**Post type:** "Here's what I learned building toward this role."
**Visual:** GitHub contribution graph. Full project architecture diagram.
**Frequency:** 2x weekly LinkedIn through application period.

---

### The Four Visual Types — In Rotation

```
TYPE 1 — Terminal screenshot
Dark theme. Clean font. One clear output visible.
Crop to show only what matters.
No scrollbars. No clutter. No desktop background visible.
Shows: script running, output, result — not the code itself.

TYPE 2 — Architecture diagram
Tool: Excalidraw (free, browser-based) or draw.io
Maximum 5 boxes per diagram.
Arrows labeled. Clean white or dark background.
Export as PNG. Never screenshot the tool interface.
Shows: how components connect, not just what they are.

TYPE 3 — Text graphic
Tool: Canva
Dark background. White text. One key insight large.
Your handle small at the bottom.
Use for concepts, not code.
Shows: the insight, not the work — use sparingly.

TYPE 4 — Hand-drawn photo
Paper or whiteboard. Good lighting. Clean surface.
VPC diagrams. System designs. Flowcharts.
Photograph straight-on. Crop tight.
Shows: you can think architecturally, not just type.
```

### What Makes a Bad Screenshot

```
BAD:
  A wall of code with no output — nobody reads it in a feed
  Error messages with no context — looks like struggling
  Generic file trees with nothing highlighted — just noise
  Tutorial completion certificates with no context
  Screenshots of other people's work or documentation
  Scrollbars visible, desktop icons visible, other tabs visible
  Dark code on white background — hard to read on mobile
```

### The Post Template — All Stages

Three hook options. Pick one per post. Rotate.

```
HOOK TYPE 1 — The scenario
"It's 2am. Production is down.
Here's the first script you run."

HOOK TYPE 2 — The contrast
"Day 1 I wrote echo statements.
Day 7 I wrote this."
[screenshot]

HOOK TYPE 3 — The honest observation
"I didn't know this mapped to Jenkins until I looked it up.
Now I understand why it exists."
```

Post body — always this structure:

```
[HOOK]

[What it is — one sentence, plain language]
[What it does — 2–3 short lines, specific]
[Why it exists in production — one sentence]

[Screenshot]

[What's next — one line]

Building in the Open — [series marker if applicable]
#DevOps #CloudEngineering #BuildingInPublic [relevant tech tags]
```

Voice rules — enforced on every post:
- Short declarative sentences
- No em dashes
- No Oxford commas
- No "I'm excited to share"
- No "thrilled to announce"
- Dry and confident, not enthusiastic and vague

---

## COMPONENT 9 — The DevOps Connection for All 18 Existing Scripts

Run through this list. Add the script header template to each one. One session.
Commit all 18 with message: `linux: docs — DevOps context headers added to all scripts`

| Script | DevOps Connection |
|---|---|
| `deploy_check.sh` | Pre-deployment environment snapshot — first thing before any release |
| `readiness_check.sh` | Jenkins pre-stage gate — blocks deployment if system not ready |
| `tag_parser.sh` | Deploy tag validation — parsing version strings in CI pipelines |
| `health_snapshot.sh` | On-call first look — system state at time of incident |
| `hostname_parser.sh` | Fleet identification — parsing server names in multi-region deployments |
| `log_checker.sh` | Manual log triage — before setting up centralized logging |
| `pipeline_run.sh` | Pipeline simulation — manual version of what Jenkins automates |
| `preflight.sh` | CI/CD pre-flight — runs before pipeline stages begin |
| `env_check.sh` | Environment validation — confirms correct config before deploy |
| `billing_calc.sh` | Cloud cost estimation — pre-provisioning resource cost check |
| `cost_calc.sh` | Infrastructure cost calculator — sizing decisions before Terraform |
| `deploy_gate.sh` | Deployment gate — conditional block on environment readiness |
| `deploy_select.sh` | Environment selector — targets dev/staging/production in pipeline |
| `provision_size.sh` | Resource sizing — calculates instance needs before provisioning |
| `provision_start.sh` | Provisioning kickoff — validates inputs before infrastructure creation |
| `resource_calc.sh` | Resource calculator — pre-deployment capacity planning |
| `server_list.sh` | Fleet inventory — lists servers before fleet-wide operations |
| `system_gate.sh` | System gate check — blocks operations if system state is unhealthy |

---

## COMPONENT 10 — The Repo Cleanup Spec

*Execution goes to the separate repo chat. This is the spec it follows.*

### Phase 1 — Branch Cleanup (Run in this order)

```bash
# See all branches including remote
git branch -a

# Delete a merged local branch
git branch -d branch-name

# Delete a bad remote branch
git push origin --delete branch-name

# Rename a badly named branch (while checked out on it)
git branch -m old-name new-name
git push origin -u new-name
git push origin --delete old-name

# Verify what's left
git branch -a
```

**Keep:** main and any branch with unmerged work
**Delete:** anything already merged, anything badly named

### Phase 2 — Folder Structure Implementation

Move existing files into the new architecture defined in Component 2.
Do not delete anything. Move and verify.

```bash
# Example moves
mkdir -p linux/scripts/challenge/14-day
mv linux/scripts/*.sh linux/scripts/challenge/14-day/

mkdir -p linux/scripts/guided/week1
# move guided lab scripts

mkdir -p linux/notes/week1
# move notes
```

### Phase 3 — Template Files

Copy all templates from `templates/` folder into place.
Verify each one opens correctly.
Commit: `docs: templates folder — note, weekly, today, script header, handoff`

---

## IMPLEMENTATION SEQUENCE

### This week
1. Commit `PROJECT-STATE.md` — done
2. Add script header template to all 18 scripts — one session
3. Commit top-level README
4. Post 1 goes live — `readiness_check.sh`

### Repo cleanup session (separate chat)
1. Branch cleanup commands
2. Folder architecture implementation
3. Move existing files to correct locations
4. Commit templates folder

### Ongoing — every week
1. Fill `today.md` from pre-populated files
2. Commit daily with correct message format
3. Roll up to `_weekly/week-XX-summary.md` on Sunday
4. Post on Sunday from week's post seeds

### Every project milestone (Wize)
1. Update `build-log.md`
2. Update `architecture.md`
3. Update top-level `README.md`
4. Post on LinkedIn

### Every challenge completion
1. Write README for that track's folder
2. Write and post the capstone LinkedIn post
3. Start the next challenge immediately

---

## RUNNING LOG ITEMS FROM THIS CONCERN

**→ Repo execution chat:** Gets Component 10 (cleanup spec) first,
then Component 2 (folder architecture). In that order. Do not combine.

**→ Script comment blocks:** 18 scripts need the header from Component 5.
One session. Do before the next post goes live.

**→ Note template:** Commit to `templates/note-template.md`.
Apply retroactively to existing notes in one session.

**→ Concern 6 (Wize):** Folder structure and build-log template defined here.
Week-by-week curriculum still needs to be built when we address Concern 6.

**→ Concern 9 (LinkedIn):** Stage-by-stage posting system defined here.
Post templates and visual types defined here.
Volume strategy and connection strategy still needed in Concern 9.

**→ Concern 4 (Networking):** Tool needs to simulate environments
and show cause/effect. Redesign needed — not addressed here.

**→ Unix system admin class notes + bash video notes:**
Need to be folded into guided lab material.
Flag when building bash lab structure.
