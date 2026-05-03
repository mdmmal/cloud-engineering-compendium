# Concern 5 — LabEx Projects
## Full Spec | Jamal Muhammad | May 2, 2026

---

## THE ROLE OF LABEX PROJECTS

LabEx projects sit between daily scripting and the Wize build.
They are the bridge.

Scripts taught syntax.
The Wize build teaches infrastructure you own.
LabEx projects teach you to deploy and operate a system with moving parts —
not just a script that outputs to a terminal but something that runs.

---

## THE THREE PROJECT TIERS

Three types of projects exist. Three distinct homes.

| Tier | Location | What lives here |
|---|---|---|
| Major projects | `projects/` | Wize, Flask+Jenkins, fully deployed with README + architecture |
| LabEx guided | `labex/` | The guided lab, build-log, scripts from the lab |
| Small projects | `[track]/scripts/small-projects/` | Your own version — more complex, more relevant |

**The rule for promotion:**
If it deploys somewhere real, has an architecture diagram, and you can walk
someone through it in an interview — it moves to `projects/`.
If it's a script or a local system — it stays in `small-projects/`.

---

## THE FOLDER STRUCTURE

```
cloud-engineering-compendium/
│
├── projects/                          ← MAJOR projects only
│   ├── README.md
│   └── wize-devops/
│
├── labex/                             ← LabEx GUIDED projects
│   ├── README.md
│   ├── linux-system-monitor/
│   │   ├── README.md
│   │   ├── build-log.md
│   │   └── scripts/
│   ├── web-server-deployment/
│   │   ├── README.md
│   │   ├── build-log.md
│   │   └── scripts/
│   ├── automated-ops-toolkit/
│   │   └── ...
│   └── observability-stack/
│       └── ...
│
├── linux/
│   └── scripts/
│       ├── challenge/
│       ├── guided/
│       └── small-projects/            ← YOUR OWN versions from LabEx material
│           ├── fleet-monitor/
│           │   ├── fleet_monitor.sh
│           │   └── README.md
│           ├── server-recovery/
│           └── ops-toolkit-v2/
│
└── python/
    └── scripts/
        └── small-projects/
```

---

## THE THREE LAYERS PER PROJECT

Every LabEx project follows this structure. No exceptions.

**Layer 1 — The LabEx guided version.**
Follow the lab. Complete it. Read every command before running it.
Know why each step exists before moving to the next.
Not copy-paste. Understand then execute.

**Layer 2 — Your own version.**
More complex. More relevant. More yours.
Same concept applied to a real DevOps scenario you'd actually encounter.
This is what gets committed to `small-projects/` and posted about.

**Layer 3 — The connection.**
Every project connects forward to either Wize or Phase 2 curriculum.
Nothing exists in isolation. This connection is documented in the README.

---

## THE PROJECT SEQUENCE

One project per week. Done properly.
Sequence based on current skill level and what builds toward what.

---

### PROJECT 1 — Linux System Monitor
**LabEx project:** Build a Linux System Monitor Using Bash
**Timing:** Next week (after bash challenge wind-down, before May 11)
**Readiness:** You already have this. `health_monitor.sh` and `health_snapshot.sh`
exist in your compendium. You are not starting from zero.

**What the LabEx version teaches:**
Structured approach to system monitoring — combining CPU, memory, disk,
and process information into a unified output. May introduce concepts like
`sar`, `vmstat`, `iostat` that your scripts didn't use.

**What your version adds:**
Fleet monitoring. Not one server — multiple servers.
The script takes a list of servers, checks each one,
and produces a unified health report across the fleet.

```bash
# Your version: fleet_monitor.sh
# Takes: servers.txt (list of hostnames or IPs)
# Does: SSH into each, collect health data, report status per server
# Output:
# === Fleet Health Report — 2026-05-12 14:30:00 ===
# prod-web-01: CPU 45% [OK] | MEM 62% [OK] | DISK 71% [OK]
# prod-web-02: CPU 89% [WARNING] | MEM 44% [OK] | DISK 55% [OK]
# prod-db-01:  CPU 23% [OK] | MEM 78% [OK] | DISK 91% [CRITICAL]
# ================================================
# SUMMARY: 1 WARNING, 1 CRITICAL — investigate prod-web-02 and prod-db-01
```

**DevOps connection:**
This is the manual version of what CloudWatch does in AWS.
When you set up CloudWatch in Wize Week 5, you'll understand exactly
what it's replacing — because you built the manual version first.

**Wize connection:**
Fleet monitor → Wize Week 5 observability stack.
The runbook you write for Wize Week 5 references this script
for the "check multiple services" step.

**The project chat coaching questions after completion:**
- What's the difference between your fleet_monitor.sh and CloudWatch?
- What happens to your script if one server is unreachable?
- How would you make this script run automatically every 5 minutes?

**Folder location:**
```
labex/linux-system-monitor/          ← guided lab files
linux/scripts/small-projects/fleet-monitor/   ← your version
```

**Commits:**
```
labex: linux-system-monitor — guided lab complete, notes documented
linux: small-project — fleet_monitor.sh v1, multi-server health report
linux: small-project — fleet_monitor.sh v2, unreachable server handling
labex: linux-system-monitor — build-log, what the lab taught vs what I knew
```

**Post:**
"I already wrote health_monitor.sh for a single server.
The LabEx project showed me how to structure it properly.
My version checks a fleet — 10 servers, one report, one command.
This is the manual version of CloudWatch.
[screenshot of fleet_monitor.sh output showing multiple servers]"

---

### PROJECT 2 — Web Server Deployment and Disaster Recovery
**LabEx project:** Web Server Deployment and Disaster Recovery
**Timing:** After Project 1 complete, before Docker track starts
**Readiness:** Requires nginx orientation first — you've never configured it.

**Pre-project orientation — required before opening the lab:**
The project chat runs a 20-minute orientation session.
You need to know three things before touching this lab:

```
1. What nginx is
   nginx is a web server. It receives HTTP requests and serves responses.
   It can serve static files (your React build) or proxy requests to
   your Express backend. It's what sits in front of your app and
   handles the internet traffic.
   AWS equivalent: Application Load Balancer does what nginx does,
   but managed.

2. What "disaster recovery" means in this context
   The lab simulates a server failure and recovery.
   You'll practice: backing up config, simulating a crash,
   restoring from backup. This is runbook work.

3. What a reverse proxy is
   nginx receives the request on port 80, forwards it to your app
   on port 3000. The user never sees port 3000.
   Your Wize backend runs on a port. nginx would sit in front of it.
```

**What the LabEx version teaches:**
Installing nginx, configuring a virtual host, serving a static site,
simulating failure scenarios and recovery procedures.

**What your version adds:**
A deployment script that automates the nginx setup and includes
a recovery procedure — backup the config, simulate failure,
restore and verify.

```bash
# Your version: server_deploy_recover.sh
# Does:
# 1. Installs and configures nginx for a given domain
# 2. Creates a timestamped backup of the nginx config
# 3. Can simulate a config failure (corrupts the config intentionally)
# 4. Recovery mode: restores from most recent backup, verifies nginx starts
# Usage:
#   ./server_deploy_recover.sh deploy myapp.local
#   ./server_deploy_recover.sh backup
#   ./server_deploy_recover.sh recover
#   ./server_deploy_recover.sh simulate-failure
```

**DevOps connection:**
This is the foundational skill behind Wize Week 3.
When you deploy Wize to EC2, nginx sits in front of your containers
as a reverse proxy. Understanding how nginx works before you configure
it in Docker means you make intentional decisions instead of copying config.

**Wize connection:**
The nginx knowledge from this project feeds directly into Wize Week 2
(Dockerfile for the frontend — nginx serves the Vite build)
and Week 3 (nginx on EC2 as a reverse proxy).

**The project chat coaching questions after completion:**
- What is the difference between a web server and an application server?
- What does a reverse proxy do and why does it exist?
- Walk through your recovery procedure — what happens at each step?

**Folder location:**
```
labex/web-server-deployment/         ← guided lab files
linux/scripts/small-projects/server-recovery/  ← your version
```

**Commits:**
```
labex: web-server-deployment — guided lab complete
linux: small-project — server_deploy_recover.sh v1, nginx setup
linux: small-project — server_deploy_recover.sh v2, recovery mode added
labex: web-server-deployment — build-log, nginx config and recovery documented
```

**Post:**
"Spent today learning nginx — the thing that sits in front of your app
and handles internet traffic.
Built a script that deploys it, backs up the config, and can recover
from a simulated failure automatically.
This is the manual version of what an Application Load Balancer does.
[screenshot of nginx serving a page + recovery command running]"

---

### PROJECT 3 — Automated Ops Toolkit
**LabEx project:** Automated Ops Toolkit Development
**Timing:** After Projects 1 and 2, alongside Docker track start
**Readiness:** By this point bash is fully stable. This is a capstone bash project.

**What the LabEx version teaches:**
Building a unified toolkit that combines multiple ops scripts into
one menu-driven system. Modular bash scripting, function libraries,
configuration files.

**What your version adds:**
This extends your existing `ops_toolkit.sh` from the 14-day challenge.
Your version becomes a proper ops toolkit with:
- Configuration file (not hardcoded values)
- Logging to a file with timestamps
- Plugin architecture (drop a new script in a folder and it appears in the menu)
- Integration with fleet_monitor.sh from Project 1

```bash
# Your version: ops_toolkit_v2.sh
# Reads config from: ~/.ops_toolkit/config
# Logs to: ~/.ops_toolkit/logs/toolkit-YYYY-MM-DD.log
# Loads plugins from: ~/.ops_toolkit/plugins/
# Menu auto-generates from available plugins
```

**DevOps connection:**
This is the architecture of real ops tooling.
Real DevOps teams have internal tools built exactly like this —
config files, logging, modular plugins.
Understanding this architecture makes you valuable immediately.

**Folder location:**
```
labex/automated-ops-toolkit/
linux/scripts/small-projects/ops-toolkit-v2/
```

---

### PROJECT 4 — Observability Stack
**LabEx project:** Observability Stack
**Timing:** After Docker track starts, alongside Wize Week 5
**Readiness:** Requires Docker knowledge. Do not start before Docker fundamentals.

**What the LabEx version teaches:**
Prometheus + Grafana setup, scraping metrics, building dashboards.
The open-source version of CloudWatch.

**What your version adds:**
Point the Prometheus scraper at your Wize containers running locally.
Build a Grafana dashboard that shows Wize backend health.
This is literally Wize Week 5 done manually before you do it on AWS.

**DevOps connection:**
After this project, Wize Week 5 is a review not a new concept.
You've already set up Prometheus and Grafana locally.
AWS CloudWatch is the managed version of what you built yourself.

**Important:** Do not start this project before Docker is stable.
It requires running containers. The concepts build on Docker Compose.

---

### PROJECTS NOT YET (Stay on the list, not yet)

**Hybrid Infrastructure Deployment (Docker/MySQL)**
Requires Docker fundamentals solid. Start after June Docker track.

**High Availability and Automation (Ansible)**
Phase 2 material. After Terraform basics are done.

**Cloud Native Deployment (Kubernetes/Python)**
Phase 2 material. After Docker and CI/CD are stable.

---

## THE PROJECT CHAT — COACHING FORMAT

Same model as the Wize chat. Explains first, asks you to prove you understood.

What the project chat does for each LabEx project:
- Pre-project orientation (20 min) — three things you need to know before opening the lab
- Mid-project check-in — "before you run the next command, tell me what it does"
- Post-project questions — three questions you must answer without help
- Connects the project to existing scripts and upcoming Wize build

What it does NOT do:
- Run the commands for you
- Debug without you attempting it first
- Move to the next step until you can explain the current one

---

## THE BUILD-LOG FORMAT FOR LABEX PROJECTS

Same format as Wize. Applied to every LabEx project.

```markdown
# [Project Name] — Build Log
**LabEx Project:** [exact project title]
**Date:** [date range]
**Track:** Linux | Docker | etc.

## What the lab covered
[3-5 bullets — what concepts the guided lab introduced]

## What I already knew going in
[Honest. What existing scripts covered this ground.]

## What was new
[The specific thing this lab taught that daily scripting didn't.]

## What broke
[The exact error. How long it took. What fixed it.]

## My version
[What the small project adds beyond the guided lab.]
[Why it's more complex or more relevant.]

## DevOps connection
[Where this shows up in production.]
[What Wize week this feeds into.]

## What I can explain now that I couldn't before
[3 things. Specific. In plain English.]

## Commits
[List of commit messages from this project]

## Post published
[Text and screenshot of what was posted]
```

---

## THE LABEX README

Lives at `labex/README.md`. Index of all projects.

```markdown
# LabEx Projects

Guided projects from LabEx's DevOps environment.
Each project has two versions:
1. The guided LabEx version (in this folder)
2. My own more complex version (in the relevant track's small-projects/)

| Project | Status | My Version | Feeds Into |
|---|---|---|---|
| Linux System Monitor | Complete | fleet_monitor.sh | Wize Week 5 |
| Web Server Deployment | Complete | server_deploy_recover.sh | Wize Week 2-3 |
| Automated Ops Toolkit | In Progress | ops_toolkit_v2.sh | Daily ops |
| Observability Stack | Pending Docker | wize-local-monitoring | Wize Week 5 |
| Hybrid Infrastructure | Pending Docker | — | Phase 2 |
```

---

## THE SEQUENCING RULE

```
Current skill level → Which project is unlocked

Bash stable (Day 14+):
  ✓ Linux System Monitor — UNLOCKED
  ✓ Web Server Deployment — UNLOCKED (needs nginx orientation first)
  ✗ Automated Ops Toolkit — unlock after Projects 1 and 2

Docker fundamentals stable:
  ✓ Automated Ops Toolkit — UNLOCKED
  ✓ Observability Stack — UNLOCKED
  ✓ Hybrid Infrastructure — UNLOCKED

Phase 2 (Kubernetes + Ansible):
  ✓ High Availability and Automation — UNLOCKED
  ✓ Cloud Native Deployment — UNLOCKED
```

---

## RUNNING LOG ITEMS FROM THIS CONCERN

**→ Execution list — Folder structure:**
Create `labex/` folder in compendium root.
Create `linux/scripts/small-projects/` folder.
Create `python/scripts/small-projects/` folder.
Commit: `docs: labex and small-projects folder structure created`

**→ Execution list — Project 1:**
Project chat orientation session before opening the Linux System Monitor lab.
After guided lab: build fleet_monitor.sh in small-projects.
Commit sequence defined above.

**→ Execution list — Project 2:**
Project chat nginx orientation before opening Web Server Deployment lab.
After guided lab: build server_deploy_recover.sh in small-projects.

**→ Concern 3 (Documentation):**
The build-log format defined here matches the Wize build-log format from Concern 3.
One template covers both. Already in templates/ from Concern 3.

**→ Concern 6 (Wize):**
Project 1 (fleet monitor) feeds into Wize Week 5.
Project 2 (nginx) feeds into Wize Weeks 2-3.
Project 4 (Observability Stack) is Wize Week 5 done locally first.
These connections are explicit in each project's README.

**→ Concern 4 (Networking):**
Web Server Deployment introduces nginx as a reverse proxy.
nginx → reverse proxy → load balancer → ALB in AWS.
That chain connects directly to the networking trainer VPC Architecture concept.

**→ Concern 12 (Ultimate DevOps Trainer):**
Every project breakpoint becomes a trainer scenario.
nginx misconfiguration. Fleet monitor SSH failure. Recovery script wrong path.
Document all of them in build-logs.
