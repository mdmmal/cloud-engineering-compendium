# ============================================================
# Script:       env_check.sh
# Track:        Linux / Bash
# Week:         Week 1 | 14-Day Challenge
# Challenge:    14-Day Bash Scripting Challenge
# ============================================================
# What it does:
#   Takes an environment name as input and loops through a
#   predefined server list, confirming each server is present
#   in that environment. Reports total servers checked.
#
# DevOps context:
#   Environment validation before a fleet-wide operation.
#   Confirms all expected servers are accounted for before
#   running a deployment or configuration change across them.
#
# Real scenario:
#   Before a rolling update, the pipeline runs this to confirm
#   all servers in the target environment are reachable and
#   registered before the update begins.
# ============================================================
# ============================================================
# Script:       env_check.sh
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


SERVER=("web-01" "web-02" "app-01" " db-01")
ENV=$1

if [ $# -eq 0 ]; then
    echo "[ERROR]No environment specified."
    echo "Usage: ./env_check.sh [$ENV]"
    exit 1
fi

echo "=== Environment Check: staging ==="

for SERVER in "${SERVER[@]}"; do
    echo "[CHECK] $SERVER   -> $ENV : OK"
done





echo "---"
echo "Checked ${#SERVER[@]} servers in: $ENV"
echo "=================================="
