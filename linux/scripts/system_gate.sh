#!/bin/bash

DISK_USED_PCT=72
RAM_FREE_GB=6
ENV_FLAG="production"

if [ -z $ENV_FLAG ]; then
    echo "[ERROR] Missing flag"
    exit 1
fi

if [ $ENV_FLAG != "production" ] && [ $ENV_FLAG != "staging" ]; then
    echo "[INVALID] Invalid $ENV is not a valid flag"
    exit 1
fi

echo "[GATE] Environment:   $ENV_FLAG"
echo "[GATE] Disk Used:     $DISK_USED_PCT%"
echo "[GATE] RAM Free:      ${RAM_FREE_GB}GB"


if [ $DISK_USED_PCT -ge 90 ]; then
    echo "[BLOCK] Disk usage critical. Deployment blocked."
elif [ $RAM_FREE_GB -lt 4 ]; then
    echo "[BLOCK] Low memory."
elif [[ ($DISK_USED_PCT -ge 70 && $DISK_USED_PCT -lt 90) || ($RAM_FREE_GB -ge 4 && $RAM_FREE_GB -lt 7) ]]; then
    echo "[WARNING] Resources are tight but within limits. Proceed carefully."
else
    echo "[OK]   All systems clear. Deployment approved."
fi
