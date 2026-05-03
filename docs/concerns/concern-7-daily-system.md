# today.md
## Jamal's Daily Decision File
### Lives in: cloud-engineering-compendium root | Updated every morning

---

## HOW TO USE THIS FILE

Open this before anything else. It has three decisions already made.
Fill in the blanks. Start working. Close the laptop with a commit.
That's the full loop.

---

## TODAY'S SESSION

**Date:** _______________
**Current challenge:** _______________ (see Challenge Bank below)
**Challenge day:** Day ___ of ___

---

### DECISION 1 — What I'm building today

**Track:** [ ] Bash  [ ] Python  [ ] Networking  [ ] Wize  [ ] LabEx Project  [ ] AWS

**Specific task:**
_Write one sentence. Not "do bash." Write "write a script that monitors disk usage
and alerts when a partition hits 80%."_

_______________________________________________

**DevOps context (one line — this becomes your post seed):**
_Why would a real engineer care about this? What situation does it solve?_

_______________________________________________

---

### DECISION 2 — What gets committed

**File name:** _______________
**Commit message:** _______________
_Format: track: what it does — context_
_Example: bash: disk_monitor.sh — alerts on partition usage above threshold_

**Branch:** _______________
_Still on bash-script-week1-day4? Merge it first. New work goes on main or a new branch._

---

### DECISION 3 — What gets logged

After the session, fill these in. This is your post raw material.

**What I built:**
_______________________________________________

**What broke or was hard:**
_______________________________________________

**What I learned from it:**
_______________________________________________

**DevOps relevance (one line):**
_______________________________________________

**Post candidate?** [ ] X post today  [ ] LinkedIn pool for Sunday  [ ] Neither

---

## THE SESSION CLOSE CHECKLIST

Run through this before you close the laptop. Every session.

```bash
# 1. Save the file you worked on
# 2. Stage and commit
git add .
git commit -m "your commit message from Decision 2"
git push origin [branch]

# 3. Update today.md — fill in Decision 3
# 4. Commit today.md
git add today.md
git commit -m "log: day [X] session notes"
git push origin main
```

If these four things happened, the session counted professionally.
If they didn't, it didn't matter how much you learned.

---

---

# HANDOFF FORMAT
## For bash chat, Python chat, or any external context feeding into this project

---

## HOW IT WORKS

When something significant happens in another chat — end of a lab series,
completion of a script set, a concept fully locked in — that chat produces a handoff.
You paste the handoff into this project chat.
The project chat updates PROJECT-STATE.md.
Nothing gets lost.

---

## THE HANDOFF BLOCK

Copy this. Fill it in. Paste it into the project chat.

```
--- HANDOFF: [TRACK] | [DATE] ---

WHAT WAS COMPLETED:
- [specific thing 1]
- [specific thing 2]
- [specific thing 3]

SCRIPTS/FILES COMMITTED:
- [filename]: [one line what it does]
- [filename]: [one line what it does]

WHAT I CAN DO NOW THAT I COULDN'T BEFORE:
- [skill or ability gained — one line]

WHAT'S STILL SHAKY:
- [concept or skill that needs more reps]

NEXT TASK IN THIS TRACK:
- [exactly what comes next — not "more bash," but the specific script or lab]

POST CANDIDATES FROM THIS WORK:
- [what's worth posting — one line description]

--- END HANDOFF ---
```

---

## HANDOFF EXAMPLE — Bash Chat Day 5

```
--- HANDOFF: BASH | May 1, 2026 ---

WHAT WAS COMPLETED:
- Completed LabEx bash scripting days 1-5
- Wrote 18 scripts across deployment, resource checking, string operations
- Reviewed conditionals, loops, string manipulation, argument handling

SCRIPTS/FILES COMMITTED:
- readiness_check.sh: validates env, checks CPU/mem, gates deployment
- tag_parser.sh: parses deploy tags using string operations
- deploy_gate.sh: conditional resource threshold gate before deployment

WHAT I CAN DO NOW THAT I COULDN'T BEFORE:
- Write a bash script from pseudo code without looking at examples
- Use argument validation with exit 1 in real scenarios
- Parse and manipulate strings to extract deployment metadata

WHAT'S STILL SHAKY:
- Arrays and loops in more complex scenarios
- Connecting scripts to each other in a pipeline

NEXT TASK IN THIS TRACK:
- Write pipeline_validator.sh that calls system_check + readiness_check in sequence

POST CANDIDATES FROM THIS WORK:
- "5 days of bash. Here's readiness_check.sh — a deployment gate script."

--- END HANDOFF ---
```

---

---

# CHALLENGE BANK
## Doable challenges across every track — built for LinkedIn and X content

---

## HOW CHALLENGES WORK

A challenge gives you:
- A named arc for your work (people follow arcs, not individual posts)
- A built-in posting structure (Day X of Y is self-explanatory content)
- A commit cadence (one commit per day of the challenge minimum)
- A finale post (Day Y wrap-up with what changed — always performs well)

A challenge is NOT:
- A rigid schedule you fail if you miss a day
- Something you invent a new format for each time
- Something that requires perfect execution to post about

Failing a challenge day is content. "Day 6 of 14 — I hit a wall today. Here's what happened."

---

## ACTIVE CHALLENGE FORMAT

```
Challenge name: [Track] [Number] Days — [What You're Doing]
Example: Bash 14 Days — Writing Real DevOps Scripts Daily

Daily minimum: 1 commit
Daily X post: 1 sentence + terminal screenshot
Weekly LinkedIn post: what you built this week + what it means + screenshot
Finale post: what changed from Day 1 to Day [N] — before/after format
```

---

## THE CHALLENGE BANK — One for every track

Pick the one that matches where you are. Run it. When it ends, pick the next.
They don't all run simultaneously. One active challenge at a time.

---

### BASH CHALLENGES

**Bash 14 — Write 14 Real DevOps Scripts in 14 Days**
You're already 5 days in. This is already running.
Each script solves a real scenario. One commit per day.
Finale: "14 scripts in 14 days. Here's what a junior DevOps engineer's bash toolkit looks like."

**Bash Pipeline — Build a 5-Script Deployment Pipeline**
Write 5 scripts that call each other in sequence: preflight → resource check →
env validation → deploy gate → post-deploy summary.
Each script is a commit. The working pipeline is the finale post.

**Bash SRE Week — 7 Days of On-Call Scripts**
Scripts that simulate what an on-call SRE actually runs:
disk alert, process monitor, log parser, service restart, health check, backup, report generator.
One per day. Finale: "7 scripts an SRE runs before anyone else wakes up."

---

### PYTHON CHALLENGES

**Python 14 — 14 Scripts That Automate Something Real**
Same format as Bash 14. Each script automates a task a DevOps engineer would actually run.
Finale: "Python is my automation layer. Here's what 14 days of it looks like."

**Python API Week — 7 Days of Real API Calls**
Call a different API each day. Format the output. Handle errors.
GitHub API, weather API, public cloud status API, etc.
Finale: "APIs are how DevOps tools talk to each other. Here's what I learned."

**Python SRE Toolkit — Build 5 Monitoring Scripts**
CPU monitor, memory alert, log analyzer, process checker, disk usage reporter.
These connect directly to what Prometheus does at scale.
Finale: "Built my own mini monitoring toolkit in Python before I touch Prometheus."

---

### NETWORKING CHALLENGES

**Networking 10 — 10 Scenarios in 10 Days**
10 scenarios from the DevOps Network Trainer. One per day. Applied difficulty.
For each one: screenshot your answer, write one line about what it maps to in AWS.
Finale: "10 networking scenarios. Here's how they connect to AWS VPC."

**VPC Build Week — Draw and Explain a VPC Every Day for 7 Days**
Day 1: draw it from memory, explain each component.
Day 2: same but add a broken scenario and diagnose it.
Day 7: full architecture with multi-AZ, ALB, EC2, RDS — from memory, no looking.
Finale: "I drew a VPC every day for 7 days. Here's what changed."

**Packet Journey — 5 Days Tracing How Data Moves**
Use ping, dig, traceroute, curl in terminal. Document the output each day.
Explain what each hop means. Connect it to what would break in AWS if it failed.
Finale: "Traced a packet from my terminal to a server and back. Here's what I learned."

---

### WIZE CHALLENGES

**Wize DevOps — Adding One DevOps Layer Per Week**
Each week, one new DevOps component added to your live app.
Week 1: Dockerfile. Week 2: docker-compose. Week 3: EC2 deployment.
Week 4: GitHub Actions pipeline. Week 5: CloudWatch monitoring.
Post at the start of each week: "This week I'm adding [X] to Wize."
Post at the end: "Here's what [X] looks like running on a real app."

**Wize Break/Fix — Break Your App on Purpose and Fix It**
Deploy Wize. Deliberately misconfigure something (wrong port, missing env var,
broken health check). Document the error. Diagnose it. Fix it.
This is sadservers but with your own app. Finale: "I broke my own app 3 times this week. Here's what I learned."

---

### AWS CHALLENGES

**AWS First Week — 7 Days of Hands-On AWS**
Day 1: IAM — user, role, policy.
Day 2: VPC built from scratch.
Day 3: EC2 launched inside the VPC, SSH'd in.
Day 4: S3 bucket with permissions.
Day 5: CloudWatch alarm on EC2.
Day 6: Deploy Wize to EC2 via Docker.
Day 7: Document the full architecture in a README.
Finale: "First week on AWS. Here's every service I touched and why."

**VPC From Scratch — Build It, Break It, Rebuild It**
Build a VPC with all components. Break one thing each day. Fix it.
Document every error message and what caused it.
Finale: "I built the same VPC three times this week. Here's what I know now that I didn't before."

---

### LABEX PROJECT CHALLENGES

**LabEx + Mine — Do the Guided Version, Then Build Your Own**
For each LabEx project: complete the guided version first.
Then build a smaller version that's specific to a scenario you've been working on.
Two commits per project: the LabEx version and yours.
Post: "LabEx taught me how. Here's what I built with it."

---

### THE CROSS-TRACK FINALE

**The 30-Day DevOps Build — Document Everything**
Run after the individual challenges. This is the LinkedIn arc that spans a month.
Every day: one commit. Every week: one LinkedIn post. One X post minimum per day.
End: a LinkedIn article or carousel — "30 days of building in public. Here's what I can do now."
This is the post that recruiters will see when they look you up in September.

---

## CHALLENGE SELECTION GUIDE

| Where you are | Challenge to run |
|---|---|
| Currently (Day 5 of bash) | Bash 14 — already in progress, name it and post Day 1 retroactively |
| After bash stable | Python 14 — run immediately after |
| Before networking clicks | Networking 10 — run parallel to any other challenge |
| When Docker is learned | Wize DevOps — one layer per week |
| When AWS starts | AWS First Week — run it the first week of Week 8 |
| September approach | The 30-Day DevOps Build — your finale arc |

---

## THE POST SEED → POST PIPELINE

Every today.md session log produces a post seed.
Here's how the seed becomes an actual post:

```
SESSION LOG ENTRY:
"Wrote disk_monitor.sh — checks all partitions, alerts above 80% threshold.
Broke it when I forgot to quote the variable. Learned that unquoted variables
in conditionals break when the value has spaces."

↓

X POST (same day):
"Day 7 of bash scripting. Wrote a disk monitor that alerts above 80%.
Broke it immediately. Unquoted variables in conditionals — that's today's lesson.
[screenshot of script output]"

↓

LINKEDIN POOL ENTRY:
Script name + what it does + what broke + what you learned + DevOps context.
Three of these = one LinkedIn post on Sunday.

↓

SUNDAY LINKEDIN POST:
"This week I wrote 3 scripts that a real DevOps engineer would run before a deployment.
Here's what each one does and what I learned building them.
[carousel or screenshot set]"
```

---

*This file lives in cloud-engineering-compendium root.*
*today.md gets updated every session.*
*Handoff format is the same every time regardless of which chat it comes from.*
*Challenge Bank grows as new tracks unlock.*
