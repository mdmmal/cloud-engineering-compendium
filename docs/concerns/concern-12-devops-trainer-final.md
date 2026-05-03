# Concern 12 — Ultimate DevOps Trainer V1 Blueprint (Final)
## Locked spec after two rounds of co-engineer review | May 2, 2026

---

## THE PRODUCT TRUTH (NEVER LOSE THIS)

Labs teach: how to do something.
This trainer teaches: when to do it and why the order matters.

You are not building a DevOps simulator.
You are building a decision engine with structured scenarios.

The real value: simulated pressure + forced prioritization.

---

## V1 NON-NEGOTIABLE CONSTRAINTS

```
✓ 1 scenario only: The Slow Server
✓ 6-8 decision nodes
✓ No free typing — numbered choices only
✓ Guided correction only (Type A — no stateful damage)
✓ CLI-style interaction (aesthetic, not technical limitation)
✓ Simple scoring (steps, mistakes, first decision quality)
✓ Basic session report (4 fields only — no narrative generator)
✗ No free command typing
✗ No stateful consequences (V2)
✗ No narrative grade generator (V2)
✗ No adaptive system integration (V2)
✗ No multiple scenarios (V1 is one only)
✗ No Tier 2 or 3 content
```

V1 teaches correct thinking.
V2 simulates real damage.
Build V1. Ship V1. Then V2.

---

## THE SCENARIO DESIGN RULE SET (NON-NEGOTIABLE FOR V1)

Before writing a single node, enforce these rules.
If a scenario violates any rule, rewrite before building.

```
Rule 1: One root cause only
  The scenario has exactly one thing wrong.
  All investigation leads to that one thing.
  No multi-cause scenarios in V1.

Rule 2: One optimal path
  There is exactly one sequence of decisions that resolves
  the issue in the fewest correct steps.
  The optimal path is designed before any wrong paths.

Rule 3: Max 2 wrong branches per node
  Each decision node has max 4 choices total.
  Max 2 are wrong. At least 1 is optimal. At least 1 is acceptable.
  Wrong choices must both be plausible under pressure.

Rule 4: No hidden trick knowledge
  Every optimal decision can be reasoned from available information.
  No scenario requires knowing an obscure command or AWS-specific behavior
  that a beginner DevOps engineer wouldn't have.

Rule 5: Every wrong choice must be defensible
  A smart junior engineer could choose every wrong option.
  If "restart the server" is a wrong choice, it must be something
  a reasonable person under pressure would actually do.
  "Obviously wrong" choices break realism.
```

---

## THE FINAL SCENARIO SCHEMA

Every field is required. Build to this schema. Do not improvise.

```python
scenario = {
    "id": "slow_server_v1",
    "title": "The Slow Server",
    "tier": 1,
    "type": "beginning",

    # The controlled world of this scenario
    # All command outputs are derived from this
    "environment": {
        "cpu": "94%",
        "memory": "41%",
        "disk": "68%",
        "service_status": "running",
        "network": "no packet loss to 10.0.2.15",
        "logs": "DB connection timeout every 2-3 seconds",
        "processes": "node PID 4821 at 87% CPU, 847 open file handles to DB port 5432",
        "ports": "3000 listening, 5432 connection attempts timing out"
    },

    # Commands map to environment slices
    # Choices trigger commands, commands reveal environment
    "commands": {
        "top": {
            "output": "CPU: 94%  MEM: 41%\nnode  PID 4821  87.3 CPU  2.1 MEM",
            "reveals": "high_cpu_node_process"
        },
        "df_h": {
            "output": "Filesystem  Size  Used  Avail  Use%\n/dev/sda1   100G   68G    32G   68%",
            "reveals": "disk_not_issue"
        },
        "tail_log": {
            "output": "[ERROR] DB connection timeout after 30s\n[ERROR] DB connection timeout after 30s\n[ERROR] DB connection timeout after 30s",
            "reveals": "db_connection_failure"
        },
        "systemctl_restart": {
            "output": "Service stopped. Service started.\nUsers experience outage during restart.",
            "reveals": "premature_restart_consequence"
        },
        "lsof_p": {
            "output": "node  4821  847 open file handles\nMostly: TCP connections to 10.0.2.15:5432 in CLOSE_WAIT state",
            "reveals": "connection_pool_exhausted"
        },
        "netstat": {
            "output": "Active connections to :5432: 847\nState: CLOSE_WAIT (connection not properly released)",
            "reveals": "connection_pool_exhausted"
        },
        "free_h": {
            "output": "Mem:  8.0G  3.3G used  4.7G free\nSwap: 2.0G  0.0G used",
            "reveals": "memory_not_issue"
        }
    },

    # Where the scenario starts
    "start": "alert_1",

    # Hard end conditions — no ambiguity
    "end_conditions": {
        "success": "connection_pool_fixed AND service_verified_healthy",
        "fail": "critical_mistakes >= 3 OR escalation_triggered"
    },

    "nodes": {
        "alert_1": {
            "phase": "alert",
            "intent": "prioritization",
            "text": "11:47pm. You get paged. Users are reporting slow response times. No error messages. The app is running. What do you do first?",
            "choices": [
                {
                    "text": "Check CPU and memory usage",
                    "command": "top",
                    "next": "cpu_identified",
                    "effect": "optimal",
                    "feedback": None
                },
                {
                    "text": "Restart the application service",
                    "command": "systemctl_restart",
                    "next": "premature_restart",
                    "effect": "bad",
                    "is_critical": True,
                    "feedback": "Restarting without diagnosis caused a brief outage and didn't fix anything. The root cause is still there. For slowness complaints: diagnose first, act second."
                },
                {
                    "text": "Check application logs",
                    "command": "tail_log",
                    "next": "log_check_early",
                    "effect": "acceptable",
                    "feedback": "Logs show the DB timeout — useful information. CPU check first would have pointed here faster. For slowness: resource check before log check."
                },
                {
                    "text": "Check disk usage",
                    "command": "df_h",
                    "next": "disk_check_irrelevant",
                    "effect": "bad",
                    "is_critical": False,
                    "feedback": "Disk is at 68% — not the issue. For a slowness complaint without errors, CPU and memory are more likely culprits than disk."
                }
            ]
        },

        "cpu_identified": {
            "phase": "investigation",
            "intent": "diagnosis",
            "text": "top shows CPU at 94%. A node process (PID 4821) is consuming 87%. What do you do next?",
            "choices": [
                {
                    "text": "Check what that process is connected to",
                    "command": "lsof_p",
                    "next": "connection_found",
                    "effect": "optimal",
                    "feedback": None
                },
                {
                    "text": "Kill the process",
                    "command": "kill_process",
                    "next": "process_killed",
                    "effect": "bad",
                    "is_critical": True,
                    "feedback": "Killing the main application process without understanding what it was doing took the app from slow to fully down. Check connections before killing."
                },
                {
                    "text": "Check memory in detail",
                    "command": "free_h",
                    "next": "memory_irrelevant",
                    "effect": "bad",
                    "is_critical": False,
                    "feedback": "Memory is fine at 41%. You already knew CPU was the issue. Following the CPU lead to lsof was the right next step."
                },
                {
                    "text": "Check active network connections",
                    "command": "netstat",
                    "next": "connection_found",
                    "effect": "acceptable",
                    "feedback": "Netstat shows the connection issue — good. lsof -p 4821 would have been more targeted since you already had the PID."
                }
            ]
        },

        "connection_found": {
            "phase": "investigation",
            "intent": "diagnosis",
            "text": "You can see 847 open connections to the database port (5432), all in CLOSE_WAIT state. Connections are not being released. What does this tell you and what do you check next?",
            "choices": [
                {
                    "text": "Check the database connection pool configuration",
                    "command": "cat_config",
                    "next": "config_found",
                    "effect": "optimal",
                    "feedback": None
                },
                {
                    "text": "Restart the database service",
                    "command": "restart_db",
                    "next": "db_restarted",
                    "effect": "bad",
                    "is_critical": True,
                    "feedback": "Restarting the database would drop all connections and could cause data loss if writes were in progress. CLOSE_WAIT connections indicate an app-side configuration issue, not a database issue."
                },
                {
                    "text": "Check if the database is reachable",
                    "command": "ping_db",
                    "next": "db_reachable",
                    "effect": "acceptable",
                    "feedback": "DB is reachable — useful confirmation. But CLOSE_WAIT connections already told you the DB is up. The issue is on the app side: connections aren't being released."
                },
                {
                    "text": "Restart the application now that you know it's a connection issue",
                    "command": "systemctl_restart",
                    "next": "restart_without_config_fix",
                    "effect": "bad",
                    "is_critical": False,
                    "feedback": "Restarting will temporarily clear the CLOSE_WAIT connections but they'll accumulate again because the config is wrong. Fix the config first, then restart."
                }
            ]
        },

        "config_found": {
            "phase": "resolution",
            "intent": "action",
            "text": "The connection pool config shows max_connections: 10 with no timeout setting. The app has been leaking connections for hours. You need to fix this. What do you do?",
            "choices": [
                {
                    "text": "Update config: set connection timeout + increase pool size, then restart cleanly",
                    "command": "fix_config_restart",
                    "next": "verify",
                    "effect": "optimal",
                    "feedback": None
                },
                {
                    "text": "Just increase max_connections and restart",
                    "command": "increase_connections",
                    "next": "partial_fix",
                    "effect": "acceptable",
                    "feedback": "Increasing max_connections buys time but doesn't fix the leak. Without a connection timeout, connections will accumulate again. Both settings are needed."
                },
                {
                    "text": "Restart first, then fix the config after",
                    "command": "restart_then_fix",
                    "next": "restart_before_fix",
                    "effect": "bad",
                    "is_critical": False,
                    "feedback": "Restarting with the broken config means it'll start leaking immediately again. Fix before restarting so the restart is meaningful."
                },
                {
                    "text": "Kill all CLOSE_WAIT connections manually then restart",
                    "command": "kill_connections",
                    "next": "manual_kill",
                    "effect": "bad",
                    "is_critical": False,
                    "feedback": "Manual connection killing works in an emergency but doesn't fix the underlying config. The leak will recur within minutes."
                }
            ]
        },

        "verify": {
            "phase": "resolution",
            "intent": "verification",
            "text": "Config updated and service restarted cleanly. How do you verify the fix worked?",
            "choices": [
                {
                    "text": "Check CPU, then check active connections, then check logs",
                    "command": "full_verify",
                    "next": "success",
                    "effect": "optimal",
                    "feedback": None
                },
                {
                    "text": "Ask a user if the app feels faster",
                    "command": "ask_user",
                    "next": "partial_verify",
                    "effect": "bad",
                    "is_critical": False,
                    "feedback": "User feedback is a lagging indicator. Check the metrics first: CPU should be down, connection count should be low, logs should be clean. Then user feedback confirms."
                },
                {
                    "text": "Check CPU only",
                    "command": "top",
                    "next": "partial_verify",
                    "effect": "acceptable",
                    "feedback": "CPU down is a good signal but not complete verification. Also check active connections (the root cause) and logs (confirm no new errors)."
                },
                {
                    "text": "Monitor for 5 minutes and see if it stays stable",
                    "command": "watch_wait",
                    "next": "success",
                    "effect": "acceptable",
                    "feedback": "Waiting is reasonable but passive. Active verification (CPU + connections + logs) gives you faster confidence and a clear record of what you checked."
                }
            ]
        },

        "success": {
            "phase": "end",
            "intent": None,
            "text": "CPU is back to 12%. Active connections to DB: 8 (within pool limit). Logs are clean. Users confirm app is responsive. Incident resolved.",
            "is_terminal": True,
            "outcome": "success"
        }
    },

    # For scoring
    "optimal_path": ["alert_1", "cpu_identified", "connection_found", "config_found", "verify", "success"],
    "optimal_step_count": 5,

    # For session report
    "root_cause": "Connection pool misconfiguration causing connection leak under load",
    "key_concept": "Diagnose before acting. Resource check before restart. Config fix before service restart.",
    "devops_connection": "This is one of the most common production incidents. In mature environments, connection pool metrics are tracked in Prometheus and alert before CPU spikes. The manual diagnosis you just did is what becomes the monitoring rule.",
    "review_resource": "Networking trainer — connection states (CLOSE_WAIT, TIME_WAIT). Bash labs — lsof and netstat commands."
}
```

---

## THE V1 ENGINE LOOP

Build this first. No scenario content yet. Just the loop.

```python
def run_trainer(scenario):
    score = {
        "steps": 0,
        "mistakes": 0,
        "critical_mistakes": 0,
        "first_decision": None,
        "path_taken": []
    }

    current_node_id = scenario["start"]

    while True:
        node = scenario["nodes"][current_node_id]

        # Check end condition
        if node.get("is_terminal"):
            show_session_report(scenario, score)
            break

        # Check fail condition
        if score["critical_mistakes"] >= 3:
            trigger_escalation(scenario, score)
            break

        # Display current situation
        display_node(node)

        # Get user choice
        choice_index = get_user_input(len(node["choices"]))
        choice = node["choices"][choice_index]

        # Record first decision
        if score["steps"] == 0:
            score["first_decision"] = choice["effect"]

        # Apply effect
        score["steps"] += 1
        score["path_taken"].append(current_node_id)

        if choice["effect"] == "bad":
            score["mistakes"] += 1
            if choice.get("is_critical"):
                score["critical_mistakes"] += 1
            show_consequence(scenario, choice)  # show the command output
            show_correction(choice["feedback"])  # flag + explanation
            # Branch back — do not advance to wrong node
            # Stay on current node or advance to the redirected path
        else:
            show_command_output(scenario, choice)  # show the command output
            if choice.get("feedback"):  # acceptable path
                show_note(choice["feedback"])
            current_node_id = choice["next"]


def display_node(node):
    print(f"\n{'─' * 50}")
    print(f"[{node['phase'].upper()}]")
    print(f"\n{node['text']}\n")
    for i, choice in enumerate(node["choices"], 1):
        print(f"  {i}) {choice['command'].ljust(20)}  {choice['text']}")
    print()


def show_command_output(scenario, choice):
    command = choice["command"]
    if command in scenario["commands"]:
        print(f"\n$ {command}")
        print(scenario["commands"][command]["output"])


def show_consequence(scenario, choice):
    # Show what happens when you make the wrong choice
    show_command_output(scenario, choice)
    print("\n[CONSEQUENCE TRIGGERED]")


def show_correction(feedback):
    print(f"\n[FLAG] This path leads away from resolution.")
    print(f"{feedback}")
    print("\n[Returning to investigation path...]\n")


def show_session_report(scenario, score):
    # V1 session report — 4 fields only
    optimal_steps = scenario["optimal_step_count"]
    steps_over = score["steps"] - optimal_steps

    if score["mistakes"] == 0:
        tier = "OPTIMAL"
    elif score["mistakes"] <= 2:
        tier = "ACCEPTABLE"
    elif score["critical_mistakes"] == 0:
        tier = "LEARNING"
    else:
        tier = "ESCALATE"

    print(f"\n{'━' * 50}")
    print(f"SESSION REPORT — {scenario['title']}")
    print(f"{'━' * 50}")
    print(f"Performance:      {tier}")
    print(f"Steps taken:      {score['steps']} (optimal: {optimal_steps}, +{steps_over})")
    print(f"Mistakes:         {score['mistakes']} ({score['critical_mistakes']} critical)")
    print(f"First decision:   {score['first_decision'].upper()}")
    print(f"\nYour path:        {' → '.join(score['path_taken'])}")
    print(f"Optimal path:     {' → '.join(scenario['optimal_path'])}")
    print(f"\nRoot cause:       {scenario['root_cause']}")
    print(f"Key concept:      {scenario['key_concept']}")
    print(f"\nReview:           {scenario['review_resource']}")
    print(f"\nPost seed:        '{scenario['title']} — diagnosed {scenario['root_cause']} using {score['steps']} steps. Optimal is {optimal_steps}.'")
    print(f"\nCommit:           devops-trainer: slow-server-v1 — {tier.lower()} — connection-pool-diagnosis")
    print(f"{'━' * 50}\n")
```

---

## THE V1 BUILD SEQUENCE

### Step 1 — Engine only, no scenario content

Build the loop. Load a dummy scenario with 3 nodes.
Verify: display works, input works, wrong path triggers correction, terminal node ends.
Do not touch the real scenario yet.

### Step 2 — Co-design The Slow Server

Do not write the scenario alone.
Design each node decision by decision:
- Write the situation text
- Write 4 choices (optimal first, then acceptable, then 2 wrong)
- Verify every wrong choice is plausible under pressure
- Write the command output for each choice
- Write the feedback for each wrong/acceptable choice
- Test: does the optimal path flow naturally?
- Test: does each wrong path feel like a real mistake not an obvious one?

Plan for 2-3 sessions. Scenario design is the hardest part.

### Step 3 — Test both paths

Walk the optimal path. Read the session report. Does it feel accurate?
Walk 2 wrong paths (including 1 with a critical mistake). Does the consequence feel real?
Adjust where choices feel too obvious or too obscure.

### Step 4 — Ship V1

One scenario. Working engine. Session report.
That is a shipped product. Not a prototype.

---

## THE V1 → V2 → V3 EVOLUTION

```
V1 (ship now):
  1 scenario | numbered choices | guided correction | simple report

V2 (after Docker stable):
  5 Tier 1 scenarios
  Type B stateful consequences on 2 scenarios
  Typed command input with hints
  Full narrative grade in session report
  Adaptive plan signal output

V3 (after AWS + CI/CD stable):
  Tier 2 scenarios (Docker, EC2, GitHub Actions)
  Full free command typing with interpretation
  Cross-session weakness tracking
  Environment state mutation within scenario
```

---

## THE SESSION REPORT — V1 VERSION (ONLY 4 FIELDS)

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SESSION REPORT — The Slow Server
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Performance:    ACCEPTABLE
Steps taken:    7  (optimal: 5, +2)
Mistakes:       2  (0 critical)
First decision: OPTIMAL

Your path:    alert_1 → cpu_identified → memory_irrelevant →
              cpu_identified → connection_found → config_found → verify → success
Optimal path: alert_1 → cpu_identified → connection_found →
              config_found → verify → success

Root cause:   Connection pool misconfiguration causing connection leak
Key concept:  Diagnose before acting. Resource check before restart.
Review:       Networking trainer — connection states. Bash labs — lsof + netstat.

Post seed:    'Diagnosed a connection pool leak using top + lsof.
               Optimal is 5 steps. Took me 7. Here's what I did wrong.'
Commit:       devops-trainer: slow-server-v1 — acceptable — connection-pool-diagnosis
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## RUNNING LOG ITEMS FROM THIS CONCERN

**→ Execution list:**
Build engine loop first — dummy scenario, verify loop works.
Then co-design The Slow Server node by node (2-3 sessions).
First real session: Friday May 16 after bash challenge completes.
Session report feeds Sunday May 17 adaptive plan message.

**→ Scenario writing is the hardest part.**
Two to three sessions to get The Slow Server right.
Use the scenario design rule set before writing any node.
One root cause. One optimal path. Max 2 wrong branches per node.
Every wrong choice must be plausible under pressure.

**→ Concern 11 (Adaptive Plan):**
First decision quality field feeds directly into the adaptive plan signal.
"First decision was poor across 3 sessions → prioritization needs daily drill."
This is the most actionable signal the trainer produces.

**→ Concern 4 (Networking Trainer):**
The Slow Server scenario's CLOSE_WAIT connection state diagnosis
maps directly to the networking trainer TCP/IP concept.
The networking trainer prepares for this scenario.
This scenario applies that preparation.
