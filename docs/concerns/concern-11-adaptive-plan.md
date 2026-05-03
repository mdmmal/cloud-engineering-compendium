# Concern 11 — Adaptive Plan System
## Full Spec | Jamal Muhammad | May 2, 2026

---

## THE CORE RULE

Hard dates never move.
Everything else adjusts around them.

Hard dates:
- Cloud Practitioner exam: July 15, 2026
- SAA-C03 exam: September 15, 2026
- Applications start: September 1, 2026
- Graduation: December 2026

The plan is a living document. It gets reviewed every Sunday.
It gets updated when reality diverges from the plan.
Updates take 30-45 minutes maximum. After that you're overthinking.

---

## THE DEPENDENCY MAP

When one track moves, these are the things that update.
This map is why "global" update is possible — the dependencies are known.

```
BASH (stable)
  └── unlocks: Docker track start
  └── unlocks: LabEx Linux System Monitor project
  └── feeds: Wize Week 1 (Dockerfile requires bash comfort)

PYTHON (stable)
  └── feeds: Wize build (Express is JS but Python scripting mindset transfers)
  └── feeds: SAA-C03 prep (boto3 scripts for practice)
  └── unlocks: LabEx Python projects

NETWORKING (VPC-ready)
  └── unlocks: AWS hands-on (Week 8 — VPC build requires networking foundation)
  └── feeds: Wize Week 3 (EC2 deploy requires VPC knowledge)
  └── feeds: Security groups, NACLs in every project

AWS (basics)
  └── unlocks: Wize Week 3 (EC2 deploy)
  └── unlocks: Cloud Practitioner exam readiness
  └── feeds: SAA-C03 prep

DOCKER (stable)
  └── unlocks: Wize Week 1 (Dockerfile for backend)
  └── unlocks: LabEx Hybrid Infrastructure project
  └── unlocks: LabEx Observability Stack project
  └── feeds: Kubernetes (Phase 2)
  └── feeds: CI/CD pipeline (GitHub Actions builds Docker images)

CI/CD (GitHub Actions)
  └── unlocks: Wize Week 4 (automated pipeline)
  └── feeds: SAA-C03 (deployment patterns)

TERRAFORM
  └── unlocks: Wize Week 6 (infrastructure as code)
  └── feeds: SAA-C03 (IaC concepts)

WIZE BUILD (sequential — each week unlocks next)
  Week 1 (Docker) → Week 2 (Compose) → Week 3 (EC2) →
  Week 4 (GitHub Actions) → Week 5 (Monitoring) → Week 6 (Terraform)

HARD DATE ANCHORS (nothing moves these):
  July 15: Cloud Practitioner → requires AWS basics done by June 15
  September 15: SAA-C03 → requires Maarek course started by August 1
  September 1: Applications → requires portfolio complete by August 31
```

---

## THE READINESS BARS

Every track has a minimum bar.
Answer these questions before declaring a track stable.
4 of 5 correct = stable. Under 4 = not ready.

---

### BASH — Stable Bar
1. Write a deployment gate script from scratch with argument validation and exit codes — no looking
2. Explain what bash trap does and when you'd use it in production
3. Write a loop that reads a file line by line and processes each line
4. Explain the difference between $? and $! and when each is useful
5. Write a function that takes arguments and returns a value

**4 of 5 correct = bash stable → Docker can start**

---

### PYTHON — Stable Bar
1. Write a function that reads a JSON file and returns a specific key's value
2. Write a try/except block that handles file not found and prints a specific message
3. Write a script that takes command line arguments and validates them
4. Explain what a dictionary comprehension is and write one
5. Write a script that calls an external API and handles the response

**4 of 5 correct = Python stable → Python projects can start**

---

### NETWORKING — VPC-Ready Bar
1. Draw a VPC from memory: public subnet, private subnet, IGW, NAT, route tables, security groups
2. Explain the difference between a security group and a NACL
3. Explain what happens when you run `dig google.com` — walk through every step
4. Explain why a server in a private subnet can reach the internet but can't be reached from it
5. Explain what longest prefix match means in a routing table

**4 of 5 correct = networking VPC-ready → AWS Week 8 can start**

---

### DOCKER — Stable Bar
1. Write a Dockerfile for a Node.js app from scratch — no looking
2. Explain the difference between CMD and ENTRYPOINT
3. Write a docker-compose.yml with two services that communicate by name
4. Explain what a Docker volume is and when you need one
5. Explain the difference between `docker build`, `docker run`, and `docker compose up`

**4 of 5 correct = Docker stable → Wize Week 1 can start**

---

### AWS — Basics Bar
1. Explain what IAM least privilege means and give an example
2. Describe the difference between a public subnet and a private subnet in AWS
3. Explain what an Internet Gateway does and how it differs from a NAT Gateway
4. Explain what S3 is and give two use cases for it
5. Explain what EC2 is and SSH into an instance from memory

**4 of 5 correct = AWS basics done → Cloud Practitioner exam ready**

---

### CI/CD — Basics Bar
1. Explain what happens between `git push` and code running in production
2. Write a basic GitHub Actions workflow that runs on push to main
3. Explain the difference between a pipeline stage and a job
4. Explain what an artifact is in the context of a CI/CD pipeline
5. Explain when you'd use Jenkins vs GitHub Actions

**4 of 5 correct = CI/CD basics → Wize Week 4 can start**

---

## THE ADAPTIVE PLAN PROTOCOL

### THE MESSAGE FORMAT

Send this to the project chat. Fill in the brackets.
The chat produces the full adaptive plan output within 30-45 minutes.

```
ADAPTIVE PLAN UPDATE — [date]
Type: WEEKLY FINE-TUNE | MAJOR SHIFT (pick one)

WHAT CHANGED:
[One sentence. What is different from the current plan.]
Example: "I'm ready to start Docker now, 3 weeks earlier than planned."
Example: "I'm 5 days behind on bash, networking hasn't started."
Example: "I passed the bash readiness bar today."

READINESS CHECK (answer honestly):
Track I'm advancing OR track I'm behind on: [track name]
Q1: [answer]
Q2: [answer]
Q3: [answer]
Q4: [answer]
Q5: [answer]
Score: [X of 5]

HARD DATES (confirm these haven't changed):
Cloud Practitioner: July 15, 2026 ✓
SAA-C03: September 15, 2026 ✓
Applications: September 1, 2026 ✓

CURRENT STATE:
Week: [X]
Active challenge: [name] Day [X]
Last committed: [file]
Biggest gap right now: [honest one sentence]
```

---

### THE OUTPUT FORMAT

When the project chat receives an adaptive plan message it produces this.
Full version every time. 30-45 minute cap on the whole process.

```
ADAPTIVE PLAN OUTPUT — [date]

## WHAT CHANGED AND WHY IT MATTERS
[2-3 sentences. What the shift means for the overall trajectory.
Does it create slack elsewhere? Does it tighten anything?]

## DEPENDENCY UPDATES
[Which tracks are affected by this change, based on the dependency map.]
[What unlocks. What gets pushed. What stays the same.]

## UPDATED DAILY STACK
[The new daily non-negotiables based on the shift.]
[Replaces the current today.md default for the coming week.]

Morning block:
  Track: [what] | Task: [specific]
Mid block:
  Track: [what] | Task: [specific]
Evening block:
  Track: [what] | Task: [specific]
Daily minimum:
  Networking: [X] trainer scenarios
  Subnetting: [X] problems
  Commit: always

## ACTIVE CHALLENGES (updated)
[Which challenge is current. What day. What comes next.]
Current: [challenge name] — Day [X] of [Y]
Next: [next challenge name] — starts [when]

## REPO UPDATES
[What the compendium should look like now given the shift.]
[New folders to create. New branches to open. READMEs to update.]

New folders needed: [list]
Branches to open: [list]
READMEs to update: [list]
Commit message for the update: "[message]"

## POST IDEAS FROM THIS SHIFT
[2-3 post seeds generated by this change.]
Seed 1: [what happened + why it matters]
Seed 2: [the readiness check result as a post]
Seed 3: [what comes next as a post]

## UPDATED TRAJECTORY
[The current path to September 1 given this shift.]
[Simple week-by-week. What the plan looks like from here to hard dates.]

Now → [date]: [what's happening]
[date] → [date]: [what's happening]
[date]: Cloud Practitioner exam (FIXED)
[date] → [date]: [what's happening]
[date]: SAA-C03 exam (FIXED)
[date]: Applications start (FIXED)

## WHAT TO CONSIDER
[1-3 honest flags. What this shift creates as risk or opportunity.]
Flag 1: [risk or opportunity]
Flag 2: [risk or opportunity]

## CHATS TO UPDATE
[Which specialized chats need their initialization block updated.]
[Copy the updated context line for each.]

Bash Chat — update: [what changed]
Python Labs Chat — update: [what changed]
Wize Build Chat — update: [what changed]
CONTEXT.md — update: [what to change]
CHAT-CONTEXT.md — update: [what section to update]
```

---

## THE SUNDAY RITUAL — COMPLETE VERSION

Every Sunday. 30-45 minutes maximum. Hard stop.

```
STEP 1 — HONEST ASSESSMENT (5 min)
Open CONTEXT.md. Look at track status.
Ask: did I do what I said I'd do this week?
One sentence per track. Honest.

STEP 2 — WEEKLY SUMMARY (10 min)
Write _weekly/week-XX-summary.md
What got done. What broke. What I learned.
Commits this week. Post seeds collected.

STEP 3 — ADAPTIVE PLAN CHECK (10 min)
Is the plan still accurate?
If nothing changed: update CONTEXT.md with new track status, skip to step 5.
If something changed: send the adaptive plan message to this project chat.

STEP 4 — OUTPUT ACTION (10 min)
If adaptive plan output came back: action the immediate items.
Update today.md for the coming week.
Update CONTEXT.md.
Update CHAT-CONTEXT.md current state section.

STEP 5 — POST AND COMMIT (5-10 min)
Write Sunday LinkedIn post from week's post seeds.
Final commit: "docs: weekly — week [X] summary and context update"
Push.

TOTAL: 30-45 minutes. After that, stop.
```

---

## THE ANTI-OVERTHINKING RULE

If the adaptive plan process takes more than 45 minutes you are overthinking.

Signs you're overthinking:
- Rewriting the weekly summary more than once
- Second-guessing the readiness bar answers
- Researching new resources instead of updating the plan
- Planning next month instead of this week

When you notice overthinking: stop. Commit what exists. Post what exists.
The plan is good enough. The work is what matters.

One sentence that stays true: a slightly wrong plan executed consistently
beats a perfect plan that keeps getting rewritten.

---

## EXAMPLE ADAPTIVE PLAN MESSAGE

What you'd actually send on a Sunday when bash is done:

```
ADAPTIVE PLAN UPDATE — May 11, 2026
Type: MAJOR SHIFT

WHAT CHANGED:
Bash 14-day challenge complete. Passed the readiness bar. Ready to start Docker.

READINESS CHECK:
Track advancing: Bash → Docker
Q1: Yes — wrote deploy_pipeline.sh from scratch without looking
Q2: Yes — bash trap catches errors and cleans up temp files
Q3: Yes — loops over file line by line with while read line
Q4: Partial — know $? is exit code, $! is last background PID
Q5: Yes — wrote functions with arguments and return values
Score: 4.5 of 5

HARD DATES:
Cloud Practitioner: July 15, 2026 ✓
SAA-C03: September 15, 2026 ✓
Applications: September 1, 2026 ✓

CURRENT STATE:
Week: 6
Active challenge: 14-Day Bash COMPLETE → Wize Week 1 starts
Last committed: ops_toolkit.sh (capstone)
Biggest gap right now: Networking still has no daily execution slot
```

---

## RUNNING LOG ITEMS FROM THIS CONCERN

**→ Concern 12 (Ultimate DevOps Trainer):**
The readiness bars above feed directly into the trainer.
If you can answer the bash readiness bar questions, you can handle
bash-level trainer scenarios. The bars and the trainer are calibrated together.

**→ Concern 3 (Documentation):**
The adaptive plan output updates CONTEXT.md and CHAT-CONTEXT.md.
Those files are defined in Concern 3 and Concern 10.
The output format explicitly tells you which sections to update.

**→ Execution list:**
Add the Sunday ritual to the weekly schedule.
The adaptive plan message format goes in templates/ as
adaptive-plan-message-template.md.
The readiness bars go in templates/ as readiness-bars.md.
Both committed before the first Sunday ritual.
