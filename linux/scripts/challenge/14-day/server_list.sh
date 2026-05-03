# ============================================================
# Script:       server_list.sh
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

SERVER=("web-01" "app-01" "db-01")
SERVER+=("cache-01")

echo "=== Server Inventory ==="

COUNT=0
for SERVER in "${SERVER[@]}";do
    echo "[$COUNT] $SERVER"
    COUNT=$(( COUNT + 1))
done 
echo "---"
echo "Total servers: ${#ARRAY[@]}"
echo "========================="