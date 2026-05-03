# ============================================================
# Script:       pipeline_run.sh
# Track:        Linux / Bash
# Week:         Week 1 | 14-Day Challenge
# Challenge:    14-Day Bash Scripting Challenge
# ============================================================
# What it does:
#   Simulates a CI/CD pipeline run for a given environment.
#   Validates the environment argument, loops through servers
#   running config and connectivity checks, and exports results.
#
# DevOps context:
#   Manual pipeline simulation before Jenkins or GitHub Actions
#   is configured. Demonstrates the same logic that CI/CD tools
#   automate — validate, iterate, report, export.
#
# Real scenario:
#   Engineer manually triggers this during initial infrastructure
#   setup to verify all servers pass config and connectivity
#   checks before the automated pipeline is wired up.
# ============================================================
# ============================================================
# Script:       pipeline_run.sh
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

ENV=$1
SERVER=("web-01" "app-01" "db-01")

if [ $# -eq 0 ]; then
    echo "[ERROR] No argument exist."
    echo "Usage: ./pipeline_run.sh [dev|staging|production]"
    exit 1
elif [ $ENV != "staging" ] && [ $ENV != "dev" ] && [ $ENV != "production" ]; then
    echo "[ERROR] $ENV is an invalide error"
    echo "Please try [dev|staging|production]"
    exit 1
fi

RUN_TIMESTAMP=$(date)
TOTAL_CHECKS=$(( ${#SERVER[@]} * 2 ))

echo "=== Pipeline Run ==="
echo "Operator:     $(whoami)"
echo "Host:         $HOSTNAME"
echo "Timestamp:    $RUN_TIMESTAMP"
echo "Target:       $ENV"
echo "===================="
echo ""
echo "[SERVER] ${#SERVER[@]} servers targeted."
echo ""

for SERVER in "${SERVER[@]}"; do
    echo "[CHECK] $ENV      config            ... OK"
    echo "[CHECK] $ENV      connectivity      ... OK"
done

echo ""
echo "---"
echo "Total check run: $TOTAL_CHECKS"
echo "===================="

export TOTAL_CHECKS
echo "[INFO]     TOTAL_CHECKS exported to environment."

unset RUN_TIME
echo "[CLEANUP] RUN_TIMESTAMP cleared."