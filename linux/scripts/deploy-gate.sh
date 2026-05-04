#!/bin/bash

DISK_THRESHOLD=85
MEMORY_THRESHOLD=20
SERVICE_URL="https://app.internal/health"


check_disk(){ 
local usage
usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
echo -n "[CHECK] Disk usage...      ${usage}%   "

if [[ "$usage" -gt "$DISK_THRESHOLD" ]]; then 
        echo "FAIL - minimum: ${DISK_THRESHOLD}%  "
        return 1
    fi
    echo "PASS"
    return 0



}

check_memory(){ 
    local pct
    local free
    local total

    total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    free=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
    pct=$(( 100 * $free / $total ))
    echo -n "[CHECK] Memory avalible.. ${pct}%  "

   if [[ "$pct" -lt "$MEMORY_THRESHOLD" ]]; then 
        echo "FAIL - minimum: ${MEMORY_THRESHOLD}%  "
        return 1
    fi
    echo "PASS"
    return 0
    }


check_services(){
    echo "[CHECK] Service health...            "
    if curl -s "$SERVICE_URL" > /dev/null 2>&1; then
        echo "PASS"
        return 0
    fi
    echo "FAIL — $SERVICE_URL unreachable"
    return 1
     
}

echo "[deploy-gate] Running pre-deploy checks..."
echo ""

for check in check_disk check_memory check_services; do
  if ! $check; then
    echo ""
    echo "[deploy-gate] Pre-deploy check failed. Deploy blocked."
    exit 1
  fi
done

echo ""
echo "[deploy-gate] All checks passed. Proceeding to deploy."
exit 0
