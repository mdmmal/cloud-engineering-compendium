#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "[ERROR] $1 does not exist."
    exit 1
fi

echo "[INFO] Running health check against: $1"

FAILURES=0
CHECKED=0

while read -r server; do
    if [ -z "$server" ] || [[ "$server" == \#* ]]; then
    continue 
    fi
    
    CHECKED=$(( CHECKED + 1 ))

    if [[ "$server" == *prod* ]]; then
        ENV_TAG="[PROD]"
    elif [[ "$server" == *stg* ]]; then
        ENV_TAG="[STG]"
    else
        ENV_TAG="[UNKNOWN]"
    fi



    if [[ "$server" == *bad* ]]; then
        FAILURES=$(( FAILURES + 1 ))
        echo "$ENV_TAG[FAIL] $server unreachable"
    else
        echo "$ENV_TAG[PASS] $server"
    fi

    
done < "$1"


echo "---"
echo "[SUMMARY] Host checked: $CHECKED"
echo "[SUMMARY] Failures:     $FAILURES"