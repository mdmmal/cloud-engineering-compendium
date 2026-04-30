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