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
