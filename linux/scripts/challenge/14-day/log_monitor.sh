#!/bin/bash

set -uo pipefail

SCRIPT_NAME="$(basename "$0")"
LOG_FILE="${1:-}"
COUNT_FILE="$(mktemp)"

if [[ -z "$LOG_FILE" ]]; then
  echo "[ERROR] Usage: $SCRIPT_NAME <log_file>"
  exit 1
fi

if [[ ! -f "$LOG_FILE" ]]; then
  echo "[ERROR] File not found: $LOG_FILE"
  exit 1
fi

if [[ ! -r "$LOG_FILE" ]]; then
  echo "[ERROR] File not readable: $LOG_FILE"
  exit 1
fi

echo "0 0" > "$COUNT_FILE"

cleanup(){
    echo ""
    echo "──────────────────────────────────────────────────────"
    echo "[$SCRIPT_NAME] Monitor stopped."

    read -r error_count critical_count < "$COUNT_FILE"
    total=$(( error_count + critical_count ))

    echo "[$SCRIPT_NAME] Summary:"
    printf "  ERROR:    %d\n" "$error_count"
    printf "  CRITICAL: %d\n" "$critical_count"
    printf "  Total:    %d\n" "$total"

    rm -f "$COUNT_FILE"
    kill "$TAIL_PID" 2>/dev/null
    pkill -P $$ tail 2>/dev/null
}

trap cleanup SIGINT SIGTERM EXIT

echo "[$SCRIPT_NAME] Watching: $LOG_FILE"
echo "[$SCRIPT_NAME] PID: $$ | Press Ctrl+C to stop and see summary."
echo "──────────────────────────────────────────────────────"

tail -f "$LOG_FILE" | grep --line-buffered -E "ERROR|CRITICAL" | while IFS= read -r line; do
  TIMESTAMP="$(date +"%Y-%m-%d %H:%M:%S")"
  read -r ec cc < "$COUNT_FILE"

  if [[ "$line" == *"CRITICAL"* ]]; then
    cc=$(( cc + 1 ))
    printf "[%s] CRITICAL detected → \"%s\"\n" "$TIMESTAMP" "$line"
  else
    ec=$(( ec + 1 ))
    printf "[%s] ⚠  ERROR detected   → \"%s\"\n" "$TIMESTAMP" "$line"
  fi

  echo "$ec $cc" > "$COUNT_FILE"
done &

TAIL_PID=$!

wait





