# ============================================================
# Script:       deploy_gate.sh
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

#Modify to take user input

read -p "Please enter CPU load: " CPU_LOAD
read -p "Enter Deploy Flag: " DEPLOY_FLAG

echo "[GATE]    CPU Load:      $CPU_LOAD%"
echo "[GATE]    Deploy Flag:   $DEPLOY_FLAG"

if [ -z $DEPLOY_FLAG ]; then
    echo "[ERROR] Flag is missing."
    exit 1
fi

if [ $CPU_LOAD -gt 80 ]; then
    echo "[BLOCK]   CPU load too high. Deployment blocked."

elif [ $CPU_LOAD -ge 60 ] && [ $CPU_LOAD -le 80 ] && [ "$DEPLOY_FLAG" = "ready" ]; then
    echo "[WARNING] High load detected. Proceed with caution."

elif [ $CPU_LOAD -lt 60 ] && [ "$DEPLOY_FLAG" = "ready" ]; then
    echo "[OK]      All checks passed. Deployment approved."

else
    echo "[BLOCK] Deploy flag is not ready. Deployment blocked."
fi

