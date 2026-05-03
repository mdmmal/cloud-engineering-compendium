# Concern 12 — Ultimate DevOps Trainer (Refined)
## Full Spec + Implementation Prompt | Jamal Muhammad | May 2, 2026
## Refined after co-engineer review

---

## THE NORTH STAR

Labs teach: how to do something.
This trainer teaches: when to do it and why the order matters.

That distinction is the entire product.
Never lose it.

---

## WHAT THIS TRAINER IS

A decision engine with structured scenarios.
Not a DevOps simulator. Not a quiz. Not a command reference.

A decision engine where:
- Something is broken
- You have incomplete information
- You have to decide what to check first
- Every decision has a consequence
- The order matters as much as the knowledge

The real value: simulated pressure + forced prioritization.

---

## THE PRODUCT TRUTH

You are not building a smart command interpreter.
You are building a scenario tree with decision nodes.

Each node has:
- A situation description
- A set of choices (all plausible, not obviously wrong)
- A consequence per choice
- A next node per choice

That's the whole engine. Keep that framing and you move fast.

---

## THE V1 HARD SCOPE (NON-NEGOTIABLE)

V1 ships with exactly this. Nothing more.

```
✓ One scenario: The Slow Server
✓ 6-8 decision nodes
✓ Selectable commands (no free typing)
✓ Simple branching (guided correction, not stateful)
✓ Basic scoring (OPTIMAL / ACCEPTABLE / LEARNING)
✓ Session report at the end
✗ No free command typing
✗ No stateful consequence recovery
✗ No Tier 2 or Tier 3 content
✗ No dynamic interpretation
```

V1 proves the concept.
V2 adds stateful consequences and typed command hints.
V3 adds full free typing with interpretation.

Build V1. Ship V1. Then V2.

---

## THE SCENARIO SCHEMA

Every scenario follows this data structure.
Define this before writing any scenario content.
The engine loads this structure. The content populates it.

```python
scenario = {
    "id": "slow_server_01",
    "title": "The Slow Server",
    "tier": 1,
    "type": "beginning",  # beginning | middle
    "required_knowledge": ["linux_process", "bash_scripting", "log_reading"],

    "environment": {
        "cpu": "94%",
        "memory": "41%",
        "disk": "68%",
        "service_status": "running",
        "network": "no packet loss",
        "logs": "timeout errors connecting to database",
        "processes": "node process PID 4821 consuming 87% CPU"
    },

    "alert": {
        "text": "11:47pm. You get paged. Users reporting slow response times. No errors thrown. App is running. What do you do first?",
        "phase": "alert"
    },

    "nodes": {
        "start": {
            "phase": "alert",
            "text": "You receive the page. App is running. Users say it's slow. No visible errors.",
            "command_choices": [
                {
                    "label": "Check CPU and memory",
                    "command": "top",
                    "next": "cpu_check",
                    "effect": "optimal",
                    "output": "CPU: 94%  MEM: 41%  — node process PID 4821 using 87% CPU",
                    "feedback": None
                },
                {
                    "label": "Restart the application",
                    "command": "systemctl restart app",
                    "next": "premature_restart",
                    "effect": "bad",
                    "output": "Service restarted. Users report brief outage. Performance unchanged after restart.",
                    "feedback": "Restarting without diagnosis caused a brief outage and didn't fix anything. The cause is still there. Always diagnose before acting."
                },
                {
                    "label": "Check application logs",
                    "command": "tail -f /var/log/app/error.log",
                    "next": "log_check_early",
                    "effect": "acceptable",
                    "output": "Timeout errors connecting to database. Repeated every 2-3 seconds.",
                    "feedback": "Logs are useful but CPU check first would have pointed you here faster. Resource check before log check in a slowness incident."
                },
                {
                    "label": "Check disk usage",
                    "command": "df -h",
                    "next": "disk_check_early",
                    "effect": "bad",
                    "output": "Disk usage: 68%. Not the issue.",
                    "feedback": "Disk is fine. You spent time ruling out something that wasn't the problem. CPU check first for a slowness complaint."
                }
            ]
        },

        "cpu_check": {
            "phase": "investigation",
            "text": "top shows CPU at 94%. A node process (PID 4821) is using 87%. What do you do next?",
            "command_choices": [
                {
                    "label": "Check what that process is doing",
                    "command": "lsof -p 4821",
                    "next": "process_detail",
                    "effect": "optimal",
                    "output": "Process has 847 open file handles. Many are connections to database port 5432.",
                    "feedback": None
                },
                {
                    "label": "Kill the process",
                    "command": "kill -9 4821",
                    "next": "process_killed",
                    "effect": "bad",
                    "output": "Process killed. App crashes. It was the main application process. Now fully down.",
                    "feedback": "Killing the main application process without understanding what it's doing took the app from slow to down. Check before acting."
                },
                {
                    "label": "Check application logs now",
                    "command": "tail -f /var/log/app/error.log",
                    "next": "log_check_mid",
                    "effect": "acceptable",
                    "output": "Timeout errors to database. One every 2 seconds.",
                    "feedback": "Good pivot — logs confirm the database connection issue. Lsof would have shown you the same thing more precisely."
                },
                {
                    "label": "Check memory in detail",
                    "command": "free -h",
                    "next": "memory_check",
                    "effect": "bad",
                    "output": "Memory: 41% used. Not the constraint here.",
                    "feedback": "Memory is fine. You already knew CPU was the issue. Following the CPU lead was the right call."
                }
            ]
        }

        # Additional nodes continue in the same pattern...
        # Each scenario has 6-8 nodes covering all three phases.
    },

    "resolution": {
        "optimal_path": ["start", "cpu_check", "process_detail", "db_check", "connection_pool_fix", "verify"],
        "summary": "CPU spike caused by runaway database connection attempts. Fix: increase connection pool timeout and restart app cleanly.",
        "senior_path_time": "12 minutes",
    },

    "grading": {
        "optimal": {
            "min_correct": 5,
            "label": "OPTIMAL",
            "narrative_template": "You identified the CPU spike first and traced it to the database connection issue efficiently. {specific_feedback}"
        },
        "acceptable": {
            "min_correct": 3,
            "label": "ACCEPTABLE",
            "narrative_template": "You got to the root cause but took some detours. {specific_feedback}"
        },
        "learning": {
            "min_correct": 0,
            "label": "LEARNING",
            "narrative_template": "You found the issue eventually. Here's the optimal path and why each step mattered. {specific_feedback}"
        }
    }
}
```

---

## THE ENVIRONMENT STATE SYSTEM

Every scenario defines a controlled world.
Commands reveal slices of that world.
Nothing is dynamic — the world is pre-defined.

```python
environment = {
    "cpu": "94%",
    "memory": "41%",
    "disk": "68%",
    "service_status": "running",
    "network": "no packet loss to 10.0.2.15",
    "logs": "DB connection timeout every 2-3 seconds",
    "processes": "node PID 4821 at 87% CPU, 847 open file handles",
    "ports": "3000 listening, 5432 connection attempts failing",
    "dns": "resolves correctly",
    "uptime": "47 days"
}
```

When a user selects "Check CPU":
→ The output shows the CPU slice of the environment.

When a user selects "Check disk":
→ The output shows the disk slice.

When a user selects something irrelevant:
→ "That command runs but shows nothing useful here. X is not the issue."

The environment is the truth. Commands reveal it.
Nothing gets invented dynamically.

---

## THE COMMAND SELECTION SYSTEM (V1)

V1 presents 4 realistic choices per node.
All choices are plausible — none obviously wrong.
The wrong choices are things a junior engineer might actually do.

Choice format:
```
What do you do?

1) top          — Check CPU and memory usage
2) systemctl    — Restart the application service
3) tail -f      — Check application logs
4) df -h        — Check disk usage
```

The command is shown alongside a plain English description.
User picks a number.
Trainer shows the output of that command in this environment.
Then asks: what does this tell you? What next?

V2 evolution: "Type a command (hint: top, df, netstat, tail...)"
V3 evolution: Full free typing with interpretation.

---

## THE CORRECTION SYSTEM

### Type A — Guided Correction (V1 only)
Wrong choice → show consequence for one step → flag it → branch back to correct path.

```
You selected: systemctl restart app

[Output]: Service restarted. Brief outage for users.
          Performance unchanged after restart.

[FLAG]: This path leads away from resolution.
Restarting without diagnosis caused a brief outage and didn't fix the root cause.
The CPU spike is still there. Always diagnose before acting on a slowness complaint.

[Continuing from: CPU and memory check]
```

### Type B — Stateful Consequences (V2+)
Wrong choice persists. User must recover.

```
You killed the main application process.
App is now fully down. Users cannot access it.
You must now: restart the service correctly AND still find the original cause.

[This state persists. You are now managing an outage, not just slowness.]
```

V1 uses Type A only.
V2 introduces Type B for specific scenarios where the mistake is instructive to recover from.

---

## THE GRADING SYSTEM

### Performance Tiers

**OPTIMAL:** Checked the right thing first. Traced the issue efficiently.
Resolved without causing new problems. Verified the fix.
Response: "You worked this like a senior engineer. [specific detail]"

**ACCEPTABLE:** Got to the right answer. Took some wrong turns.
Resolved but less efficiently than optimal.
Response: "You solved it. Here's where you lost time and why."

**LEARNING:** Went down multiple wrong paths. Got there eventually.
Or identified the issue but fixed it incorrectly.
Response: "You found it. Here's the optimal path step by step and why each decision mattered."

**ESCALATE:** Could not identify the issue or made it significantly worse.
Response: "A senior engineer would have escalated after X minutes.
Here's what they would have said and why escalation is the right call here."

### The Narrative Grade

One specific paragraph after the tier. Always references THIS session.

```
You correctly checked CPU first — that's the right instinct for a slowness complaint.
Your mistake was trying to kill the process before understanding what it was doing.
That turned a slowness incident into an outage. The right move after seeing 94% CPU
is to identify what the process is connected to before touching it.
The concept to review: always understand before you act.
Logs and lsof before kill and restart. Every time.
```

The narrative grade is the most valuable output of the trainer.
It is specific, direct, and connects to real production consequences.

---

## THE SESSION REPORT

```
SESSION REPORT — Ultimate DevOps Trainer
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Date: [date]
Scenario: [name + ID]
Tier: [1 / 2 / 3]
Type: [beginning / middle]

Performance: [OPTIMAL / ACCEPTABLE / LEARNING / ESCALATE]

Decisions: [X] total | [X] optimal | [X] acceptable | [X] wrong
Wrong paths taken: [X]
Consequences triggered: [X]

Narrative grade:
[The specific paragraph]

Optimal path was:
[start] → [cpu_check] → [process_detail] → [db_check] → [fix] → [verify]
You took:
[start] → [premature_restart] → [corrected] → [cpu_check] → [process_detail] → [fix] → [verify]
Steps over optimal: +2

Weakest decision: [the choice that cost the most or was most consequential]

Concept to review: [specific concept]
→ Review in: [networking trainer scenario X / bash lab / postmortem: GitHub 2018]

DevOps connection:
[What this scenario maps to in real production]
[What tool or system automates this in a mature environment]

Post seed:
[One post idea — what happened + what you learned in plain language]

Adaptive plan signal:
[If a concept was consistently wrong, flag it here]
"Struggled with process diagnosis → add lsof and strace to bash lab this week"

Commit message:
devops-trainer: scenario [id] — [tier] — [performance] — [key concept]

Next recommended scenario: [name]
```

---

## THE SCENARIO LIBRARY

### TIER 1 — Current Knowledge (Bash + Linux + Networking basics)

| # | Scenario | Type | Key Concept Tested |
|---|---|---|---|
| 1 | The Slow Server | Beginning | Prioritization — resource check before restart |
| 2 | The Script That Stopped | Middle | Cron environment vs script logic vs permissions |
| 3 | The Unreachable Service | Beginning | Network layer diagnosis — ping vs curl vs netstat |
| 4 | The Disk That Filled | Middle | Identify cause before fix — find before delete |
| 5 | The Deployment That Didn't | Beginning | Pipeline understanding — where in the chain did it fail |

**Unlock condition:** Complete 3 at ACCEPTABLE or above → Tier 2 unlocks

### TIER 2 — Intermediate (Docker + AWS basics required)

| # | Scenario | Type | Key Concept |
|---|---|---|---|
| 6 | Container Won't Start | Beginning | Docker logs → env vars → port conflicts |
| 7 | EC2 You Can't SSH Into | Beginning | Security group → route table → NACL → key pair |
| 8 | Pipeline Broke After Working | Middle | Credentials → external deps → Docker build |
| 9 | Database Lost Connections | Middle | Container network → volume → port → service |
| 10 | Terraform Partially Failed | Middle | State file → error → retry vs destroy |

### TIER 3 — Advanced (CI/CD + Kubernetes + Terraform required)

| # | Scenario | Type |
|---|---|---|
| 11 | Kubernetes Pod CrashLooping | Beginning |
| 12 | Multi-Region Failover Decision | Middle |
| 13 | Security Group Change Broke Prod | Middle |
| 14 | Alert With No Obvious Cause | Beginning |
| 15 | Full Incident — Alert to RCA | Beginning |

---

## THE EVOLUTION PATH

```
V1 (build now):
  - 1 scenario (The Slow Server)
  - 6-8 nodes
  - Selectable commands (numbered choices)
  - Type A correction (branch back)
  - 3 performance tiers
  - Session report

V2 (after V1 ships and proves the concept):
  - All 5 Tier 1 scenarios
  - Type B stateful consequences on 2 scenarios
  - Typed command with hint: "Type a command (hint: top, df, tail...)"
  - Full grading system with narrative grade
  - Scenario unlock system

V3 (after Docker + AWS stable):
  - Tier 2 scenarios
  - Full free command typing with interpretation
  - Cross-scenario adaptive plan signal
  - Environment state that changes across a session
```

---

## V1 BUILD PLAN — CONCRETE STEPS

Step 1 — Build the engine (no content yet)
```
- Load a scenario object
- Display the current node text
- Show the command choices as numbered options
- Accept user input (1/2/3/4)
- Move to next node based on choice
- Show the output for that choice
- If bad choice: show consequence + flag + branch back
- Repeat until resolution node
- Show session report
```

Step 2 — Build The Slow Server scenario using the schema
```
- Write all 6-8 nodes
- Define environment state
- Write all choices (make wrong choices plausible)
- Write all feedback for wrong choices
- Write the optimal path
- Write the narrative grade templates
```

Step 3 — Test it
```
- Go through optimal path → verify it feels correct
- Go through wrong paths → verify consequences feel real
- Check that narrative grade references the actual decisions
- Check that session report outputs correctly
```

Step 4 — Ship V1

---

## THE IMPLEMENTATION PROMPT (REVISED)

Paste this into the app that builds the trainer.

```
Build the Ultimate DevOps Trainer V1 — a decision engine with structured scenarios
for beginner DevOps engineers.

CORE CONCEPT:
This is NOT a command interpreter. It is a scenario tree with decision nodes.
The user makes choices. Each choice has a consequence. The order of decisions
is what gets graded — not just whether the final answer is correct.

V1 HARD CONSTRAINTS (do not expand beyond these):
- One scenario only: "The Slow Server"
- 6-8 decision nodes
- Selectable commands (numbered choices, no free typing)
- Type A correction: wrong choice → consequence → explanation → branch back to correct path
- Basic scoring: OPTIMAL / ACCEPTABLE / LEARNING
- Session report at end

THE ENGINE (build this first, no content):
1. Load a scenario object (defined in schema below)
2. Display current node: situation text + command choices
3. Accept user input: number 1-4
4. Show the output for that command in this environment
5. If effect is "bad": show consequence output + flag message + branch back
6. If effect is "acceptable": show output + brief note + continue
7. If effect is "optimal": show output + continue
8. Move to next node
9. Repeat until resolution node reached
10. Calculate score based on optimal vs wrong decisions
11. Display session report

THE SCENARIO SCHEMA:
Every scenario is a Python/JS object with:
- id, title, tier, type (beginning/middle)
- environment: {cpu, memory, disk, service_status, network, logs, processes}
- nodes: dict of node objects
- Each node has: phase, text, command_choices array
- Each choice has: label, command, next (node id), effect, output, feedback

THE COMMAND CHOICE FORMAT:
Show 4 choices per node. All plausible — none obviously wrong.
Format:
  What do you do?
  1) top      — Check CPU and memory usage
  2) systemctl restart — Restart the application service
  3) tail -f  — Check application logs
  4) df -h    — Check disk usage

THE CORRECTION FORMAT (Type A):
Wrong choice:
  [Output of that command in this environment]
  [FLAG]: This path leads away from resolution.
  [One paragraph: why it was wrong, what it causes in production, right reasoning]
  [Continuing from: correct path node]

THE GRADING:
Count optimal decisions vs wrong decisions.
OPTIMAL: 5+ optimal out of 6-8
ACCEPTABLE: 3-4 optimal
LEARNING: under 3 optimal

Session report includes:
- Performance tier
- Decisions breakdown
- Narrative grade (specific to this session's choices)
- Optimal path vs path taken
- Weakest decision
- Concept to review
- Post seed
- Commit message

THE SLOW SERVER SCENARIO:
Environment:
  CPU: 94%
  Memory: 41%
  Disk: 68%
  Service status: running
  Logs: DB connection timeout every 2-3 seconds
  Processes: node PID 4821 at 87% CPU, 847 open file handles
  Network: no packet loss

Alert: "11:47pm. Paged. Users report slow response times. No errors. App running."

Optimal path: check CPU → identify process → check connections → find DB timeout →
              fix connection pool config → restart cleanly → verify

Wrong paths that feel plausible:
- Restart service immediately (outage, doesn't fix root cause)
- Check disk first (not the issue, wastes time)
- Kill the process (app goes fully down)
- Check memory in detail (not the constraint)

VISUAL STYLE:
Dark terminal aesthetic. Monospace font.
Scenario text is urgent and factual. No drama.
Command output looks like real terminal output.
Correction flags are clear but not condescending.
No celebration for correct choices — just the next step.

DO NOT BUILD:
- Free command typing
- Dynamic command interpretation
- Stateful consequences (V2 feature)
- Multiple scenarios (V1 is one scenario only)
- Tier 2 or 3 content
```

---

## WHEN TO BUILD AND USE

**Build V1:** This week or next. One scenario. Ship it.
**First use:** Friday May 16 — after bash challenge completes.
**Frequency:** Once per week. Friday or Saturday. One scenario per session.
**Session report:** Feeds Sunday adaptive plan message.

---

## RUNNING LOG ITEMS FROM THIS CONCERN

**→ Execution list:**
Build V1 engine first — no content, just the decision tree loader.
Then build The Slow Server scenario using the schema.
Test both wrong paths and optimal path before shipping.
First session: Friday May 16.

**→ Concern 11 (Adaptive Plan):**
Session report adaptive plan signal feeds directly into Sunday message.
"Struggled with process diagnosis → add lsof to bash labs this week"
This is the feedback loop that makes the whole system self-correcting.

**→ Concern 1 (Script Intentionality):**
The Slow Server scenario directly tests the three script contexts.
Triage (what's wrong) → Gate (is it safe to restart) → Automate (monitor it).
Same vocabulary. Same incident-first format.

**→ Concern 4 (Networking Trainer):**
Scenario 3 (Unreachable Service) is the networking trainer's
Applied difficulty in scenario form.
The networking trainer prepares you for it. The DevOps trainer applies it.
