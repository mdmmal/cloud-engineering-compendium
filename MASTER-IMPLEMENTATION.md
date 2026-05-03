# MASTER IMPLEMENTATION
## Jamal Muhammad — DevOps/SRE Career Build
## Compiled: May 2, 2026 | Target: Junior DevOps Engineer, DFW, December 2026

---

> The plan is done. This document tells you what to do.
> Open it daily. Scan the execution list. Do the next unchecked item.
> Update it Sunday. Close it and go work.

---

# SECTION 1 — THE NORTH STAR

## Who You Are

Jamal Muhammad. CS student at East Central University, Ada OK.
Graduating December 2026. 6'3" wide receiver and DB. All A's.
Spring ball ended. This is the execution window.

## What You're Building Toward

Junior DevOps Engineer or SRE-adjacent role in DFW.
Not IT helpdesk. Not support. A role where you script, automate, and deploy things.
No experience required — proof of work required.
Applications start September 1, 2026.

## The Standard

Half-assing looks like: minimal contribution, no weekly commits, no documentation,
no posts, no proof of work, following instructions without understanding why.

The standard is the opposite of every item above.
"Here I did this but I don't know how or why" is not acceptable.
Proof of work. Daily commits. Weekly posts. Real understanding.

## The Hard Dates (Nothing Moves These)

```
July 15, 2026      Cloud Practitioner exam — SCHEDULE TODAY IF NOT DONE
September 1, 2026  Applications start
September 15, 2026 SAA-C03 exam
December 2026      Graduate with an offer
```

## The Wize One-Liner (Use Everywhere)

"Wize is a productivity PWA that tracks activity across multiple goals
and surfaces metrics showing whether your daily work is actually moving you forward."

---

# SECTION 2 — THE SYSTEM MAP

## How Everything Connects

```
WORK HAPPENS IN SPECIALIZED CHATS:
  Bash Chat           → SESSION OUTPUT → handoff to project chat
  Python Labs Chat    → SESSION OUTPUT → handoff to project chat
  Wize Build Chat     → SESSION OUTPUT → handoff to project chat
  LabEx Project Chat  → SESSION OUTPUT → handoff to project chat
  LinkedIn Post Chat  → formats post seeds → post goes live
  GitHub Chat         → executes repo specs → confirms done

TOOLS AUTO-REPORT AT SESSION END:
  Network Trainer     → session report (performance + post seed + next action)
  Python Trainer      → session report (score + weak areas + post seed)
  Linux CMD Trainer   → session report (objectives + performance + post seed)
  Subnet Tool         → session report (accuracy + missed + post seed)
  DevOps Trainer      → session report (tier + path + narrative + adaptive signal)

COORDINATION IN PROJECT CHAT (this one):
  Tracks state | Builds specs | Addresses new concerns
  Updates CONTEXT.md | Updates CHAT-CONTEXT.md
  Receives all handoffs | Runs adaptive plan updates

THE CONTINUITY LOOP:
  Daily session → SESSION OUTPUT → update CONTEXT.md (2 fields)
  Sunday → weekly summary → update CONTEXT.md + CHAT-CONTEXT.md
  Sunday → adaptive plan check → update if needed
  Sunday → LinkedIn post from week's seeds → commit

THE FEEDBACK LOOP:
  Labs build syntax →
  Networking trainer builds diagnostics →
  Postmortem reading builds vocabulary →
  DevOps Trainer applies everything under pressure →
  Session report feeds adaptive plan →
  Adaptive plan adjusts daily stack →
  Labs respond to the gap →
  (repeat)
```

## The Dependency Map

```
BASH stable → unlocks Docker + LabEx Linux projects + Wize Week 1
PYTHON stable → unlocks Python projects + SAA-C03 boto3 scripts
NETWORKING VPC-ready → unlocks AWS Week 8 + Wize Week 3
AWS basics → unlocks Cloud Practitioner exam + Wize Week 3
DOCKER stable → unlocks Wize Week 1 + LabEx Docker projects + CI/CD
CI/CD basics → unlocks Wize Week 4
TERRAFORM basics → unlocks Wize Week 6

WIZE (sequential — each week unlocks next):
  Week 1 (Docker) → Week 2 (Compose) → Week 3 (EC2) →
  Week 4 (GitHub Actions) → Week 5 (Monitoring) → Week 6 (Terraform)

HARD DATE ANCHORS:
  July 15: Cloud Practitioner → requires AWS basics by June 15
  September 15: SAA-C03 → requires Maarek course started by August 1
  September 1: Applications → requires portfolio complete by August 31
```

## The Home Lab

```
NOW:
  Mac + Terminal          Development environment, bash, Python, git
  LabEx VM                Linux environment, labs, commands
  GitHub compendium       Public proof of work, 18+ scripts committed
  Wize (Railway/Vercel)   Live production app, Sentry monitoring, GitOps

WEEK 8 (AWS starts):
  AWS free tier           Real VPC, EC2, S3, IAM, CloudWatch

JUNE (Docker starts):
  Docker on Mac           Local container environment

WIZE WEEK 3:
  EC2 instance            Wize running on infrastructure you control

DECEMBER:
  Full home lab:          VPC + EC2 + Docker + GitHub Actions +
                          CloudWatch + Sentry + Terraform IaC
                          All built on a real app you wrote from scratch
```

---

# SECTION 3 — THE CURRICULUM TIMELINE

## Phase 1 — Foundation (Now → End of May)

### The Daily Stack (Every Day, No Exceptions)

```
Morning block (60-90 min):
  Track: Bash OR Python (alternating or as today.md dictates)
  Task: Lab or script from today.md pre-populated file
  Commit immediately with message from today.md

Mid block (45-60 min):
  Track: Networking
  Task: 3+ Network Trainer scenarios OR 1 Jeremy's IT Lab video + 4 outputs
  Subnetting: 5 problems minimum
  Commit notes

Evening block (30-45 min):
  Iterate on current script or Wize orientation
  Update CONTEXT.md two daily fields
  git add . && git commit -m "specific message" && git push

Daily minimum non-negotiables:
  Networking: 3 trainer scenarios
  Subnetting: 5 problems
  Commit: something every single day
```

### Week 5 (Now — May 2-8): Close Foundation Gaps

```
Bash:       trap_handler.sh (Day 5) → file_audit.sh → fs_explorer.sh →
            log_monitor.sh → backup_rotate.sh
Python:     CS50P Week 1 — functions, loops → ex_compare_values.py
Networking: DevOps Network Trainer 3+ scenarios daily
            Jeremy's IT Lab: TCP/IP Model, IPv4 Parts 1+2
Career:     Post readiness_check.sh TODAY
            Change LinkedIn headline TODAY
            Fix Open to Work job titles TODAY
            10 connection requests this week
```

### Week 6 (May 9-15): Systems Deepening

```
Bash:       health_monitor.sh → deploy_pipeline.sh (Day 11) →
            server_inventory.sh → alert_manager.sh
Python:     CS50P — file I/O, try/except → log_analyzer.py → config_reader.py
Networking: Jeremy's IT Lab: Subnetting Parts 1-3, Routing, Life of a Packet
            Network Trainer: DNS + Routing scenarios
Career:     Sunday post: 5-day bash recap
            LinkedIn About section written
            10 more connections
```

### Week 7 (May 16-22): Capstone + Phase 1 Exit

```
Bash:       ops_toolkit.sh (Day 14 capstone) — CHALLENGE COMPLETE
            linux/scripts/README.md written
Python:     CS50P problem set attempt + cli_tool.py
Networking: Jeremy's IT Lab: DNS, DHCP, NAT, Standard ACLs
            Draw VPC from memory — no looking
Career:     14-day capstone LinkedIn post
            Phase 1 exit criteria self-check
            First DevOps Trainer session: The Slow Server (Friday May 16)
Pre-Wize:   Wize orientation session — entry point, port, env vars, dependencies
            First build-log.md entry: the standard statement
```

### Phase 1 Exit Criteria (Check All Before Phase 2)

```
Linux/Bash:
  [ ] Navigate filesystem from memory (ls, cd, cat, grep, pipes)
  [ ] Check and kill processes (ps, top, kill)
  [ ] Manage services (systemctl start/stop/status)
  [ ] Edit file in vim (open, type, save, quit)
  [ ] 5+ bash scripts committed with DevOps context headers
  [ ] ping, curl, dig from memory

Python:
  [ ] Variables, lists, dicts, loops, if/else, functions — write cold
  [ ] Read and write files
  [ ] Parse JSON
  [ ] try/except
  [ ] 5+ scripts committed

Networking:
  [ ] Explain IP addresses and subnet masks in plain English
  [ ] Subnet /24 into /26s on paper without calculator
  [ ] Explain routing, DNS, DHCP, NAT in plain English
  [ ] Draw VPC from memory — label every component
  [ ] All Tier 1 CCNA priority videos with notes committed

Git/Career:
  [ ] 40+ commits with clear messages
  [ ] Organized repo: linux/, python/, networking/
  [ ] 4+ LinkedIn posts published
  [ ] 20+ people followed in DevOps/cloud space
  [ ] 30+ comments made on DevOps content
```

---

## Phase 2 — Build (June → August)

### Week 8 (May 25 — June 7): AWS Foundations

```
AWS:        IAM — create user, role, policy, understand least privilege
            Build VPC from scratch:
              Public subnet + private subnet
              Internet Gateway attached
              NAT Gateway in public subnet
              Route tables configured for both subnets
              Security groups for web server and database
Python:     boto3 intro — list EC2 instances
Wize:       Week 1 — Dockerize Express backend
            Write Dockerfile, build image, run container, mount SQLite volume
Career:     Post: "Set up IAM. Here's what least privilege actually means."
            Post: "Built a VPC from scratch."
            Schedule Cloud Practitioner exam if not done
```

### Week 9 (June 8-14): EC2 + Wize on Real Infrastructure

```
AWS:        Launch EC2 inside VPC. SSH in. Install Docker.
            S3 bucket — upload files, set permissions
            CloudWatch alarm on EC2 CPU
Wize:       Week 2 — Dockerize frontend + Docker Compose
            docker-compose.yml — both services running together
            Fix CORS + container DNS
Career:     Post: "Wize is running on infrastructure I control."
            Post: "Two containers talking to each other — here's the networking."
```

### Week 10 (June 15-21): CI/CD + Cloud Practitioner Prep

```
CI/CD:      Write .github/workflows/deploy.yml
            Configure GitHub secrets
            Pipeline triggers on push — builds, pushes, deploys
Wize:       Week 3 — Deploy to EC2
            Both containers on EC2, accessible via public IP
            Security group configured
Cert prep:  Cloud Practitioner — AWS Skill Builder + Tutorials Dojo
            Start: 1 hour per day minimum
Career:     Post: "Push to main. 47 seconds later it's live on EC2. I built this."
```

### Week 11 (June 22-28): Cloud Practitioner Final Prep

```
Cert prep:  4+ practice exams on Tutorials Dojo
            Score 80%+ before scheduling final exam
Wize:       Week 4 — GitHub Actions pipeline
            Replace Railway with pipeline you built
            Sentry release tracking added to pipeline
Career:     Post: "Replaced Railway with a CI/CD pipeline I built myself."
```

### JULY 15 — CLOUD PRACTITIONER EXAM

```
After passing:
  [ ] Add cert to LinkedIn immediately
  [ ] Add cert to resume (remove "in preparation")
  [ ] LinkedIn post: "Passed Cloud Practitioner. Here's what I had to understand."
  [ ] Start SAA-C03 prep: Maarek Udemy course begins
```

### Week 12-14 (July): Terraform + Wize Monitoring + SAA-C03

```
Terraform:  Write main.tf — provision same VPC + EC2 from code
            terraform init → plan → apply → destroy
            Wize Week 6: Terraform the Wize infrastructure
Wize:       Week 5 — CloudWatch monitoring + UptimeRobot + runbook
            Open Sentry dashboard — make it active not passive
SAA-C03:    Maarek course — 1 hour per day
Career:     Post: "Rebuilt my entire infrastructure with one command."
            Post: "Set up monitoring. Here's my 2am runbook for Wize."
```

### AUGUST — SAA-C03 Prep + Portfolio Polish

```
SAA-C03:    Tutorials Dojo practice exams — daily
            Score 80%+ consistently before September 15
Kubernetes: EKS basics — deploy Wize to managed Kubernetes cluster
Security:   Dedicated cloud security block:
            IAM deep dive + KMS + Secret Manager + audit logs
            Non-admin user exercise — observe limited permissions
            This is a gap from the 8-week roadmap — do not skip
Portfolio:  All project READMEs complete with architecture diagrams
            Wize build-log.md complete through Week 6
            compendium README updated with full project index
Career:     Resume final — all certs added, all Wize milestones updated
            LinkedIn: 20+ posts, 50+ connections, active commenter
            10 applications per week starting September 1
```

### SEPTEMBER 1 — APPLICATIONS OPEN

```
Resume must have:
  [ ] GitHub link in header (after repo cleanup done)
  [ ] DevOps skills section categorized
  [ ] Wize project with current milestone bullets
  [ ] Compendium project with 18+ scripts listed
  [ ] Cloud Practitioner certification date
  [ ] SAA-C03 "in preparation, target September 15"
  [ ] ECU CS December 2026 (UTEP removed)

LinkedIn must have:
  [ ] New headline: "CS Student → Junior DevOps Engineer | Bash · Python · AWS"
  [ ] About section written
  [ ] Terminal screenshot as banner
  [ ] Featured: compendium link
  [ ] 500+ connections targeted
  [ ] Active posting rhythm established
```

### SEPTEMBER 15 — SAA-C03 EXAM

### OCTOBER-NOVEMBER — INTERVIEWS

```
Interview prep running parallel to applications:
  Sadservers: daily — every problem is a potential interview question
  DevOps Trainer: weekly — Tier 2 scenarios active
  System design: draw and explain VPC architecture cold
  CI/CD explanation: what happens between git push and production — know cold
  Behavioral: every sadservers problem = a story, every Wize breakpoint = a story
```

---

# SECTION 4 — CHALLENGES

## Active Challenge

```
14-Day Bash Challenge — Day 5 of 14
Started: April 27, 2026
Ends: May 11, 2026
Visible proof: Script output screenshots
Daily X post: "Day [X]. [Script name]. [What it does]. [Why it matters]. #DevOps"
Capstone post: May 11 — "14 days of bash. Here's what I built."
```

## Challenge Sequence (In Order)

| # | Challenge | Duration | Starts | Visible Proof | Capstone |
|---|---|---|---|---|---|
| 1 | 14-Day Bash | 14 days | Apr 27 | Script output screenshot | May 11 LinkedIn post |
| 2 | Wize Week 1 — Dockerize | 7 days | May 15 | Container running screenshot | May 21 LinkedIn post |
| 3 | Wize Week 2 — Compose | 7 days | May 22 | docker compose up screenshot | May 28 post |
| 4 | Wize Week 3 — EC2 Deploy | 7 days | May 29 | SSH terminal + app running | June 4 post |
| 5 | 7 Days of Networking | 7 days | After trainer rebuilt | Trainer score + VPC diagram | LinkedIn capstone |
| 6 | Wize Week 4 — CI/CD | 7 days | June 5 | GitHub Actions green pipeline | June 11 post |
| 7 | Wize Week 5 — Monitoring | 7 days | June 12 | CloudWatch alarm + runbook | June 18 post |
| 8 | 7 Days of Python Scripts | 7 days | After CS50P Week 2 | Terminal output screenshots | LinkedIn capstone |
| 9 | Sadservers Week | 7 days | After bash complete | Problem solved or notes | Friday wrap post |
| 10 | Wize Week 6 — Terraform | 7 days | June 19 | terraform apply output | June 25 post |
| 11 | 30 Days of Commits | 30 days | Now — ongoing | GitHub graph screenshot | LinkedIn at day 30 |

## Challenge Card Format (Every Challenge)

```
Challenge:      [name]
Duration:       [X days]
Track:          [track]
Visible proof:  [what the screenshot shows]
Daily X post:   one sentence + screenshot
Capstone post:  LinkedIn — end of challenge summary
```

## Capstone Post Formula

```
Line 1: "[X] days of [Y]. Here's what I built."
Lines 2-4: "Day 1: [what you started with]
            Day [X]: [what you can do now]"
Line 5: "The [script/project/diagram] that proved it:" + screenshot
Line 6: "What changed: [3 specific bullets]"
Line 7: "What's next: [next challenge]"
Tags: #DevOps #CloudEngineering #BuildingInPublic + tech tags
GitHub link: first comment, not post body
```

---

# SECTION 5 — TOOLS AND CHAT ROSTER

## Initialization Blocks (Copy → Paste at Session Start)

---

### BASH SCRIPTING CHAT

```
CONTEXT:
Jamal Muhammad. CS student ECU, graduating December 2026.
Building toward Junior DevOps Engineer in DFW.

ROLE: Generate bash scripting labs and reviews.

CURRENT STATE:
14-day bash challenge: Day [X] of 14
Current concepts: [last concept covered]
Branch: linux/challenge/bash-14day
Commit convention: "linux: script — [filename] [what it does]"

LAB FORMAT (required — every lab):
Start with THE INCIDENT (plain English prompts 1-2, technical prompt 3+).
Show DESIRED OUTPUT before user writes any code.
Key explains: syntax + production context + pipeline position + what breaks without it.
Full format: docs/concerns/concern-1-script-intentionality.md

SCENARIO DESIGN RULES:
One root cause only. One optimal path. Max 2 wrong branches per node.
No hidden trick knowledge. Every wrong choice must be plausible under pressure.

SESSION OUTPUT (generate at end of every session):
# SESSION OUTPUT — Bash | [date] | Day [X]
## What happened: [bullets]
## Scripts committed: [filename: one sentence]
## Commit messages: ["linux: ..."]
## DevOps connection: [one sentence]
## Post seed: [what was built + why it matters]
## What's next: [specific next task]
## Context update — Last committed: [file] | Next action: [task]
```

---

### PYTHON LABS CHAT

```
CONTEXT:
Jamal Muhammad. CS student ECU, graduating December 2026.
Building toward Junior DevOps Engineer in DFW.

ROLE: Python scripting labs and reviews. CS50P progression.

CURRENT STATE:
CS50P: Week [X], current concept: [concept]
LabEx Python: Lab [X] of 30
Branch: python/lab/week[X]-day[X]
Commit convention: "python: script — [filename] [what it does]"

LAB FORMAT: Same incident-first format as bash.
Every script maps to a DevOps automation scenario.
Guided labs teach first. Review labs test retention. Regular labs apply.

SESSION OUTPUT (generate at end of every session):
# SESSION OUTPUT — Python | [date]
## What happened: [bullets]
## Scripts committed: [filename: one sentence]
## Commit messages: ["python: ..."]
## DevOps connection: [one sentence]
## Post seed: [what was built + why it matters]
## What's next: [specific next task]
## Context update — Last committed: [file] | Next action: [task]
```

---

### WIZE BUILD CHAT

```
CONTEXT:
Jamal Muhammad. CS student ECU, graduating December 2026.
Building toward Junior DevOps Engineer in DFW.

ROLE: Coach the Wize DevOps build. Not a builder — a coach.

Wize: live productivity PWA. React 18, Express 5, SQLite, JWT auth.
Currently: Railway (backend) + Vercel (frontend). Sentry active.
GitHub PR-triggered deployments already running (GitOps in practice).

COACHING RULES:
Explain first. Ask me to prove I understood before moving forward.
Connect everything to concepts already learned (bash, networking, Python).
Do NOT write code for me. Guide me to write it myself.
Do NOT move to next step until I can explain the current one.
Read CONTEXT.md for current curriculum position.

CURRENT BUILD WEEK: [Week X — what the week is doing]
CURRENT TASK: [specific task]

Full Wize curriculum: docs/concerns/concern-6-wize-curriculum.md

SESSION OUTPUT (generate at end of every session):
# SESSION OUTPUT — Wize Build | [date] | Week [X]
## What happened: [bullets]
## What was committed: [filename: one sentence]
## Commit messages: ["wize: ..."]
## What broke: [honest]
## What I learned: [concept this forced me to understand]
## Post seed: [what happened + why it matters in DevOps]
## What's next: [next task in the build]
## Context update — Last committed: [file] | Next action: [task]
```

---

### LABEX PROJECT CHAT

```
CONTEXT:
Jamal Muhammad. CS student ECU, graduating December 2026.
Building toward Junior DevOps Engineer in DFW.

ROLE: Coach LabEx guided projects. Not a builder — a coach.

COACHING RULES:
Pre-project orientation: three things I need to know before opening the lab.
Mid-project: "what does this command do?" before I run it.
Post-project: three questions I must answer without help.
Connect every project to Wize build week or Phase 2 curriculum.
Do NOT run commands for me.

CURRENT PROJECT: [project name]
CURRENT STEP: [step within the project]

Full project sequence: docs/concerns/concern-5-labex-projects.md

SESSION OUTPUT (generate at end of every session):
# SESSION OUTPUT — LabEx [project] | [date]
## Lab step completed: [what was done]
## What was new: [concept the lab introduced]
## What I already knew: [existing scripts that covered this]
## What broke: [honest]
## Commit messages: ["labex: ..."]
## Post seed: [what happened + why it matters]
## What's next: [next step or next project]
## Context update — Last committed: [file] | Next action: [task]
```

---

### LINKEDIN POST CHAT

```
CONTEXT:
Jamal Muhammad. CS student ECU, graduating December 2026.
Building toward Junior DevOps Engineer in DFW.
Building in public on GitHub and LinkedIn.

ROLE: Format LinkedIn posts from post seeds. One chat, all posts.

VOICE RULES (non-negotiable):
Short declarative sentences. No em dashes. No Oxford commas.
No "I'm excited to share" or "thrilled to announce."
Quiet confidence, dry humor. 4-8 sentences total.
No external links in post body — GitHub link in FIRST COMMENT only.

POST STRUCTURE:
[Hook: scenario, contrast, or honest observation]
[What it is — one sentence]
[What it does — 2-3 short lines, specific]
[Why it exists in production — one sentence]
[Screenshot reference]
[What's next — one line]
[Challenge marker if applicable: "Building in the Open — Day [X] of [Y]"]
[2-3 hashtags: #DevOps #CloudEngineering #BuildingInPublic + tech tags]

HOOK OPTIONS (rotate):
Type 1 — Scenario: "It's 2am. Production is down. Here's the first script you run."
Type 2 — Contrast: "Day 1 I wrote echo statements. Day 7 I wrote this." + screenshot
Type 3 — Honest: "I didn't know this mapped to Jenkins until I looked it up."

VISUALS (recommend one per post):
Type 1: Terminal screenshot (dark theme, clean output, crop tight, no scrollbars)
Type 2: Architecture diagram (Excalidraw, max 5 boxes, export as PNG)
Type 3: Text graphic (Canva, dark bg, white text, one key insight large)
Type 4: Hand-drawn diagram (paper/whiteboard, good lighting, straight-on photo)

INPUT: post seed from SESSION OUTPUT or today.md
OUTPUT: final post ready to copy + recommended visual type
```

---

### GITHUB COMPENDIUM CHAT

```
CONTEXT:
Jamal Muhammad. CS student ECU, graduating December 2026.
Repo: github.com/mdmmal/cloud-engineering-compendium

ROLE: Repo cleanup, folder structure, branch management only.

SPECS:
Branch naming: [track]/[type]/[descriptor]
Commit format: "[track]: [type] — [what it does]"
Folder structure: docs/concerns/concern-3-documentation-system.md

EXECUTION ORDER: Branch cleanup FIRST. Folder structure SECOND.
Never combine in one session.

OUTPUT: Confirm what was done, list commands run, confirm final state.
Brief summary to project chat when complete.
```

---

## Trainer Session Output Formats

### Network Trainer Session Report
```
# SESSION OUTPUT — Network Trainer | [date]
## Concept: [DNS / Routing / NAT / Security Groups / VPC / etc.]
## Scenarios completed: [X] of [Y available]
## Performance: Strong [X] | Partial [X] | Review [X]
## Weak areas: [specific topics]
## DevOps connection made: [script this connects to]
## AWS connection: [what this becomes in AWS]
## Post seed: [diagnosis scenario that could be a post]
## What to review: [specific concept or trainer scenario]
## Context update — Last: [concept] | Next: [concept or difficulty level]
```

### Python Trainer Session Report
```
# SESSION OUTPUT — Python Trainer | [date]
## Questions: [X] total — [X] quiz + [X] debugging
## Score: [X]% accuracy
## Concepts covered: [list]
## Missed questions: [specific concepts]
## Weak areas: [what to drill]
## Post seed: [what clicked this session]
## What's next: [next concept or CS50P week]
## Context update — Last: [concept] | Next: [task]
```

### Linux CMD Trainer Session Report
```
# SESSION OUTPUT — Linux CMD Trainer | [date]
## Objectives selected: [list]
## Objectives completed: [X] of [X]
## Commands drilled: [list]
## Performance per objective: [objective: score]
## Weakest area: [specific command or concept]
## DevOps connection: [what this maps to in production]
## Post seed: [command or concept worth posting about]
## Context update — Last: [objective] | Next: [objective]
```

### Subnet Tool Session Report
```
# SESSION OUTPUT — Subnet Tool | [date]
## Problems attempted: [X]
## Accuracy: [X]%
## Missed questions: [specific subnets or concepts]
## Speed: [average time per problem]
## VPC connection: [how today's subnetting maps to VPC design]
## Post seed: [subnetting insight worth sharing]
## Context update — Last: [concept] | Next: [drill type]
```

### DevOps Trainer Session Report
```
# SESSION OUTPUT — DevOps Trainer | [date]
## Scenario: [name + ID]
## Tier: [1 / 2 / 3] | Type: [beginning / middle]
## Performance: [OPTIMAL / ACCEPTABLE / LEARNING / ESCALATE]
## Steps taken: [X] (optimal: [X], +[X] over)
## Mistakes: [X] ([X] critical)
## First decision: [OPTIMAL / ACCEPTABLE / POOR]
## Your path: [node sequence]
## Optimal path: [node sequence]
## Weakest decision: [the specific node]
## Root cause: [what was actually wrong]
## Key concept: [the thing this scenario tested]
## Review resource: [trainer / lab / postmortem]
## DevOps connection: [what this maps to in production]
## Post seed: [what happened + what you learned in plain language]
## Adaptive plan signal: [if consistently wrong on a type, flag it]
## Commit: devops-trainer: [scenario-id] — [performance] — [key-concept]
## Next scenario: [recommendation]
```

---

# SECTION 6 — THE CAREER TRACK

## Resume (DevOps Framed — Built May 2, 2026)

File: `career/jamal-devops-resume.docx`
Markdown version: `career/resume-current.md`

**Update triggers:**

| Event | What to update |
|---|---|
| GitHub repo cleanup done | Add GitHub link to header |
| Wize Week 1 complete | Update Wize bullet: "Dockerized backend" |
| Wize Week 3 complete | Update Wize bullet: "Deployed to EC2" |
| Wize Week 4 complete | Update Wize bullet: "GitHub Actions pipeline live" |
| Cloud Practitioner passed | Replace "in preparation" with date |
| SAA-C03 passed | Replace "in preparation" with date |
| LabEx Project 1 complete | Add fleet_monitor.sh to compendium bullets |

## LinkedIn Profile Spec

**Headline:** "CS Student → Junior DevOps Engineer | Bash · Python · AWS · Building in Public"

**Open to Work job titles (fix today):**
Junior DevOps Engineer, Cloud Engineer, Site Reliability Engineer,
Infrastructure Engineer, Cloud Infrastructure Engineer, Junior SRE

**Location:** Dallas-Fort Worth Metroplex
**Work type:** On-site AND Hybrid AND Remote

**Banner:** Dark terminal screenshot of script output (readiness_check.sh)
Dimensions: 1584x396px

**Featured section:** GitHub compendium link (after repo cleanup)

## LinkedIn Activity System

**Posting:** One post per week minimum. Sunday. Non-negotiable.
Be available 90 minutes after posting to reply to comments.

**Commenting:** 2 posts per day. Monday through Friday.
Comment formula: Acknowledge + Add + Ask. Minimum 15 words.
First 60 minutes after a post goes live = highest impact.

**Tier 1 — comment on every post:**
Loweh Goodness, Danny Thompson, TechWorld with Nana,
Forrest Brazeal, Leon Noel

**Connections:** 10+ per week. Commenter rabbit hole method.
Search "DevOps engineer" + filter Dallas-Fort Worth.
Click into comments on posts. Connect with every commenter.

**Connection note:**
"Hey [name] — building toward a Junior DevOps role in DFW.
Following your content, learning a lot. Would love to connect."

## Application Strategy (September 1+)

**Volume:** 10 applications per week minimum.
**Where:** LinkedIn Jobs, Indeed, Glassdoor, Dice, company career pages.
**Targets:** Oracle, AT&T, USAA, Lockheed Martin, American Airlines (DFW-based)
**Titles to search:** Junior DevOps Engineer, Cloud Engineer, Associate DevOps,
Infrastructure Engineer, Junior SRE, Cloud Engineer I

**Resume tailoring:** Same base resume. Adjust skills section order to match
posting language. If they say "infrastructure as code" — that phrase appears.

**Application tracker:** `career/job-applications.md`
Fields: company, role, date applied, status, contact, notes.

## Interview Prep (Starts September 1, parallel to applications)

**The CLI/CD answer (know cold):**
"Push to main → webhook triggers → GitHub Actions pulls code →
builds Docker image → runs tests → pushes to ECR →
deploys to EC2 → health check → CloudWatch confirms healthy."

**The system design answer (draw it cold):**
Multi-AZ VPC: ALB in public subnets, EC2 in private subnets,
RDS Multi-AZ, S3 for static, CloudWatch monitoring.

**The DevOps definition (say it in your own words):**
"DevOps is the practice of automating the gap between writing code
and running it in production. My focus is the infrastructure side —
Linux servers, cloud environments, and the automation that keeps
everything running reliably."

**Behavioral stories:**
Every sadservers problem solved = a troubleshooting story.
Every Wize breakpoint = an incident story.
Every wrong path in the DevOps Trainer = a learning story.
Write these down. Practice saying them out loud.

---

# SECTION 7 — THE ADAPTIVE PLAN PROTOCOL

## The Readiness Bars

### BASH — Stable (→ unlocks Docker + Wize Week 1)
1. Write deployment gate script from scratch, no looking
2. Explain bash trap and when you'd use it in production
3. Write a loop that reads a file line by line
4. Explain difference between $? and $!
5. Write a function that takes arguments and returns a value
**4 of 5 = stable**

### PYTHON — Stable (→ unlocks Python projects)
1. Write function that reads JSON file and returns specific key
2. Write try/except for file not found with specific message
3. Write script that takes command line args and validates them
4. Explain dictionary comprehension and write one
5. Write script that calls external API and handles response
**4 of 5 = stable**

### NETWORKING — VPC-Ready (→ unlocks AWS Week 8)
1. Draw VPC from memory: public/private subnets, IGW, NAT, route tables, SGs
2. Explain difference between security group and NACL
3. Explain what happens when you run `dig google.com` step by step
4. Explain why private subnet server can reach internet but can't be reached
5. Explain longest prefix match in a routing table
**4 of 5 = VPC-ready**

### DOCKER — Stable (→ unlocks Wize Week 1 + LabEx Docker projects)
1. Write Dockerfile for Node.js app from scratch, no looking
2. Explain difference between CMD and ENTRYPOINT
3. Write docker-compose.yml with two services communicating by name
4. Explain what a Docker volume is and when you need one
5. Explain difference between docker build, docker run, docker compose up
**4 of 5 = stable**

### AWS — Basics (→ unlocks Cloud Practitioner exam)
1. Explain IAM least privilege and give example
2. Describe difference between public and private subnet in AWS
3. Explain what Internet Gateway does vs NAT Gateway
4. Explain what S3 is and give two use cases
5. SSH into EC2 instance from memory
**4 of 5 = basics done**

## The Adaptive Plan Message Format

Send this to the project chat on Sunday when something has changed.
Full output every time. 30-45 minute hard cap on the whole process.

```
ADAPTIVE PLAN UPDATE — [date]
Type: WEEKLY FINE-TUNE | MAJOR SHIFT

WHAT CHANGED:
[One sentence. What is different from the current plan.]

READINESS CHECK:
Track advancing or behind: [track name]
Q1: [answer] | Q2: [answer] | Q3: [answer] | Q4: [answer] | Q5: [answer]
Score: [X of 5]

HARD DATES (confirm unchanged):
Cloud Practitioner: July 15, 2026 ✓
SAA-C03: September 15, 2026 ✓
Applications: September 1, 2026 ✓

CURRENT STATE:
Week: [X] | Active challenge: [name] Day [X] | Last committed: [file]
Biggest gap right now: [honest one sentence]
```

## The Sunday Ritual (30-45 min hard stop)

```
Step 1 (5 min):   Honest assessment — did I do what I said this week?
Step 2 (10 min):  Write _weekly/week-XX-summary.md
Step 3 (10 min):  Adaptive plan check — is the plan still accurate?
                  If yes: update CONTEXT.md + skip to step 5
                  If no: send adaptive plan message, action the output
Step 4 (10 min):  Update today.md for coming week
                  Update CONTEXT.md — track status + post seeds
                  Update CHAT-CONTEXT.md — current state section
Step 5 (5-10 min): Write + post Sunday LinkedIn post from week's seeds
                   Final commit: "docs: weekly — week [X] summary and context update"
                   Push.

HARD STOP at 45 minutes. After that you're overthinking.
A slightly wrong plan executed consistently beats a perfect plan rewritten weekly.
```

---

# SECTION 8 — THE DEVOPS TRAINER

## V1 Scope (Ship First)

```
1 scenario: The Slow Server
6-8 decision nodes
Numbered choices (no free typing)
Guided correction (Type A — branch back, no stateful damage)
Simple scoring: steps + mistakes + first decision quality
4-field session report
```

## The Scenario Design Rules (Non-Negotiable)

```
Rule 1: One root cause only
Rule 2: One optimal path
Rule 3: Max 2 wrong branches per node
Rule 4: No hidden trick knowledge
Rule 5: Every wrong choice must be plausible under pressure
```

## The Scenario Library

| Tier | # | Scenario | Unlocks When |
|---|---|---|---|
| 1 | 1 | The Slow Server | Now (bash + Linux basics) |
| 1 | 2 | The Script That Stopped | After V1 ships |
| 1 | 3 | The Unreachable Service | After V1 ships |
| 1 | 4 | The Disk That Filled Up | After V1 ships |
| 1 | 5 | The Deployment That Didn't | After V1 ships |
| 2 | 6 | Container Won't Start | Docker stable |
| 2 | 7 | EC2 You Can't SSH Into | AWS basics |
| 2 | 8 | Pipeline Broke After Working | CI/CD basics |
| 2 | 9 | Database Lost Connections | Docker + networking |
| 2 | 10 | Terraform Partially Failed | Terraform basics |
| 3 | 11-15 | Advanced scenarios | CI/CD + Kubernetes |

## Usage Schedule

```
When: Weekly — Friday or Saturday
How long: 20-40 minutes per scenario
Start: Friday May 16 (after bash challenge completes)
First scenario: The Slow Server
Session report: feeds Sunday adaptive plan message
```

Full spec and implementation prompt: `docs/concerns/concern-12-devops-trainer-final.md`

---

# SECTION 9 — THE EXECUTION LIST

*Check off as completed. Update every Sunday.*
*Organized: This Week → This Month → Before September 1*

## THIS WEEK (May 2-8)

### Today (May 2 — Do Before Sleeping)
- [ ] Change LinkedIn headline: "CS Student → Junior DevOps Engineer | Bash · Python · AWS · Building in Public"
- [ ] Fix LinkedIn Open to Work job titles (6 specific roles listed above)
- [ ] Post readiness_check.sh post — content written in concern-8-9
- [ ] Open Sentry dashboard — screenshot what's there — save for LinkedIn post
- [ ] Schedule Cloud Practitioner exam at aws.amazon.com/certification — July 15
- [ ] Commit CHAT-CONTEXT.md to compendium root
- [ ] Commit MASTER-IMPLEMENTATION.md to compendium root

### This Week
- [ ] Day 5: trap_handler.sh — commit "linux: script — trap_handler.sh graceful error handling"
- [ ] Day 6: file_audit.sh — 24hr file change detector
- [ ] Day 7: fs_explorer.sh — filesystem situational awareness tool
- [ ] Day 8: log_monitor.sh — real-time ERROR/CRITICAL alerting
- [ ] Day 9: backup_rotate.sh — automated backup with rotation
- [ ] Add DevOps connection header to all 18 existing scripts — one session
- [ ] Commit top-level README.md to compendium root
- [ ] Create CONTEXT.md in compendium root — fill in today's values — commit
- [ ] Write LinkedIn About section
- [ ] Replace LinkedIn banner with terminal screenshot (readiness_check.sh output)
- [ ] 10 targeted LinkedIn connections — commenter rabbit hole method
- [ ] 2 LinkedIn comments per day Monday-Friday
- [ ] Network Trainer: 3+ scenarios daily
- [ ] Subnetting: 5 problems daily
- [ ] Jeremy's IT Lab: TCP/IP Model + IPv4 Parts 1+2
- [ ] Generate Day 1-5 bash handoff — paste into this project chat
- [ ] Paste new lab format into bash chat as new standard
- [ ] Paste networking trainer redesign prompt into trainer app
- [ ] Add SESSION OUTPUT format to all trainers

## THIS MONTH (May)

### Repo Cleanup (Separate Chat Session)
- [ ] Archive dead chats from project (list in concern-10)
- [ ] Branch cleanup: bad branches deleted, naming convention enforced
- [ ] Folder architecture implemented per concern-3 spec
- [ ] Existing files moved to correct locations
- [ ] Templates folder created with all templates committed
- [ ] labex/ folder created in compendium root
- [ ] linux/scripts/small-projects/ folder created
- [ ] python/scripts/small-projects/ folder created
- [ ] Commit: "docs: labex and small-projects folder structure created"

### Challenge Completion
- [ ] Day 10: health_monitor.sh — pre-deployment system health validator
- [ ] Day 11: deploy_pipeline.sh — full pipeline simulation
- [ ] Day 12: server_inventory.sh — multi-server reachability inventory
- [ ] Day 13: alert_manager.sh — threshold monitoring with alerting
- [ ] Day 14: ops_toolkit.sh — unified menu-driven ops toolkit (capstone)
- [ ] linux/scripts/README.md written on Day 14
- [ ] 14-day capstone LinkedIn post published May 11

### Wize Pre-Start
- [ ] Wize chat orientation session before May 11 — 4 questions — 20 min
- [ ] Write first build-log.md entry BEFORE any code — the standard statement
- [ ] Create projects/wize-devops/ folder structure from concern-3 spec
- [ ] Update CONTEXT.md — Wize track added as Pending

### Networking
- [ ] Jeremy's IT Lab priority videos: Subnetting 1-3, Routing, Life of a Packet
- [ ] Jeremy's IT Lab: VLANs 1+2, DNS, DHCP, NAT, Standard ACLs, TCP/UDP
- [ ] Network Trainer rebuilt (paste prompt from concern-4) — Phase 1 implementation
- [ ] Draw VPC from memory by end of Week 7 — no looking

### DevOps Trainer
- [ ] Build engine loop first — dummy scenario, verify loop works
- [ ] Load The Slow Server schema — verify it runs
- [ ] Test optimal path + 2 wrong paths
- [ ] First real session: Friday May 16

### Postmortem Reading (Saturday habit starts now)
- [ ] Read: GitHub October 21 2018 — database failover
- [ ] Read: Cloudflare July 2019 — BGP routing incident
- [ ] Read: Google Gmail 2014 — cascading failures
- [ ] After each: one sentence in weekly summary under "Incident Vocab"

### Python
- [ ] CS50P Week 1 complete: functions, loops, if/else, variables
- [ ] ex_compare_values.py committed
- [ ] json_reader.py committed
- [ ] api_caller.py committed
- [ ] log_analyzer.py committed
- [ ] cli_tool.py committed (all 5 Python scripts done)

### Career
- [ ] Commit concern docs to docs/concerns/ folder
- [ ] Commit resume: career/jamal-devops-resume.docx
- [ ] Commit resume markdown: career/resume-current.md
- [ ] Add GitHub link to resume AFTER repo cleanup
- [ ] Update Wize resume bullet after each milestone
- [ ] Sunday posts: Weeks 5, 6, 7 (content in today-days5-14.md)
- [ ] Sentry/observability post this week
- [ ] Phase 1 exit criteria self-check — end of Week 7

## BEFORE SEPTEMBER 1

### June
- [ ] AWS free tier account active
- [ ] IAM: create user, role, policy with least privilege
- [ ] VPC built from scratch: public/private subnets, IGW, NAT, route tables, SGs
- [ ] EC2 launched, SSH working, Docker installed
- [ ] S3 bucket created, permissions set
- [ ] CloudWatch alarm on EC2
- [ ] Wize Weeks 1-4 complete (Dockerfile → Compose → EC2 → GitHub Actions)
- [ ] Sentry release tracking in GitHub Actions pipeline
- [ ] Cloud Practitioner prep: AWS Skill Builder + Tutorials Dojo (starts June 15)
- [ ] LabEx Linux System Monitor project complete + fleet_monitor.sh committed
- [ ] LabEx Web Server Deployment project complete + server_deploy_recover.sh committed
- [ ] DevOps Trainer V2 co-design sessions: Scenarios 2-5 (Tier 1)

### July
- [ ] Cloud Practitioner exam passed — July 15
- [ ] Add cert to LinkedIn and resume immediately
- [ ] Terraform: main.tf provisioning VPC + EC2 from code
- [ ] Wize Weeks 5-6 complete (Monitoring + Terraform)
- [ ] Sentry active and monitored — not passive
- [ ] SAA-C03 prep starts: Maarek Udemy course — August 1 hard start

### August
- [ ] Cloud security dedicated block:
      IAM deep dive + KMS + Secret Manager + audit logs
      Non-admin user exercise — observe limited permissions
- [ ] Prometheus + Grafana: deployed on Kubernetes cluster (EKS basics)
- [ ] SAA-C03: Tutorials Dojo practice exams — 80%+ consistently
- [ ] All project READMEs complete with architecture diagrams
- [ ] Wize build-log.md complete through Week 6
- [ ] Resume final: all certs, all Wize milestones, GitHub link
- [ ] LinkedIn: 20+ posts, 50+ connections targeted, active commenter established
- [ ] Interview prep: system design cold, CI/CD answer cold, DevOps definition cold
- [ ] Behavioral stories written: 5 troubleshooting, 5 incident, 5 learning

### September 1
- [ ] 10 applications per week begins
- [ ] Application tracker started: career/job-applications.md
- [ ] Resume tailored per application (skills section order matches posting)
- [ ] SAA-C03 exam — September 15

---

# SECTION 10 — THE FOLDER STRUCTURE

```
cloud-engineering-compendium/
│
├── MASTER-IMPLEMENTATION.md        ← this file
├── CHAT-CONTEXT.md                 ← paste at new session start
├── CONTEXT.md                      ← daily state, auto-populated Sunday
├── PROJECT-STATE.md                ← master capture document
│
├── _daily/
│   ├── today.md                    ← active day (overwritten daily)
│   └── archive/
│
├── _weekly/
│   ├── week-05-summary.md
│   └── ...
│
├── linux/
│   ├── README.md
│   ├── scripts/
│   │   ├── README.md
│   │   ├── challenge/14-day/       ← 14-day bash challenge scripts
│   │   ├── guided/week1/           ← LabEx guided lab scripts
│   │   └── small-projects/         ← your own versions of LabEx projects
│   │       └── fleet-monitor/
│   └── notes/week1/
│
├── python/
│   ├── README.md
│   ├── scripts/
│   │   ├── guided/week1/
│   │   └── small-projects/
│   └── notes/week1/
│
├── networking/
│   ├── README.md
│   └── notes/
│       ├── ccna/                   ← Jeremy's IT Lab video notes
│       └── trainer-sessions/       ← Network Trainer session reports
│
├── aws/
│   ├── README.md
│   ├── labs/
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
├── labex/
│   ├── README.md
│   ├── linux-system-monitor/
│   │   ├── README.md
│   │   ├── build-log.md
│   │   └── scripts/
│   └── web-server-deployment/
│       ├── README.md
│       ├── build-log.md
│       └── scripts/
│
├── projects/
│   ├── README.md
│   └── wize-devops/
│       ├── README.md
│       ├── build-log.md
│       ├── architecture.md
│       ├── docker/
│       ├── cicd/
│       ├── terraform/
│       └── monitoring/
│
├── certifications/
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
│   ├── jamal-devops-resume.docx
│   ├── job-applications.md
│   └── interview-prep/
│       ├── linux-troubleshooting.md
│       ├── networking-scenarios.md
│       └── system-design.md
│
├── templates/
│   ├── today-template.md
│   ├── weekly-summary-template.md
│   ├── note-template.md
│   ├── script-header-template.sh
│   ├── handoff-template.md
│   ├── adaptive-plan-message.md
│   └── readiness-bars.md
│
└── docs/
    └── concerns/
        ├── concern-1-script-intentionality.md
        ├── concern-2-continuity-system.md
        ├── concern-3-documentation-system.md
        ├── concern-4-networking-trainer-prompt.md
        ├── concern-5-labex-projects.md
        ├── concern-6-wize-curriculum.md
        ├── concern-8-9-resume-linkedin.md
        ├── concern-10-chat-structure.md
        ├── concern-11-adaptive-plan.md
        └── concern-12-devops-trainer-final.md
```

---

# HOW TO USE THIS DOCUMENT

**Daily (under 5 minutes):**
Open this file. Check execution list for this week. Do the next unchecked item.
Look at curriculum timeline for current week. Close this file. Go work.

**Session start (2 minutes):**
Find the chat you're opening in Section 5. Copy initialization block. Paste. Start.

**Session end (3 minutes):**
Copy SESSION OUTPUT from the chat. Update two fields in CONTEXT.md.
Save post seed to week's list in CONTEXT.md.

**Sunday (30-45 minutes hard stop):**
Execution list → weekly summary → adaptive plan check → update CONTEXT.md
→ update CHAT-CONTEXT.md → LinkedIn post → commit → push. Stop.

**When something changes:**
Go to Section 7. Fill in adaptive plan message. Send it here. Action the output.

**When this project chat degrades:**
Open CHAT-CONTEXT.md. Copy it. Paste at top of new project chat. Continue.

**The one rule:**
If you find yourself reading this document instead of doing the work —
close it, open the terminal, do the next thing on the execution list.

---

*Last updated: May 2, 2026*
*Update the Current State fields in CHAT-CONTEXT.md every Sunday.*
*The concern documents live in docs/concerns/ — go there for depth.*
*This document governs everything. The work starts now.*
