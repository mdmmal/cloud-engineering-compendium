# ============================================================
# Script:       log_checker.sh
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

SERVERS=("web-01" "web-02" "app-01" "db-01")

if [ $# -eq 0 ]; then
    echo "[ERROR] No log level specified."
    echo "Usage:  ./log_checker.sh [INFO|WARN|ERROR]"
    exit 1
fi

if [ "$1" != "INFO" ] && [ "$1" != "WARN" ] && [ "$1" != "ERROR" ]; then
    echo "[ERROR] Invalid log level: $@"
    echo "Usage: ./log_checker.sh [INFO|WARN|ERROR]"
    exit 1
fi

LOG_LEVEL=$1

echo "=== Log Check: $LOG_LEVEL ==="

for SERVER in "${SERVERS[@]}"; do
    echo "[SCAN] $SERVER ... checking $LOG_LEVEL logs"
done

echo "---"
echo "Servers scanned: ${#SERVERS[@]}"
echo "=========================="

