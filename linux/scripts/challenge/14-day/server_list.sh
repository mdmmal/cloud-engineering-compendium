# ============================================================
# Script:       server_list.sh
# Track:        Linux / Bash
# Week:         Week 1 | 14-Day Challenge
# Challenge:    14-Day Bash Scripting Challenge
# ============================================================
# What it does:
#   Defines a server inventory array, adds a server dynamically,
#   then loops through the full list printing each server with
#   an index number and total count.
#
# DevOps context:
#   Fleet inventory listing. Generates a numbered server list
#   before fleet-wide operations. Maps to the server discovery
#   step before running Ansible playbooks across a fleet.
#
# Real scenario:
#   Engineer runs this to confirm the full server inventory before
#   a fleet-wide configuration change to ensure no servers are
#   missed or duplicated in the operation.
# ============================================================
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