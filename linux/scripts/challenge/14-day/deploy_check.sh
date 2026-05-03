# ============================================================
# Script:       deploy_check.sh
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

#This script displays the basic system context to the terminal


echo "=== Deployment Check ==="
echo "Host: $(hostname)"
echo "User: $(whoami)"
echo "Date: $(date)"
#Print current working directory and the working shell
echo "Workinf dir: $PWD"
echo "Shell: $SHELL"
echo "========================"
