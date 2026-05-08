#!/bin/bash
# health_monitor.sh
# Usage: ./health_monitor.sh <service_name>

# --- SETUP ---

# 1. Define color variables using ANSI escape codes
GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
RED=$'\033[0;31m'
NC=$'\033[0m'

# 2. Define threshold variables
DISK_THRESHOLD=80
MEM_THRESHOLD=75
CPU_THRESHOLD=2.0

# 3. GET service name from first argument $1
#    IF $1 is empty:
if [[ -z "$1" ]]; then
#      PRINT usage message showing how to run the script
    echo "Usage: $0 <service_name>"
#      EXIT with code 1
    exit 1
#    STORE it in a variable called SERVICE_NAME
fi
SERVICE_NAME="$1"

# --- HEADER ---

# 4. PRINT a divider line of = signs
echo "============================================================"
#    PRINT "  SYSTEM HEALTH REPORT — " + the machine hostname (run hostname dynamically)
echo "  SYSTEM HEALTH REPORT — $(hostname)"
#    PRINT another divider line
echo "============================================================"
# --- CHECK 1: DISK ---

# 5. GET disk usage percentage for "/"
#    RUN: df -h /
#    PIPE through tail -1 to get the data row
#    PIPE through awk '{print $5}' to get the percentage column
#    PIPE through tr -d '%' to strip the percent sign
#    STORE result in DISK_USAGE
DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}' | tr -d '%')

# 6. IF DISK_USAGE >= DISK_THRESHOLD:
if (( DISK_USAGE >= DISK_THRESHOLD )); then
#      PRINT red [CRIT] line with percentage
    echo "${RED}[CRIT]${NC} Disk Usage: ${DISK_USAGE}% used"
#    ELSE:
else
#      PRINT green [OK] line with percentage
    echo "${GREEN}[OK]${NC} Disk Usage: ${DISK_USAGE}% used"
fi

# --- CHECK 2: MEMORY ---

# 7. GET memory usage percentage
#    RUN: free | grep Mem
#    PIPE through awk '{printf "%.0f", $3/$2 * 100}'
#    STORE result in MEM_USAGE
MEM_USAGE=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')
# 8. IF MEM_USAGE > MEM_THRESHOLD:
if (( MEM_USAGE > MEM_THRESHOLD )); then
#      PRINT yellow [WARN] line with percentage
    echo "${YELLOW}[WARN]${NC} Memory usage: ${MEM_USAGE}% used"
#    ELSE:
else
#      PRINT green [OK] line with percentage
    echo "${GREEN}[OK]${NC} Memory Usage: ${MEM_USAGE}% used"
fi

#    NOTE: use (( )) for integer comparison

# --- CHECK 3: CPU LOAD ---

# 9. GET 1-minute CPU load average
CPU_LOAD=$(uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | tr -d ',')
#    STORE result in CPU_LOAD

# 10. COMPARE CPU_LOAD to CPU_THRESHOLD using bc
#     STORE result of: echo "$CPU_LOAD > $CPU_THRESHOLD" | bc  →  in HIGH_CPU
HIGH_CPU=$(echo "$CPU_LOAD > $CPU_THRESHOLD" | bc)
#     IF HIGH_CPU equals 1:
if  [[ "$HIGH_CPU" -eq 1 ]]; then
#       PRINT yellow [WARN] line with load value
    echo "${YELLOW}[WARN]${NC} CPU Load:    $CPU_LOAD (1-min avg)"
#     ELSE:
else
#       PRINT green [OK] line with load value
    echo "${GREEN}[OK]${NC} CPU Load:    $CPU_LOAD (1-min avg)"
fi

# --- CHECK 4: SERVICE STATUS ---

# 11. GET service status
#     RUN: systemctl is-active "$SERVICE_NAME"
#     STORE result in STATUS
STATUS=$(systemctl is-active "$SERVICE_NAME")

# 12. IF STATUS equals "active":
if [[ "$STATUS" == "active" ]]; then
#       PRINT green [OK] service is RUNNING
    echo "${GREEN}[OK]${NC} Service $SERVICE_NAME: RUNNING"
#     ELSE:
else
#       PRINT red [CRIT] service is NOT RUNNING
    echo "${RED}[CRIT]${NC} Service $SERVICE_NAME: NOT RUNNING"
fi

# --- FOOTER ---

# 13. PRINT closing divider line
echo "============================================================"