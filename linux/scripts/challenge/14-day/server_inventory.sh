#!/bin/bash
# server_inventory.sh
# Usage: ./server_inventory.sh servers.txt

set -u

GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
RED=$'\033[0;31m'
NC=$'\033[0m'

if [[ -z "$1" ]]; then 
    echo "Usage: $0 <server_file>"
    exit 1
fi

if [[ ! -f "$1" ]]; then
    echo "File not found: $1"
    exit 1
fi

SERVER_FILE=$1
TOTAL=0
REACHABLE=0
UNREACHABLE=0
DATE=$(date +"%b %d %Y")

echo "===================================="
echo "  SERVER INVENTORY REPORT - $DATE"
echo "===================================="
printf "%-20s %-12s %-20s %s\n" "HOST" "STATUS" "UPTIME" "DISK"
echo "===================================="

while IFS= read -r SERVER; do

    ((TOTAL++))
    SSH_RESULT=$(ssh -o ConnectTimeout=3 \
                 -o StrictHostKeyChecking=no \
                 -o BatchMode=yes \
                 "$SERVER" "uptime && df -h / | tail -1 | awk '{print \$5}'" 2>/dev/null)
    if [ $? -eq 0 ]; then
        ((REACHABLE++))
        UPTIME_LINE=$(echo "$SSH_RESULT" | head -1)
        DISK=$(echo "$SSH_RESULT" | tail -1)
        UPTIME=$(echo "$UPTIME_LINE" | awk -F'up ' '{print $2}' | cut -d',' -f1,2)
        printf "%-20s ${GREEN}%-12s${NC} %-20s %s\n" "$SERVER" "REACHABLE" "$UPTIME" "$DISK used"
    else
        ((UNREACHABLE++))
        printf "%-20s ${RED}%-12s${NC} %-20s %s\n" "$SERVER" "UNREACHABLE" "--" "--"
    fi             
done < "$SERVER_FILE"

echo "===================================="
echo "$TOTAL servers checked. $REACHABLE reachable. $UNREACHABLE unreachable."