# Day 3 — Runaway Process Investigation

## What I found
Two instances of .lab_process.sh running under jamal
Both visible in top consuming CPU on an idle system
Both had trap set to ignore SIGTERM

## What I did
- Identified PIDs using ps aux and top
- Attempted kill -15 (SIGTERM) — ignored
- Escalated to kill -9 (SIGKILL) — both processes terminated

## Key learning
SIGTERM is a request. The process can catch and ignore it.
SIGKILL cannot be caught. The kernel forces the stop.
Always try SIGTERM first — SIGKILL prevents cleanup.
In production this distinction matters for databases and web servers.
