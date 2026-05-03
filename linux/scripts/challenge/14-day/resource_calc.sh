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