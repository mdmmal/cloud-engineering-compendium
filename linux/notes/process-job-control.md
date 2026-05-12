# Process and Job Control
**Track:** Linux
**Source:** Unix System Administration / LabEx lab
**Date:** 2026-05-11
**Week:** Week 5 | Phase 1

---

## What This Is

Every program running on Linux is a process. Process and job control is how you see what's running, manage multiple tasks from one terminal, stop processes cleanly, and control which processes get priority on the CPU.

---

## How It Works

Think of the system as a kitchen: the CPU is the chef, RAM is the counter space to work on, and processes are the orders or tasks. Every process gets a unique ticket number called a PID (Process ID).

**Foreground vs Background:**
A foreground process blocks the terminal until it finishes. Running a process with `&` sends it to the background so you can keep using the terminal. `jobs` shows what's running in the background. `fg %1` brings job 1 back to the foreground.

**Monitoring:**
`ps` is a photograph — a snapshot of processes at one moment. `top` is a movie — a live dashboard updating every few seconds showing CPU usage, RAM consumption, and system load.

**Signals:**
`SIGTERM` is a polite stop — it allows the process to save data before exiting. `SIGKILL` is an instant stop — no cleanup, potential data loss. Use `SIGTERM` first, `SIGKILL` when the process won't respond.

**Priority (Niceness):**
Linux uses a niceness score to determine process priority. High niceness = low priority (the process is being "nice" to others). Low or negative niceness = high priority. You can set it at launch with `nice` or change it after with `renice`.

---

## The DevOps Connection

On a production server running multiple services, process management is a core skill. When a service consumes 100% CPU and stops responding, you need to identify the PID, send the right signal, and know whether to kill it or let it finish. `top` is usually the first tool opened during an incident. Understanding process priority matters when running batch jobs alongside live services — you nice down the batch job so it doesn't starve production workloads.

---

## Commands / Syntax

```bash
# Snapshot of current processes (your session)
ps

# View ALL processes — all users, no terminal required
ps aux
# a = all users, u = user/owner info, x = processes with no terminal

# Live process dashboard (CPU, RAM, system load)
top

# Run a command in the background
sleep 1000 &

# List active background jobs
jobs

# Bring job 1 back to the foreground
fg %1

# Send SIGTERM (polite stop)
kill <PID>

# Send SIGKILL (force stop — data loss risk)
kill -9 <PID>

# Kill by name
pkill processname

# Find a PID by name
pgrep -f "sleep 3000"

# Start a process with reduced priority (niceness 10)
nice -n 10 sleep 4000 &

# Check priority in process list
ps -l

# Change priority of a running process
renice -n 5 -p <PID>
```

---

## What I Got Wrong First

`ps aux` looks overwhelming at first. The key is knowing what each column means before trying to filter it. The `a`, `u`, and `x` flags aren't three separate flags — they're combined into one argument that changes what `ps` shows. Without all three you get an incomplete picture.

---

## Quick Recall

- PID = process ticket number, unique per process
- `ps` = snapshot, `top` = live dashboard
- `&` = run in background, `fg %1` = bring back to foreground
- `SIGTERM` = polite stop, `SIGKILL` = force stop (data loss risk)
- High niceness score = low priority (nice to others)
- `nice` sets priority at launch, `renice` changes it after

---

## Connected To

Before: Shell environment, terminal basics  
After: `systemctl` service management, cron scheduling, container resource limits in Docker/Kubernetes
