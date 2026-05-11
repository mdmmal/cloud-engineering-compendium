#!/bin/bash
# ops_toolkit.sh


GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
RED=$'\033[0;31m'
CYAN=$'\033[0;36m'
NC=$'\033[0m'

VERSION="1.0"
HOST=$(hostname)

trap "echo ''; echo 'Toolkit closed.'; exit 0" SIGINT SIGTERM

show_header() {
    echo "========================================"
    echo "  OPS TOOLKIT v$VERSION - $HOST"
    echo "========================================"
}
show_menu() {
    echo "  ${CYAN}1)${NC} System Health Check"
    echo "  ${CYAN}2)${NC} Log Monitor"
    echo "  ${CYAN}3)${NC} File Audit (files modified last 24h)"
    echo "  ${CYAN}4)${NC} Backup Status Check"
    echo "  ${CYAN}5)${NC} Alert Check (threshold scan)"
    echo "  ${CYAN}6)${NC} Exit"
}

health_check() {
    local DISK_THRESHOLD=80
    local MEM_THRESHOLD=75
    local CPU_THRESHOLD=2.0
    DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}' | tr -d '%')
    MEM_USAGE=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')
    CPU_LOAD=$(uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | tr -d ',')
    HIGH_CPU=$(awk "BEGIN {print ($CPU_LOAD > $CPU_THRESHOLD)}")
#
    if (( DISK_USAGE >= DISK_THRESHOLD )); then
        echo "${RED}[CRIT]${NC} Disk Usage: ${DISK_USAGE}% used"
    else
        echo "${GREEN}[OK]${NC} Disk Usage: ${DISK_USAGE}% used"
    fi                                                                                                                                               
#
    if (( MEM_USAGE > MEM_THRESHOLD )); then
        echo "${YELLOW}[WARN]${NC} Memory usage: ${MEM_USAGE}% used"
    else
        echo "${GREEN}[OK]${NC} Memory Usage: ${MEM_USAGE}% used"
    fi
#
    if [[ "$HIGH_CPU" -eq 1 ]]; then
        echo "${YELLOW}[WARN]${NC} CPU Load: $CPU_LOAD (1-min avg)"
    else
        echo "${GREEN}[OK]${NC} CPU Load: $CPU_LOAD (1-min avg)"
    fi

}

log_monitor() {
    LOG=$(tail -100 /var/log/syslog 2>/dev/null)
    if [[ -z "$LOG" ]]; then
        echo "Log file not accessible."
        return
    fi
    ERRORS=$(echo "$LOG" | grep -c "ERROR")
    WARNINGS=$(echo "$LOG" | grep -c "WARNING")
    INFO=$(echo "$LOG" | grep -c "INFO")

    echo "Last 100 lines of syslog:"
    echo "  ERRORs:   $ERRORS"
    echo "  WARNINGs: $WARNINGS"
    echo "  INFO:     $INFO"
}

file_audit() {
    echo "Files modified in last 24h:"
    COUNT=$(find /var/log /tmp -mtime -1 -type f 2>/dev/null | wc -l)
    echo "  Total: $COUNT"
    find /var/log /tmp -mtime -1 -type f 2>/dev/null

    echo ""
    echo "Files over 100MB in /var/log:"
    LARGE=$(find /var/log -size +100M 2>/dev/null)
    if [[ -z "$LARGE" ]]; then
        echo "  None found."
    else
        echo "$LARGE"
    fi
}

backup_check() {
    if [[ ! -d "/var/backups" ]]; then
        echo "${YELLOW}[WARN] No backup directory found at /var/backups${NC}"
        return
    fi

    COUNT=$(ls /var/backups 2>/dev/null | wc -l)
    echo "Backup directory: /var/backups"
    echo "  Total backups: $COUNT"
    echo "  Most recent:"
    ls -lt /var/backups 2>/dev/null | head -5
}

alert_check() {
    echo ""
    DISK=$(df -h / | tail -1 | awk '{print $5}' | tr -d '%')
    MEM=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')
    CPU=$(uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | tr -d ',' | tr -d ' ')

    ALERTS=0

    if (( DISK >= 80 )); then
        echo "${RED}[ALERT] Disk usage critical: ${DISK}%${NC}"
        ((ALERTS++))
    fi

    if (( MEM >= 75 )); then
        echo "${YELLOW}[ALERT] Memory usage high: ${MEM}%${NC}"
        ((ALERTS++))
    fi

    HIGH_CPU=$(awk "BEGIN {print ($CPU > 2.0)}")
    if [[ "$HIGH_CPU" -eq 1 ]]; then
        echo "${YELLOW}[ALERT] CPU load high: ${CPU}${NC}"
        ((ALERTS++))
    fi

    if [[ "$ALERTS" -eq 0 ]]; then
        echo "${GREEN}[OK] No alerts — all thresholds within range.${NC}"
    else
        echo "${RED}$ALERTS active alert(s) detected.${NC}"
    fi
    echo ""
}

show_header

while true; do
    show_menu
    read -p "Select an option [1-6]: " CHOICE

    case $CHOICE in
        1) echo "--- Running: health_check ---"
        health_check
        echo "--- Done ---" ;;

        2) echo "--- Running: log_monitor ---"
        log_monitor
        echo "--- Done ---" ;;

        3) echo "--- Running: file_audit ---"
        file_audit
        echo "--- Done ---" ;;

        4) echo "--- Running: backup_check ---"
        backup_check
        echo "--- Done ---" ;;

        5) echo "--- Running: alert_check ---"
        alert_check
        echo "--- Done ---" ;;

        6) echo "Closing toolkit."
        exit 0 ;;

        *) echo "Invalid option. Enter 1-6." ;;

    esac
done