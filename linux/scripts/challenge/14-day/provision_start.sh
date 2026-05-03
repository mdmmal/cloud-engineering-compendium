# ============================================================
# Script:       provision_start.sh
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

current_user=$(whoami)
hostname=$HOSTNAME
time=$(date)
working_dir=$(pwd)
home_dir=$HOME

echo "=== Provisioning Started ==="
echo "Run by:   $current_user"
echo "Host:     $hostname"
echo "Time:     $time"
echo "CWD:      $working_dir"
echo "home:     $home_dir"
echo "============================"