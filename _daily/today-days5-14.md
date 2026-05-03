# today.md — Pre-Populated Daily Files
## 14-Day Head Down Challenge | Days 5–14
## One file per day. Open it. Start. Nothing to figure out.

---

---

# DAY 5 — Saturday May 2
**Challenge day 5 of 14**

## What I'm doing
Track: Bash + Python
Task (Bash): Write `trap_handler.sh` — uses bash trap to catch errors and clean up temp files
Comes from: Bash trap command — LabEx lab 14 concepts
Task (Python): Write a function that takes two numbers, returns the larger one — practice conditionals inside functions

## Why it matters in DevOps
Bash trap is how production scripts handle failures gracefully — if a deployment script crashes mid-run, trap cleans up so you don't leave broken state on the server.

## What gets committed
File 1: `linux/scripts/trap_handler.sh`
Message: `"bash: trap_handler.sh — graceful error handling and temp file cleanup"`
File 2: `python/scripts/ex_compare_values.py`
Message: `"python: function returning larger of two values — conditionals inside functions"`

## What yesterday produced
Scripts demonstrating string operations and deployment tag parsing — `tag_parser.sh` committed.

## Post seed
"Bash trap command — the thing that keeps a broken deployment script from leaving your server in a half-configured state. Day 5 of 14." + screenshot of trap catching an error.

## Challenge tracker
☑ Day 1 ☑ Day 2 ☑ Day 3 ☑ Day 4 ☐ Day 5 ← YOU ARE HERE

---

---

# DAY 6 — Sunday May 3
**Challenge day 6 of 14**

## What I'm doing
Track: Bash + Networking + LinkedIn
Task (Bash): Write `file_audit.sh` — walks a directory, lists files modified in last 24 hours, flags files over 100MB
Comes from: File system operations — LabEx lab concepts + Unix system admin class notes
Task (Networking): DevOps Network Trainer — 5 scenarios, Foundation difficulty, IP Addressing + Routing topics
Task (LinkedIn): Week post — built from days 1–5 post seeds

## Why it matters in DevOps
File system auditing is real on-call work — when disk fills up on a production server, this is the first script you run to find what's consuming space.

## What gets committed
File: `linux/scripts/file_audit.sh`
Message: `"bash: file_audit.sh — filesystem audit, recent changes, size flagging"`
File: `networking/notes/day6-trainer-session.md`
Message: `"networking: trainer session day 1 — IP addressing and routing scenarios"`

## What yesterday produced
`trap_handler.sh` — bash trap for graceful error handling committed.

## Post seed (LinkedIn — post this today)
"5 days of writing bash scripts daily. Here's what changed between day 1 and day 5." + side-by-side screenshot of first script vs `readiness_check.sh`.

## LinkedIn post structure
Line 1: "5 days of writing bash scripts daily. Here's what actually changed."
Line 2: "Day 1 — I was writing echo statements and basic variables."
Line 3: "Day 5 — I'm writing deployment gate validators with argument validation, CPU/memory checks, and graceful error handling."
Line 4: "The script that proved it: readiness_check.sh" + screenshot
Line 5: "9 more days to go. Documenting the whole thing."
Tags: #DevOps #BashScripting #CloudEngineering #BuildingInPublic

## Challenge tracker
☑ Day 1 ☑ Day 2 ☑ Day 3 ☑ Day 4 ☑ Day 5 ☐ Day 6 ← YOU ARE HERE

---

---

# DAY 7 — Monday May 4
**Challenge day 7 of 14 — HALFWAY**

## What I'm doing
Track: Bash + Python
Task (Bash): Write `fs_explorer.sh` — takes a path argument, shows: total files, total dirs, largest file, most recent file, file type breakdown
Comes from: File system exploration — LabEx concepts + Unix admin class notes
Task (Python): CS50P — next concept up. Functions with return values + writing output to a file.

## Why it matters in DevOps
This is the script you run when you SSH into an unfamiliar server — it gives you a fast situational picture of what's on the filesystem before you start debugging.

## What gets committed
File: `linux/scripts/fs_explorer.sh`
Message: `"bash: fs_explorer.sh — filesystem situational awareness tool"`
File: `python/scripts/ex_file_output.py`
Message: `"python: writing function output to file — CS50P week 1 progression"`

## What yesterday produced
`file_audit.sh` — 24-hour file change detector with size flagging committed.

## Post seed
"Day 7 of 14. Halfway. The script I wrote today is one I'd actually run the first time I SSH into a new server." + terminal output screenshot of `fs_explorer.sh` running.

## X post (daily)
"Day 7. Wrote a filesystem explorer script — tells you total files, dirs, largest file, most recent change. The kind of thing you run first when you SSH into an unfamiliar server. #DevOps #Bash"

## Challenge tracker
☑ D1 ☑ D2 ☑ D3 ☑ D4 ☑ D5 ☑ D6 ☐ D7 ← HALFWAY

---

---

# DAY 8 — Tuesday May 5
**Challenge day 8 of 14**

## What I'm doing
Track: Bash + Python + Networking
Task (Bash): Write `log_monitor.sh` — watches a log file in real time, alerts when ERROR or CRITICAL appears, counts occurrences
Comes from: File system operations — reading and monitoring files + special variables ($!, $?, $0)
Task (Python): CS50P — loops. Write a script that reads a list of servers from a file and prints a health status for each.
Task (Networking): DevOps Network Trainer — 5 scenarios, DNS + NAT topics

## Why it matters in DevOps
Log monitoring is core SRE work. Before you set up Prometheus and Grafana, you write scripts like this. Understanding what you're automating later starts here.

## What gets committed
File: `linux/scripts/log_monitor.sh`
Message: `"bash: log_monitor.sh — real-time log watcher with ERROR/CRITICAL alerting"`
File: `python/scripts/ex_server_health_reader.py`
Message: `"python: loops — reads server list from file, prints health status per server"`
File: `networking/notes/day8-dns-nat-scenarios.md`
Message: `"networking: DNS and NAT trainer scenarios — 5 completed"`

## What yesterday produced
`fs_explorer.sh` — filesystem situational awareness tool committed.

## Post seed
"Wrote a log monitoring script today. Before Prometheus and Grafana, this is the script. Real-time error detection in bash. Day 8 of 14." + screenshot of the script catching an ERROR line.

## Challenge tracker
☑ D1-D7 ☐ D8 ← YOU ARE HERE

---

---

# DAY 9 — Wednesday May 6
**Challenge day 9 of 14**

## What I'm doing
Track: Bash + Python
Task (Bash): Write `backup_rotate.sh` — backs up a target directory with datestamp, keeps only last 5 backups, removes older ones automatically
Comes from: File system operations — cp, mkdir, date, ls sorting, rm
Task (Python): CS50P — dictionaries. Write a script that takes server names and their CPU values, stores in dict, reports which are over threshold.

## Why it matters in DevOps
Backup rotation is standard ops work — every production environment has it. Understanding how to write it manually is what makes you able to debug it when the automated version breaks.

## What gets committed
File: `linux/scripts/backup_rotate.sh`
Message: `"bash: backup_rotate.sh — automated backup with 5-copy rotation"`
File: `python/scripts/ex_cpu_threshold_dict.py`
Message: `"python: dictionaries — server CPU tracking with threshold reporting"`

## What yesterday produced
`log_monitor.sh` — real-time log watcher with error alerting committed.

## Post seed
"Backup rotation in bash. Keeps the last 5 backups, removes the rest automatically. Day 9 of 14. This is the manual version of what every production ops team has running." + screenshot.

## X post (daily)
"Day 9. Backup rotation script — auto-stamps, keeps 5, deletes older. The kind of thing that's obvious once you write it yourself. #Bash #DevOps #CloudEngineering"

## Challenge tracker
☑ D1-D8 ☐ D9 ← YOU ARE HERE

---

---

# DAY 10 — Thursday May 7
**Challenge day 10 of 14**

## What I'm doing
Track: Bash + Python + Networking
Task (Bash): Write `health_monitor.sh` — checks disk %, memory %, CPU load, service status for a given service name, outputs colored status report
Comes from: Cumulative — special variables, conditionals, file system ops, trap
Task (Python): CS50P — try/except. Write a script that reads a config file, handles missing keys gracefully, reports what it found.
Task (Networking): DevOps Network Trainer — 5 scenarios, Security Groups + VPC Architecture — Applied difficulty

## Why it matters in DevOps
This is the script you run before any deployment. CPU, memory, disk, service status — four checks, one output. This is what gets turned into a Jenkins pre-stage check later.

## What gets committed
File: `linux/scripts/health_monitor.sh`
Message: `"bash: health_monitor.sh — pre-deployment system health validator, colored output"`
File: `python/scripts/ex_config_reader.py`
Message: `"python: try/except — config file reader with graceful missing key handling"`
File: `networking/notes/day10-vpc-security-groups.md`
Message: `"networking: VPC architecture + security groups applied scenarios"`

## What yesterday produced
`backup_rotate.sh` — automated backup with rotation committed.

## Post seed
"10 days in. The script I wrote today — health_monitor.sh — checks disk, memory, CPU, and service status before a deployment. This becomes a Jenkins pre-stage check later. Day 10 of 14." + colored terminal output screenshot.

## Challenge tracker
☑ D1-D9 ☐ D10 ← YOU ARE HERE

---

---

# DAY 11 — Friday May 8
**Challenge day 11 of 14**

## What I'm doing
Track: Bash + Python
Task (Bash): Write `deploy_pipeline.sh` — simulates a full deployment pipeline: pre-flight check → build → test → deploy → post-deploy verify. Each stage has pass/fail with exit codes.
Comes from: Cumulative — everything from days 1–10 combined into one script
Task (Python): CS50P — file I/O. Write a script that reads a log file, counts ERROR vs WARNING vs INFO lines, writes a summary report to a new file.

## Why it matters in DevOps
This is the manual version of what Jenkins and GitHub Actions automate. Writing it by hand is how you understand what the pipeline is actually doing when you configure it later.

## What gets committed
File: `linux/scripts/deploy_pipeline.sh`
Message: `"bash: deploy_pipeline.sh — simulated full pipeline preflight/build/test/deploy/verify"`
File: `python/scripts/ex_log_analyzer.py`
Message: `"python: file I/O — log analyzer counting ERROR/WARNING/INFO, writes summary report"`

## What yesterday produced
`health_monitor.sh` — system health validator with colored output committed.

## Post seed
"Day 11. Wrote a full deployment pipeline in bash — pre-flight, build, test, deploy, verify. Each stage exits on failure. This is exactly what Jenkins runs under the hood. 3 days left." + screenshot of pipeline stages running.

## X post (daily)
"Day 11. Simulated a full deployment pipeline in bash. Pre-flight → build → test → deploy → verify. Each stage exits on failure. This is the manual version of CI/CD. #DevOps #Bash"

## Challenge tracker
☑ D1-D10 ☐ D11 ← YOU ARE HERE

---

---

# DAY 12 — Saturday May 9
**Challenge day 12 of 14**

## What I'm doing
Track: Bash + Python + Networking + LinkedIn
Task (Bash): Write `server_inventory.sh` — given a list of servers (from a file), SSH-checks each one, reports: reachable/unreachable, uptime, disk usage
Comes from: File system ops, special variables, loops over file input, ssh concepts
Task (Python): CS50P — current week problem set. Attempt one problem set question fully.
Task (Networking): Draw a VPC from memory. No looking. Time yourself. Photo it.
Task (LinkedIn): Mid-challenge post — days 7–11 recap

## Why it matters in DevOps
Server inventory scripts run in every ops team that doesn't have a full CMDB yet. Even teams that do have one use these for quick spot checks.

## What gets committed
File: `linux/scripts/server_inventory.sh`
Message: `"bash: server_inventory.sh — multi-server reachability and health inventory"`
File: `networking/notes/vpc-diagram-attempt-1.md`
Message: `"networking: VPC diagram drawn from memory — labeled components, noted gaps"`

## What yesterday produced
`deploy_pipeline.sh` — simulated full CI/CD pipeline committed.

## Post seed (LinkedIn — post today)
"Halfway through the second week of daily bash scripting. Here's what the scripts look like now vs day 1." + screenshot of `deploy_pipeline.sh` running all stages vs `hello.sh` equivalent.

## Challenge tracker
☑ D1-D11 ☐ D12 ← YOU ARE HERE

---

---

# DAY 13 — Sunday May 10
**Challenge day 13 of 14**

## What I'm doing
Track: Bash + Python + Networking
Task (Bash): Write `alert_manager.sh` — monitors a metric file that updates every 30 seconds, triggers alert message when threshold crossed, logs alerts with timestamp
Comes from: File system monitoring, trap, loops, special variables — full cumulative
Task (Python): CS50P — current concept. Write a Python version of the health evaluator that reads from a file instead of user input.
Task (Networking): DevOps Network Trainer — 5 Applied scenarios. Any topic. Focus on what you scored weakest on.

## Why it matters in DevOps
This is the bash version of what Prometheus AlertManager does. Writing it yourself makes the real tool make sense immediately when you configure it later.

## What gets committed
File: `linux/scripts/alert_manager.sh`
Message: `"bash: alert_manager.sh — threshold monitoring with timestamped alerting"`
File: `python/scripts/ex_health_file_reader.py`
Message: `"python: health evaluator reading from file — CS50P file I/O applied"`

## What yesterday produced
`server_inventory.sh` — multi-server reachability inventory committed.

## Post seed
"Day 13. Wrote a bash alert manager — monitors a metric, fires alert when threshold crossed, logs it with timestamp. This is the manual version of Prometheus AlertManager. Tomorrow is day 14." + terminal screenshot.

## X post (daily)
"Day 13. Alert manager in bash. Monitors a file metric, fires when threshold crossed, logs with timestamp. The manual version of what Prometheus AlertManager does. #DevOps #SRE"

## Challenge tracker
☑ D1-D12 ☐ D13 ← YOU ARE HERE

---

---

# DAY 14 — Monday May 11
**Challenge day 14 of 14 — COMPLETE**

## What I'm doing
Track: Bash capstone + LinkedIn capstone post
Task (Bash): Write `ops_toolkit.sh` — a menu-driven script that combines: health check, log monitor, file audit, backup, alert check into one unified tool with a numbered menu
Comes from: Everything. This is the cumulative capstone. Every concept from days 1–13.
Task (Python): Write `ops_report.py` — reads commit log or a data file, formats a daily ops summary report, saves to file. Python capstone parallel.

## Why it matters in DevOps
A unified ops toolkit is what a junior DevOps engineer builds in their first month on the job when they realize they need these scripts fast. You're building it before you get there.

## What gets committed
File: `linux/scripts/ops_toolkit.sh`
Message: `"bash: ops_toolkit.sh — unified DevOps ops toolkit, menu-driven, 14-day capstone"`
File: `python/scripts/ops_report.py`
Message: `"python: ops_report.py — automated ops summary report generator"`
File: `linux/scripts/README.md` ← WRITE THIS TODAY
Message: `"docs: linux/scripts README — 14-day challenge script index with DevOps context"`

## What yesterday produced
`alert_manager.sh` — threshold monitoring with timestamped alerting committed.

## LinkedIn capstone post (write and post today)
---
"14 days of writing bash scripts daily. Here's what I built.

Day 1: Variables, echo, basic conditionals.
Day 14: A menu-driven ops toolkit — health checks, log monitoring, filesystem audit, backup rotation, alerting — all in one.

The script I'm most proud of: readiness_check.sh
It validates the environment, checks CPU/memory gates, parses deployment tags, and blocks bad deployments. It's the kind of script that runs before a Jenkins pipeline approves a push to production.

What changed in 14 days:
→ I can read a DevOps scenario and know what kind of script it needs
→ I understand why bash trap, exit codes, and argument validation exist
→ I can write a deployment gate validator from scratch

What's next: Docker. Wize (my PWA) gets containerized this week.

GitHub: [your compendium link in first comment]

#DevOps #BashScripting #CloudEngineering #BuildingInPublic #14DayChallenge"
---

## The README you write today for linux/scripts/

```markdown
# Linux Scripts — 14-Day Bash Challenge

Built during a 14-day head-down execution sprint.
Every script maps to a real DevOps or SRE scenario.

| Script | What It Does | DevOps Context |
|---|---|---|
| deploy_check.sh | System context before deploy | Pre-deployment validation |
| readiness_check.sh | Environment + resource gate | Deployment gate validator |
| trap_handler.sh | Graceful error handling | Production script safety |
| file_audit.sh | 24hr filesystem changes + size | Disk usage investigation |
| fs_explorer.sh | Filesystem situational awareness | First script on unknown server |
| log_monitor.sh | Real-time ERROR/CRITICAL alerting | Manual log monitoring |
| backup_rotate.sh | Backup with 5-copy rotation | Ops backup management |
| health_monitor.sh | Disk/memory/CPU/service check | Pre-deployment health gate |
| deploy_pipeline.sh | Full pipeline simulation | Manual CI/CD walkthrough |
| server_inventory.sh | Multi-server reachability | Fleet health check |
| alert_manager.sh | Threshold monitoring + logging | Manual AlertManager |
| ops_toolkit.sh | Unified menu-driven ops tool | Junior DevOps toolkit |
```

## Challenge tracker
☑ D1 ☑ D2 ☑ D3 ☑ D4 ☑ D5 ☑ D6 ☑ D7
☑ D8 ☑ D9 ☑ D10 ☑ D11 ☑ D12 ☑ D13 ☑ D14
COMPLETE.

---

## WHAT COMES NEXT (Day 15+)

The 14-day challenge is done. The next challenge starts immediately.

Challenge 2: Wize Week 1 — Dockerize your PWA
Day 15: Write the Dockerfile for the Express backend
Day 16: Write the Dockerfile for the React frontend
Day 17: docker-compose.yml — both services running together
Day 18: Test locally, fix what breaks, document what broke
Day 19: First LinkedIn post about Wize containerization
Day 20: Push to GitHub, write the README for the project
Day 21: Reflect — what you learned, what's next (Railway → EC2 migration)

That's the handoff from the bash challenge to the Wize project.
The momentum doesn't stop. It redirects.
