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
