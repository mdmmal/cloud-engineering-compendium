#!/bin/bash
# health_monitor.sh
# Usage: ./health_monitor.sh <service_name>


GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
RED=$'\033[0;31m'
NC=$'\033[0m'

DISK_THRESHOLD=80
MEM_THRESHOLD=75
CPU_THRESHOLD=2.0


if [[ -z "$1" ]]; then
    echo "Usage: $0 <service_name>"
    exit 1
fi
SERVICE_NAME="$1"

echo "============================================================"
echo "  SYSTEM HEALTH REPORT — $(hostname)"
echo "============================================================"

DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}' | tr -d '%')

if (( DISK_USAGE >= DISK_THRESHOLD )); then
    echo "${RED}[CRIT]${NC} Disk Usage: ${DISK_USAGE}% used"
else
    echo "${GREEN}[OK]${NC} Disk Usage: ${DISK_USAGE}% used"
fi
MEM_USAGE=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')

if (( MEM_USAGE > MEM_THRESHOLD )); then
    echo "${YELLOW}[WARN]${NC} Memory usage: ${MEM_USAGE}% used"
else
    echo "${GREEN}[OK]${NC} Memory Usage: ${MEM_USAGE}% used"
fi

CPU_LOAD=$(uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | tr -d ',')

HIGH_CPU=$(awk "BEGIN {print ($CPU_LOAD > $CPU_THRESHOLD)}")

if  [[ "$HIGH_CPU" -eq 1 ]]; then
    echo "${YELLOW}[WARN]${NC} CPU Load:    $CPU_LOAD (1-min avg)"
else
    echo "${GREEN}[OK]${NC} CPU Load:    $CPU_LOAD (1-min avg)"
fi

STATUS=$(systemctl is-active "$SERVICE_NAME")

if [[ "$STATUS" == "active" ]]; then

    echo "${GREEN}[OK]${NC} Service $SERVICE_NAME: RUNNING"

else

    echo "${RED}[CRIT]${NC} Service $SERVICE_NAME: NOT RUNNING"
fi


echo "============================================================"