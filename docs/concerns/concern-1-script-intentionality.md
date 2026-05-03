# Concern 1 — Script Intentionality
## Full Spec | Jamal Muhammad | May 2, 2026

---

## THE CORE PROBLEM

Scripts have been written without incidents that created the need for them.
Syntax came first. Scenario was an afterthought or missing entirely.
The result: functional scripts with no situational understanding.
You can write the code. You cannot yet describe the problem it solves.

The fix: incident before prompt, prompt before syntax, syntax serves the incident.
In that order. Always.

---

## THE CORE RULE

No script gets written without an incident that created the need for it.

```
INCIDENT (what broke and why it matters)
    ↓
SCENARIO (what the script needs to do)
    ↓
SYNTAX (how the script does it)
    ↓
KEY (production context + pipeline position + vocabulary)
```

---

## THE THREE SCRIPT CONTEXTS

Every script belongs to one of three contexts.
Knowing the context tells you what the script needs to do
before you write a single line.

### Context 1 — Triage
Something is wrong. You don't know what yet.
Scripts here: fast information gathering. System state. What's running.
What's consuming resources. Recent changes. Logs.

### Context 2 — Gate
Something is about to happen. You need to verify it's safe.
Scripts here: validation before action. Checks that block if conditions aren't met.
Exit codes that stop pipelines from proceeding.

### Context 3 — Automate
Something needs to happen repeatedly without a human doing it.
Scripts here: scheduled tasks, batch operations, maintenance routines.
Set it up once. It runs without you.

---

## THE NEW LAB FORMAT STANDARD

Every lab — guided, review, and regular — follows this structure.
The incident layer is required before every prompt.
No exceptions going forward.

```markdown
---

## PROMPT [N] — [Script Name]

### THE INCIDENT
[Plain English for prompts 1-2. Technical language for prompts 3+.]
[Written like a Slack message at 2am from the on-call engineer.]
[2-4 sentences maximum.]

Plain English style (prompts 1-2):
"The app is slow. Nobody knows why. The on-call engineer needs
to see what's actually running on the server before paging anyone else."

Technical style (prompt 3+):
"CPU utilization spiked to 94% on prod-web-03 at 23:47 UTC.
The deployment from 23:30 is suspected. Jenkins build #847 completed
but the health check passed. Engineer needs to validate system state
before initiating rollback."

---

### WHAT THIS SITUATION IS ASKING FOR
[One line. The type of solution — not a syntax hint.]
"A script that gives a fast picture of system health so a decision
can be made without guessing."

---

### DESIRED OUTPUT
[Exact terminal output the script should produce when run correctly.]

Example:
=== System Health — prod-web-03 ===
Timestamp:    Tue May 2 23:52:01 UTC 2026
CPU Load:     94%   [WARNING]
Memory Free:  2.1GB [OK]
Disk Usage:   67%   [OK]
Top Process:  node (PID 4821) — 87% CPU
==========================================
Status: INVESTIGATE — High CPU detected

---

### CONCEPTS IN PLAY
[Not syntax. What DevOps concepts this touches.]
- System observability — knowing state before acting
- Pre-rollback validation — confirming the problem before the fix
- On-call triage — the first 60 seconds of an incident

---

### HINTS
Guided labs:  3 hints available
Review labs:  1 hint available
Regular labs: 0 hints

Hint 1: [conceptual — what to think about]
Hint 2: [structural — what sections the script needs]
Hint 3: [syntax — one specific command]

---

### WRITE YOUR SCRIPT HERE

---

### THE KEY

#### The Script
[Full working solution]

#### Why Every Section Exists
[Line by line — decisions, not just syntax]

#### Production Context
[Where does this script actually live and run?
What team uses it? When? What happens before it and after it?]

#### Pipeline Position
[Where in the DevOps flow does this script sit?
What triggers it? What does it feed into?]

#### What Breaks If This Doesn't Exist
[The cost of not having it. What goes wrong without it.]

#### DevOps Vocabulary From This Incident
[3-5 terms this incident introduced or reinforced]
- [term]: [plain English definition]
---
```

---

## WHERE YOUR EXISTING SCRIPTS MAP

Every script you've already written now has a context and an incident.

| Script | Context | Incident | Pipeline Position |
|---|---|---|---|
| `deploy_check.sh` | Triage | Engineer needs system context before approving deploy | Pre-deployment |
| `readiness_check.sh` | Gate | Pipeline needs to verify system is ready before proceeding | Jenkins pre-stage |
| `health_snapshot.sh` | Triage | On-call needs fast picture of system state at incident time | First 60s of incident |
| `log_checker.sh` | Triage | Engineer needs to find errors before escalating | Incident investigation |
| `pipeline_run.sh` | Gate | Manual version of CI stage validation | CI/CD simulation |
| `preflight.sh` | Gate | Pre-flight validation before deployment kicks off | Pre-deployment |
| `tag_parser.sh` | Gate | Validates deploy tag format before pipeline proceeds | CI tag validation |
| `backup_rotate.sh` | Automate | Nightly backup with automatic old backup cleanup | Scheduled ops |
| `log_monitor.sh` | Automate | Continuous error watching without manual log reading | Ongoing monitoring |
| `alert_manager.sh` | Automate | Automatic threshold detection and notification | Monitoring layer |
| `server_inventory.sh` | Triage | Fleet check before fleet-wide operation | Pre-maintenance |
| `deploy_pipeline.sh` | Gate | Full pipeline simulation — all stages with exit codes | CI/CD education |
| `ops_toolkit.sh` | All three | Unified tool — triage + gate + automate combined | Daily ops |

---

## THE INCIDENT TEMPLATE

Two formats. Plain English first. Technical as difficulty increases.

### Plain English (Prompts 1-2):
```
[Time]. [What the symptom is]. [Who noticed it].
[What they need to know before they act].
```

Example:
"2am. The app is responding slowly. The on-call engineer got paged.
They need to see what's happening on the server before waking anyone else up."

### Technical (Prompts 3+):
```
[Timestamp UTC]. [Specific metric or error]. [System or service affected].
[What was happening immediately before]. [What decision needs to be made now].
```

Example:
"23:47 UTC. CPU at 94% on prod-web-03. Deployment #847 completed at 23:30.
Health checks passed but response latency spiked from 120ms to 4.2s.
Engineer needs to validate system state before initiating rollback procedure."

---

## THE DEVOPS SCRIPT VOCABULARY

These are the terms you're building fluency in.
After 30 sessions of labs built this way, you'll match these to incidents
without thinking.

| Term | What It Means | Script Context |
|---|---|---|
| Triage | First assessment before acting | Context 1 |
| Runbook | Step-by-step incident response guide | Context 1-2 |
| Health check | Validation of system state | Context 2 |
| Gate check | Blocks action if conditions not met | Context 2 |
| Rollback | Revert to previous working state | Context 2 |
| On-call | Engineer responsible for responding to incidents | All |
| Postmortem | Analysis written after an incident resolves | All |
| Pipeline stage | Step in the CI/CD automation flow | Context 2-3 |
| Rotation | Scheduled maintenance cycle | Context 3 |
| Idempotent | Safe to run multiple times with same result | Context 3 |
| Escalation | Passing an incident to a higher level team | Context 1 |
| MTTR | Mean time to recovery — how fast you fix it | All |
| SLA | Service level agreement — the uptime promise | All |
| Blast radius | How much breaks if this goes wrong | Context 2 |

---

## THE SATURDAY POSTMORTEM HABIT

Added to the curriculum. Every Saturday. 20 minutes. One real incident.
Not studying. Absorbing vocabulary.

**Where to read:**
```
github.com/danluu/post-mortems     — real company incidents, curated
sre.google/sre-book/ Chapter 14-15 — Google's incident management
aws.amazon.com/message/            — AWS service health postmortems
pagerduty.com/resources/           — runbook format used in production
```

**What to do after reading:**
One sentence. Goes in `_weekly/week-XX-summary.md` under Incident Vocab.
"This happened because X and the script that would have helped is Y context."

**First three to read in order:**
1. GitHub October 21 2018 — database failover gone wrong
2. Cloudflare July 2019 — BGP routing incident
3. Google Gmail 2014 — cascading failures

**Why this matters:**
After 10 postmortems you'll have a mental library of incident types.
When someone describes a real problem you'll recognize the pattern.
That's solution recognition. The trainer drills it.
The postmortems build the vocabulary that makes the drilling stick.

---

## HOW THIS CONNECTS TO THE FULL SYSTEM

```
LabEx concept (syntax foundation)
    ↓
Guided lab with incident layer (syntax + context)
    ↓
Review lab with incident layer (retention + context)
    ↓
Regular lab with incident layer (application + context)
    ↓
Saturday postmortem reading (vocabulary absorption)
    ↓
DevOps Trainer — Concern 12 (diagnosis + decision making)
```

The labs build the syntax muscle.
The postmortems build the vocabulary.
The DevOps Trainer is where both combine —
real incidents, no hints, diagnose and respond.

You are here: Guided labs moving into regular labs.
The trainer is the destination. Not the starting point.

---

## RUNNING LOG ITEMS FROM THIS CONCERN

**→ Curriculum update:** Saturday postmortem reading slot added.
20 minutes. One real incident. First three named above.
Add to `_weekly/` summary under Incident Vocab section.

**→ Concern 12 (Ultimate DevOps Trainer):**
Confirmed as separate tool. Not the lab system at advanced mode.
The trainer is diagnosis + decision making + response — no hints, no key.
The lab system feeds it. Builds when concerns 1-10 are resolved.

**→ All existing labs retroactively need incident headers.**
When the bash chat generates new labs, the incident header is required.
Old labs: add the context mapping from the table above to the script header.
New labs: incident comes first, always.

**→ Concern 4 (Networking):**
The DevOps vocabulary table above applies to networking scenarios too.
Triage, gate, and automate contexts exist in networking scripts as well.
The redesigned networking tool uses the same incident-first structure.

**→ Lab format spec:**
This document is the spec the bash chat receives going forward.
Every new lab generated uses the format defined in Component 2 above.
Paste the lab format section into the bash chat as the new standard.
