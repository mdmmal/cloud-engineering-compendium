# ============================================================
# Script:       preflight.sh
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

#preflight validation script that check for values and reports

DEPLOY_DEV="production"
BUILD_ID=$(date +%Y%m%d-%H%M%S)

echo "=== Pre-Flight Check ==="
echo "Deploy Enviorment:  $DEPLOY_DEV"
echo "Build ID:           $BUILD_ID"
echo "Home Directory:     $HOME"
echo "========================"
