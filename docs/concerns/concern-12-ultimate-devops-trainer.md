# Concern 12 — Ultimate DevOps Trainer
## Full Spec + Implementation Prompt | Jamal Muhammad | May 2, 2026

---

## WHAT THIS TRAINER IS

A decision-based incident simulator that places you inside active DevOps
situations and forces you to make real decisions with real consequences.

Not a quiz. Not a concept explainer. Not a command reference.
An environment where something is broken and you have to fix it —
using the tools, knowledge, and reasoning you've built.

The labs build syntax.
The postmortem reading builds vocabulary.
The networking trainer builds diagnostic pattern recognition.
This trainer is where all of it comes together under pressure.

---

## WHAT IT DOES THAT NOTHING ELSE DOES

Every other tool teaches in isolation.
This trainer forces combination.

When you're in a scenario:
- Bash knowledge tells you what script to write or run
- Networking knowledge tells you what to check first
- Python knowledge tells you how to parse the logs
- DevOps reasoning tells you in what ORDER to do all of it

The order matters as much as the knowledge.
A senior engineer and a junior engineer might know the same commands.
The senior checks the right thing first and resolves it in 3 steps.
The junior checks things randomly and takes 12.
This trainer teaches the order.

---

## THE TARGET USER

**Now:** Bash, Python, Linux navigation, networking basics, no AWS/Docker yet.
**In 3-6 months:** Docker, AWS, CI/CD, Terraform basics.

The trainer starts at current level and unlocks harder scenarios
as tracks become stable — calibrated to the readiness bars from Concern 11.

**The non-negotiable outcome:**
After using this trainer consistently, you can:
- Decide what to check first in an incident without guessing
- Connect a symptom to a likely cause without being told what it is
- Know which tool, script, or command is appropriate for a given situation
- Explain your reasoning step by step — to an interviewer or a teammate
- Feel the difference between triage (what's wrong) and action (fix it)

---

## THE SCENARIO STRUCTURE

Every scenario has three phases. 10-15 decision points total.

### Phase 1 — ALERT (2-3 decision points)
Something happened. You've been notified.
You don't know what's wrong yet.
You have to decide: what do you check first?

Decision type: prioritization
Question format: "You receive [alert]. What do you do first?"
Options: 4 realistic choices, one optimal, one acceptable, two wrong

### Phase 2 — INVESTIGATION (5-8 decision points)
You're in the system now. You're seeing outputs.
Each decision produces a new output (command result, log line, metric).
Each output either clarifies or complicates the picture.

Decision type: diagnosis + action
Question format: "You run [command] and see [output]. What does this tell you?"
Then: "What do you do next?"
Options: 4 choices, consequences vary

### Phase 3 — RESOLUTION (2-4 decision points)
You've identified the problem.
Now you have to fix it without breaking anything else.
And verify the fix worked.

Decision type: action + verification
Question format: "You believe the problem is [X]. What is your fix?"
Then: "How do you verify the fix worked?"
Options: 4 choices, one optimal path, wrong paths produce new problems

---

## THE DECISION CONSEQUENCE SYSTEM

**Right choice:** Scenario advances. New output shows progress.
No celebration — just the next step. Real work doesn't congratulate you.

**Wrong choice:** You go down the path one step.
The trainer shows you what happens as a result of that decision.
Then it flags it: "This path leads away from resolution. Here's why."
One paragraph explanation of why it was wrong, what it would cause in production,
and what the right reasoning would have been.
Then the scenario branches back and offers the correct path forward.

**Catastrophic wrong choice (makes things worse):**
Some wrong choices don't just fail — they create a second problem.
"You restarted the service without checking the config first.
The service restarted with a broken config and is now in a crash loop."
The trainer makes you feel the consequence before explaining it.
This is intentional. Consequences teach.

---

## THE COMMAND INPUT SYSTEM

You type the command you'd run. The trainer interprets it.

Format: type the command as you'd type it in a real terminal.
```
$ dig db.internal.company.com
$ ping 10.0.2.15
$ curl -I http://localhost:5000/health
$ tail -f /var/log/app/error.log
$ systemctl status nginx
```

The trainer responds with realistic fake output for that command
in the context of the current scenario.

If you type a command that's irrelevant to the current situation:
"That command runs but returns nothing useful here.
In this environment, [X] is not the issue. What else would you check?"

If you type a command that's completely wrong syntax:
"That command would fail with: [error]. What did you mean to run?"

If you type a command that's exactly right:
The output reveals a key piece of the puzzle.

---

## THE GRADING SYSTEM

After each scenario: performance tier + narrative grade.

### Performance Tiers

**OPTIMAL:** Identified the issue correctly, checked things in the right order,
resolved it without creating new problems, verified the fix.
"You worked like a senior engineer on this one."

**ACCEPTABLE:** Got to the right answer but took inefficient steps,
or identified the issue but fixed it in a roundabout way.
"You solved it. A more experienced engineer would have gotten here faster.
Here's the shortcut."

**LEARNING:** Went down wrong paths, identified the issue late,
or fixed the symptom without addressing the root cause.
"You got there eventually. Here's what the optimal path looks like and why."

**ESCALATE:** Couldn't identify the issue or made it significantly worse.
Not a failure — this is a real outcome in DevOps too.
"A senior engineer would have escalated this after X minutes.
Here's what they would have told their lead and why."

### The Narrative Grade

After the tier, one paragraph that is specific to YOUR session:
- What you checked first and whether that was right
- The decision that cost you the most time
- The decision you got exactly right
- What a senior engineer would have done differently
- One concept this scenario tested that you should review

Example:
"You correctly identified that this was a networking issue early — good instinct.
But you ran ping before dig, which checks L3 before confirming DNS.
In this scenario DNS was the actual failure, so ping would have passed
and misled you. Dig first would have shown NXDOMAIN immediately.
Your fix was correct but you restarted nginx before verifying the config —
in production that restart could have caused a brief outage.
The concept to review: always verify config before restarting services."

---

## THE SCENARIO LIBRARY

Scenarios unlock as tracks pass their readiness bars (from Concern 11).
Each scenario is tagged with its difficulty level and required knowledge.

### TIER 1 — BEGINNER (Unlocked now: bash + Linux + networking basics)

**Scenario 1: The Slow Server**
Type: Beginning (you get the alert)
Alert: "Users are reporting the app is responding slowly. No errors, just slow."
Required knowledge: Linux process management, bash scripting, log reading
Key decisions: what to check first (CPU vs memory vs disk vs network vs app)
Optimal path: check system resources → find the culprit process → check logs → fix

**Scenario 2: The Script That Stopped Working**
Type: Middle (handed a half-diagnosed problem)
Setup: "The nightly backup script ran last night but no backup was created.
No errors in cron. The script runs fine manually. What's wrong?"
Required knowledge: bash scripting, cron, file permissions, paths
Key decisions: cron environment vs script logic vs permissions vs path issue
Optimal path: check cron log → check script path → check environment differences

**Scenario 3: The Unreachable Service**
Type: Beginning
Alert: "The monitoring tool shows the web service is unreachable.
The server is running. No deployments happened today."
Required knowledge: networking (ping/curl/netstat), service management (systemctl)
Key decisions: is it DNS, routing, service down, or port issue?
Optimal path: curl → netstat → systemctl → logs

**Scenario 4: The Disk That Filled Up**
Type: Middle
Setup: "The application wrote to a log file. Now the app is crashing.
Restarts aren't helping."
Required knowledge: Linux file system, bash scripting, log rotation
Key decisions: identify disk full → find the cause → fix without data loss → prevent recurrence

**Scenario 5: The Deployment That Didn't Deploy**
Type: Beginning
Alert: "You pushed code to main. The CI check passed. But the app is still on the old version."
Required knowledge: bash, git, understanding of deployment flow
Key decisions: check the pipeline → check the deploy script → check if restart happened

### TIER 2 — INTERMEDIATE (Unlocks after Docker + AWS basics stable)

**Scenario 6: The Container That Won't Start**
Required: Docker
Alert: "The app container keeps restarting. docker compose ps shows it cycling."
Key decisions: check logs → check Dockerfile → check env vars → check port conflicts

**Scenario 7: The EC2 Instance You Can't SSH Into**
Required: AWS basics + networking
Alert: "New EC2 instance launched. SSH timing out. Security group looks right."
Key decisions: check security group → check route table → check key pair → check NACL

**Scenario 8: The Pipeline That Broke After It Was Working**
Required: CI/CD basics
Alert: "GitHub Actions was deploying fine. Today's push failed. No code changes to the pipeline."
Key decisions: check the error → check credentials → check external dependencies → check Docker build

**Scenario 9: The Database That Lost Connections**
Required: Docker + networking
Alert: "App is returning 500 errors. Logs show DB connection refused."
Key decisions: is the DB running → is the network configured → did the volume unmount → is the port right

**Scenario 10: The Terraform Apply That Partially Failed**
Required: Terraform basics
Alert: "terraform apply ran. Some resources were created. Then it failed midway."
Key decisions: check the error → check state file → decide whether to retry or destroy and rebuild

### TIER 3 — ADVANCED (Unlocks after CI/CD + Terraform + Kubernetes stable)

**Scenario 11: The Kubernetes Pod That's CrashLooping**
**Scenario 12: The Multi-Region Failover Decision**
**Scenario 13: The Security Group Change That Broke Production**
**Scenario 14: The Monitoring Alert With No Obvious Cause**
**Scenario 15: The Full Incident — Alert to RCA**

---

## THE SESSION REPORT

Generated after every scenario. Feeds into the continuity system.

```
SESSION REPORT — Ultimate DevOps Trainer
Date: [date]
Scenario: [scenario name and number]
Tier: [1 / 2 / 3]
Duration: [approximate minutes]

Performance tier: [OPTIMAL / ACCEPTABLE / LEARNING / ESCALATE]

Decisions made: [X] total
Optimal decisions: [X]
Wrong paths taken: [X]
Consequences triggered: [X]

Narrative grade:
[The specific paragraph about this session's performance]

Concepts tested:
- [concept 1]
- [concept 2]
- [concept 3]

Weakest decision in this session:
[The specific step where the most time was lost or the worst choice was made]

Concept to review before next session:
[Specific concept from the session that needs reinforcement]
→ Review in: [networking trainer / bash lab / postmortem reading / specific resource]

DevOps connection made:
[What this scenario maps to in real production environments]

Post seed:
[One post idea from this session — what happened + what you learned]

Adaptive plan signal:
[If performance was consistently Learning on a topic, flag it here]
"Struggled with [X] across [Y] scenarios → increase [X] in daily stack"

Commit message:
"devops-trainer: scenario [X] completed — [tier] — [key concept]"

What's next:
[Next scenario recommendation based on this performance]
```

---

## THE OPENING SCREEN

When the trainer starts, the user sees:

```
ULTIMATE DEVOPS TRAINER
─────────────────────────────────────────
Something is broken. Figure it out.

You are an on-call engineer. You have been paged.
You have the tools. You have the knowledge.
The question is whether you know how to use them together.

Type commands as you would in a real terminal.
Make decisions when prompted.
Every choice has a consequence.

Current tier unlocked: TIER 1 (Bash + Linux + Networking)
Scenarios available: 5
Scenarios completed: 0

[START SCENARIO] [VIEW COMPLETED] [SESSION REPORT]
─────────────────────────────────────────
```

---

## THE IMPLEMENTATION PROMPT

Paste this into the app or chat that builds the trainer.
This is the complete spec for implementation.

```
Build the Ultimate DevOps Trainer — a decision-based incident simulator
for beginner DevOps engineers.

CORE MECHANIC:
The user is placed inside an active DevOps incident.
They type commands as they would in a real terminal.
They make decisions when prompted with multiple choice options.
Every decision has a consequence — right choices advance toward resolution,
wrong choices play out one step before being corrected with explanation.

SCENARIO STRUCTURE (10-15 decision points each):
Phase 1 — ALERT: What do you check first? (2-3 decisions)
Phase 2 — INVESTIGATION: What does this output tell you? What next? (5-8 decisions)
Phase 3 — RESOLUTION: What's your fix? How do you verify it worked? (2-4 decisions)

COMMAND INPUT:
User types commands in terminal format.
Trainer responds with realistic fake output for that command in the scenario context.
Irrelevant commands get: "That runs but shows nothing useful here. What else?"
Wrong syntax gets: "That would fail with: [error]. What did you mean?"
Right commands reveal key information.

WRONG CHOICE HANDLING:
Show the consequence of the wrong choice one step.
Then flag it: "This path leads away from resolution. Here's why: [explanation]"
Branch back and offer the correct path forward.
Catastrophic choices create a second problem before being corrected.

GRADING (after each scenario):
Performance tier: OPTIMAL / ACCEPTABLE / LEARNING / ESCALATE
Narrative grade: one specific paragraph about THIS session's decisions —
what they checked first, best decision, worst decision, what optimal looks like.

SCENARIO LIBRARY — START WITH TIER 1 (5 scenarios):
1. The Slow Server — users report slowness, no errors, find the cause
2. The Script That Stopped Working — backup script ran, no backup, why?
3. The Unreachable Service — monitoring shows service down, server is up
4. The Disk That Filled Up — app crashing after log write, fix without data loss
5. The Deployment That Didn't Deploy — CI passed, old version still running

Required knowledge for Tier 1: bash scripting, Linux process management,
networking basics (ping, curl, dig, netstat), service management (systemctl).

UNLOCK SYSTEM:
Tier 2 unlocks after completing 3 Tier 1 scenarios at ACCEPTABLE or above.
Tier 3 unlocks after completing 3 Tier 2 scenarios at ACCEPTABLE or above.

SESSION REPORT (after every scenario):
Performance tier, decisions made, optimal vs wrong, narrative grade,
concept to review, DevOps connection, post seed, adaptive plan signal,
commit message to use.

OPENING SCREEN:
Show current tier, scenarios available, scenarios completed.
Start each scenario with the alert — no preamble, no tutorial.
The user is already on-call. They've been paged. Go.

VISUAL STYLE:
Dark terminal aesthetic. Monospace font.
Command input looks like a real terminal prompt.
Scenario text is urgent but factual — not dramatic.
Grading is direct — not harsh, not gentle. Just accurate.

DO NOT:
- Give hints before the user attempts
- Explain concepts before they're relevant
- Tell the user what to type
- Make scenarios feel like exercises — they should feel like incidents
- Celebrate correct answers — just advance the scenario
```

---

## HOW IT CONNECTS TO EVERYTHING ELSE

```
Labs (bash, Python, LabEx):
  Build syntax and concepts
    ↓
Postmortem reading (Saturday):
  Build vocabulary for real incidents
    ↓
Networking trainer:
  Build diagnostic pattern recognition
    ↓
Ultimate DevOps Trainer (weekly):
  Apply everything together under pressure
    ↓
Session report:
  Feeds adaptive plan signal on Sunday
  Generates post seed
  Tells you what to review in the labs

The trainer is the test.
The labs are the preparation.
You don't take the test before you prepare.
```

---

## WHEN TO USE IT

**Not daily.** Weekly. One full scenario per week.

When: after the week's work is done — Friday or Saturday.
Why: you need the week's learning fresh before you apply it.
How long: one scenario takes 20-40 minutes depending on depth.

Starting week: after the bash challenge completes (May 11+).
Starting tier: Tier 1, Scenario 1 — The Slow Server.
First session report fed into the first adaptive plan message (Sunday May 11).

---

## RUNNING LOG ITEMS FROM THIS CONCERN

**→ Execution list:**
Build Tier 1 (5 scenarios) first. Tier 2 after Docker is stable.
Paste the implementation prompt into the trainer app.
First session: Friday May 16 (after bash challenge completes + 5 days).

**→ Concern 11 (Adaptive Plan):**
Session report feeds the adaptive plan signal on Sunday.
"Struggled with [X] across scenarios → increase [X] in daily stack"
This is the feedback loop that makes the whole system self-correcting.

**→ Concern 1 (Script Intentionality):**
Scenario 2 (The Script That Stopped Working) directly uses the
incident-first format and the three script contexts from Concern 1.
The trainer and the labs teach the same vocabulary.

**→ Concern 4 (Networking Trainer):**
Scenario 3 (The Unreachable Service) uses exactly the diagnostic
pattern the networking trainer teaches — ping, curl, dig, netstat in order.
The networking trainer prepares you for the DevOps trainer scenarios.

**→ Concern 12 builds last because it requires everything else.**
The trainer is only useful once the tools are in place.
The labs build the foundation. The trainer applies it.
Build it now. Use it after the bash challenge completes.
