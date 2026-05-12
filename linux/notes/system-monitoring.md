# System Information and Resource Monitoring
**Track:** Linux
**Source:** Unix System Administration / LabEx lab
**Date:** 2026-05-11
**Week:** Week 5 | Phase 1

---

## What This Is

The commands used to assess the health and resource state of a Linux system — how long it's been running, how much memory is available, how full the disks are, and how to find specific files consuming resources. These are the first commands run during a production incident.

---

## How It Works

Resource monitoring is about answering four questions quickly:
1. Is the system stable? (`uptime`)
2. Is memory available? (`free`)
3. Is disk space available? (`df`)
4. What is consuming space? (`du`)

`watch` wraps any command and re-runs it every 2 seconds in the terminal — turning a one-time snapshot into a live feed without `top`.

**Load average** is one of the most misunderstood Linux metrics. It is not a CPU percentage. It is a measure of how much runnable or waiting work the system is carrying over time — across 1, 5, and 15 minute windows.

**Swap** is what the system falls back to when RAM hits 100%. It uses disk space as overflow. It keeps the system from crashing but is significantly slower than RAM.

---

## The DevOps Connection

These commands are the first tools opened when an on-call alert fires:

- `df -h` checks if a disk is full — a full disk kills writes to log files and databases
- `free` checks if a process is eating RAM before an OOM kill event happens
- `uptime` confirms whether the system just restarted unexpectedly
- `find /tmp -type f -size +100M` locates large files consuming disk before they cause a failure
- `du -sh /var/log` identifies which log directory is the culprit in a disk full scenario

In a cloud environment these map directly to CloudWatch disk and memory alarms — but when SSH'd into a server directly, these commands are what you use.

---

## Commands / Syntax

```bash
# How long the system has been running + load average
uptime

# Check memory — human readable
free -h

# Check if swap is active
swapon

# Disk free — check all mounted filesystems
df -h

# Disk free — check the main disk specifically
df -h /

# Disk usage — summary size of a specific folder
du -sh /path/to/folder

# Disk usage — list all file sizes individually
du -ah /path/to/folder

# Run a command live every 2 seconds
watch df -h

# Find files larger than 100MB in /tmp
find /tmp -type f -size +100M

# Move all .log files from current directory to another location
mv *.log /path/to/destination/
```

**Memory analogy:**
- `df` = checking the map (how full is the storage overall)
- `du` = weighing a specific box (how much does this folder actually take up)

---

## What I Got Wrong First

Load average looks like a percentage but it isn't. A load average of 1.0 on a single-core machine means fully utilized. The same 1.0 on an 8-core machine means barely loaded. The number has to be read relative to the number of CPUs — not as a raw value.

---

## Quick Recall

- `uptime` = system runtime + load average (1/5/15 min windows)
- `free -h` = RAM and swap status in readable format
- `df -h` = disk space per filesystem (the map)
- `du -sh` = size of a specific folder (the box weight)
- `find /tmp -type f -size +100M` = locate large files eating disk
- Load average ≠ CPU percentage — it's work queued over time

---

## Connected To

Before: Process and job control, understanding what's running  
After: Log management, CloudWatch metrics, alerting thresholds, capacity planning
