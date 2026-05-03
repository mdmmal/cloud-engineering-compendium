# ============================================================
# Script:       readiness_check.sh
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


USER=$(whoami)
HOST=$HOSTNAME
TIME=$(date)
DEPLOY_TAG="v2.4.1-production-us-east"

CPU_LOAD=55
MEM_FREE_GB=12

TOTAL_CHECKS=3

read -p "Enter the target enviorment: " ENV



if [ -z $ENV ]; then
    echo "[ERROR]: Missing Environment variable."
    echo "Usage: ./readiness_check.sh [dev|staging\production]"
    exit 1
fi

if [ "$ENV" != "dev" ] && [ "$ENV" != "staging" ] && [ "$ENV" != "production" ]; then
    echo "[ERROR] Invalid environment: $1"
    echo "Usage: ./readiness_check.sh [dev|staging|production]"
    exit 1
fi


echo "=== Deployment Readiness Check ==="
echo "Operator:     $USER"
echo "Host:         $HOST"
echo "Time:         $TIME"
echo "Target:       $ENV"
echo "=================================="
echo ""
echo "[TAG]  Deploy tag:        $DEPLOY_TAG"
echo "[TAG]  Version:           ${DEPLOY_TAG:0:6}"
echo "[TAG]  Tag length:        ${#DEPLOY_TAG}"
echo ""
echo "[GATE] CPU Load:      $CPU_LOAD%"
echo "[GATE] Mem Free:      ${MEM_FREE_GB}GB"


if [ $CPU_LOAD -gt 80 ]; then
    echo "[BLOCK] CPU load too high. Aborting."
    exit 1
fi

if [ $MEM_FREE_GB -lt 8 ]; then
    echo "[BLOCK] Insufficient memory. Aborting."
    exit 1
fi

echo "[OK]   System checks passed."
echo ""
echo "---"
echo "[SUMMARY] Target:        $ENV"
echo "[SUMMARY] Checks run:    $TOTAL_CHECKS"
echo "[SUMMARY] Status:        APPROVED"
echo "=================================="

export TOTAL_CHECKS
echo "[INFO] TOTAL_CHECKS exported to environment."