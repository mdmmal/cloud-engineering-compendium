#!/bin/bash


if [ $# -eq 0 ]; then
    echo "[ERROR] No server size specified."
    echo "Usage: ./provision_size.sh"
    echo "[small|medium|large]"
    exit 1
elif [ "$1" = "small" ]; then
    echo "[PROVISION]   Size selected: $@"
    echo "[SPECS]       1 CPUs / 8GB RAM / 100GB Storage"
elif [ "$1" = "medium" ]; then
    echo "[PROVISION]   Size selected: $@"
    echo "[SPECS]       2 CPUs / 8GB RAM / 100GB Storage"
elif [ "$1" = "large" ]; then
    echo "[PROVISION]   Size selected: $@"
    echo "[SPECS]       2 CPUs / 16GB RAM / 200GB Storage"
else
    echo "[ERROR] Invalid size: $@"
    echo "Usage: ./provision_size.sh"
    echo "[small|medium|large]"
fi
