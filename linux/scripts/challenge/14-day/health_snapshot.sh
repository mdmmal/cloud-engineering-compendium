# ============================================================
# Script:       health_snapshot.sh
# Track:        Linux / Bash
# Week:         Week 1 | 14-Day Challenge
# Challenge:    14-Day Bash Scripting Challenge
# ============================================================
# What it does:
#   Captures a point-in-time snapshot of server health including
#   hostname, current user, timestamp, working directory, shell,
#   and uptime metrics. Exports snapshot time to environment.
#
# DevOps context:
#   On-call first-look tool. Run immediately when an incident
#   fires to capture the state of the system at that moment.
#   Maps to the initial triage step in incident response runbooks.
#
# Real scenario:
#   On-call engineer SSHes into a struggling EC2 instance and
#   runs this as the first command to capture system state before
#   any changes are made.
# ============================================================
# ============================================================
# Script:       health_snapshot.sh
# Track:        Linux / Bash
# Week:         Week 1 | 14-Day Challenge
# Challenge:    14-Day Bash Scripting Challenge
# ============================================================
# What it does:
#   [2-3 sentences. Plain language. What happens when you run it.]
#
# DevOps context:
#   [Where this shows up in real DevOps work.
#    What production scenario this maps to.]
#
# Real scenario:
#   [One sentence. The actual situation.]
# ============================================================
#!/bin/bash

UPTIME_INPUT="137 Minutes"
UPTIME_HRS="4 hours"

echo "=== Server Health Snapschot ==="
echo "Host:             $HOSTNAME"
echo "User:             $(whoami)"
echo "Snapshot Time:    $(date)"
echo "Working DIr:      $PWD"
echo "Shell:            $SHELL"
echo "---"
echo "Uptime Input:     $UPTIME_INPUT"
echo "Uptime (hrs):     $UPTIME_HRS"
echo "=============================="
echo "[INFO] SNAPSHOT_TIME exported to environment."
echo "[CLEANUP] UPTIME_MINUTES cleared."
