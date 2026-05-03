# ============================================================
# Script:       resource_calc.sh
# Track:        Linux / Bash
# Week:         Week 1 | 14-Day Challenge
# Challenge:    14-Day Bash Scripting Challenge
# ============================================================
# What it does:
#   Defines CPU, RAM, storage, and hourly rate variables then
#   calculates monthly hours, monthly cost, and RAM per core
#   using bash arithmetic. Exports monthly cost to environment.
#
# DevOps context:
#   Pre-provisioning cost estimation. Calculates infrastructure
#   costs before committing to a resource configuration. Maps to
#   the cost planning step before writing Terraform configs.
#
# Real scenario:
#   Engineer runs this to estimate monthly EC2 costs for a new
#   service before requesting budget approval and writing the
#   infrastructure code.
# ============================================================
# ============================================================
# Script:       resource_calc.sh
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

#This script calculates estimated monthly cost
#and resource ratios based on raw input


CPU_CORES=8
RAM_GB=32
STORAGE_GB=500
HOURLY_RATE=3

MONTHLY_HOURS=$((24 * 30))
MONTHLY_COST=$((HOURLY_RATE * MONTHLY_HOURS))
RAM_PER_CORE=$((RAM_GB * CPU_CORES))

echo "=== Resource Summary ==="
echo "CPUs:             $CPU_CORES"
echo "RAM (GB):         $RAM_GB"
echo "Storgage (GB):    $STORAGE_GB"
echo "---"
echo "Monthly Hours:    $MONTHLY_HOURS"
echo "Monthly Cost:     $MONTHLY_COST cents"
echo "RAM Per Core:     $RAM_PER_CORE GB"
#add a section that exports MONTHLY_COST as envir variable
export MONTHLY_COST
echo "[INFO] MONTHLY_COST exported to environment."
echo "========================"