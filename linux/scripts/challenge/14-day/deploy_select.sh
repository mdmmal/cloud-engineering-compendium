# ============================================================
# Script:       deploy_select.sh
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

if [ $# -eq 0 ]; then
    echo "[ERROR] No enviorment specified."
    echo "Usage: ./deploy_select.sh [dev|staging|production]"
elif [ "$1" = "dev" ]; then
    echo "[DEPLOY]  Target: dev"
    echo "[INFO]    Safe to proceed. No approval required."
elif [ "$1" = "staging" ]; then
    echo "[DEPLOY]  Target: staging"
    echo "[INFO]    Notify QA before proceeding."
elif [ "$1" = "production" ]; then
    echo "[DEPLOY]  Target: production"
    echo "[WARNING] Production deployment. Confirm change ticket is approved."
else 
    echo "[ERROR] Unknown environment: $1"
    echo "Usage: ./deploy_select.sh [dev|staging|production]"
fi
