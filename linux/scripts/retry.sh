#!/bin/bash



 retry() {
    
    local command=$1
    local max=$2
    local attempt=1
    
    echo "[retry] Attempting: $command"


    while [ $attempt -le $max ]; do
        echo -n " Try $attempt/$max... "
        
        if  eval "$command" > /dev/null 2>&1; then
            
            echo "OK"
            echo "[retry] Succeeded on attempt $attempt."
            return 0
        fi

        echo "FAILED"
        (( attempt++ ))
    done

    echo "[retry] All $max attampts failed. Giving Up."
    return 1
 }

retry "curl -s http://google.com" 3
exit $?