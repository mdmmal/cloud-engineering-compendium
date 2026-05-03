# ============================================================
# Script:       provision_start.sh
# Track:        Linux / Bash
# Week:         Week 1 | 14-Day Challenge
# Challenge:    14-Day Bash Scripting Challenge
# ============================================================
# What it does:
#   Captures and displays the provisioning context at runtime —
#   current user, hostname, timestamp, working directory, and
#   home directory. Confirms who is starting provisioning and from
#   where.
#
# DevOps context:
#   Provisioning kickoff confirmation. Validates operator identity
#   and environment context before infrastructure creation begins.
#   Maps to the audit log entry created at the start of a Terraform
#   apply run.
#
# Real scenario:
#   Engineer runs this before executing terraform apply to confirm
#   they are operating from the correct directory and logged in as
#   the correct account.
# ============================================================
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