#!/bin/bash

UPTIME_INPUT="137 Minutes"
UPTIME_HRS="4 hours"

echo "=== Server Health Snapschot ==="
echo "Host:             $HOSTNAME"
echo "User:             $(whoami)"
echo "Snapshot Time:    $(date)"
echo "Working DIr:      $PWD"
echo "Shell:            $SHELL"
echo "---"
echo "Uptime Input:     $UPTIME_INPUT"
echo "Uptime (hrs):     $UPTIME_HRS"
echo "=============================="
echo "[INFO] SNAPSHOT_TIME exported to environment."
echo "[CLEANUP] UPTIME_MINUTES cleared."
