# ============================================================
# Script:       preflight.sh
# Track:        Linux / Bash
# Week:         Week 1 | 14-Day Challenge
# Challenge:    14-Day Bash Scripting Challenge
# ============================================================
# What it does:
#   Generates a unique build ID using a formatted timestamp,
#   displays the deployment environment and home directory,
#   and confirms the pre-flight state before a pipeline runs.
#
# DevOps context:
#   CI/CD pre-flight validation. Runs before any pipeline stage
#   begins to confirm environment variables are set and a unique
#   build identifier has been generated for tracing.
#
# Real scenario:
#   First step in a GitHub Actions workflow — generates the build
#   ID that gets attached to every log line and artifact produced
#   by that pipeline run for traceability.
# ============================================================
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
