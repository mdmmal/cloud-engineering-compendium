#!/bin/bash

ENDPOINTS=(
    "api.internal:false"
    "auth.internal:false"
    "payment.internal:true"
)

CRITICAL_FAILURE=false

for ENDPOINT in "${ENDPOINTS[@]}"; do
    IFS=':' read -r name flag <<< "$ENDPOINT"
    if [ $flag == "true" ]; then
        label="CRITICAL"
    else
        label="non-critical"
    fi
echo "[INFO]  Checking: $name ($flag)"    
    attempt=1
    healthy=false

    while [ $attempt -le 3 ]; do
        
        if (( RANDOM % 2 == 0 )); then
            echo "Attempt $attempt/3... [OK]"
            healthy=true
            break
        else
             echo "Attempt $attempt/3... [FAILED]"
        fi
    
        (( attempt++ ))
    done 
    
    if [ $healthy == true ]; then
        echo "[PASS] $name is healtht"
    elif [ "$flag" == "true" ]; then
        CRITICAL_FAILURE=true
        echo "[CRITICAL] $name failed all retries. Aborting sweep."
        break
    else
        echo "[WARN]  $name failed all retries. Non-critical — continuing."
    fi

done

if [ "$CRITICAL_FAILURE" = true ]; then
    echo "[health-check] Sweep ended with critical failure."
else
    echo "[health-check] Sweep complete."
fi