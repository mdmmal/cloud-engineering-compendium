# ============================================================
# Script:       provision_size.sh
# Track:        Linux / Bash
# Week:         Week 1 | 14-Day Challenge
# Challenge:    14-Day Bash Scripting Challenge
# ============================================================
# What it does:
#   [2-3 sentences. Plain language. What happens when you run it.]
#
# DevOps context:
#   [Where this shows up in real DevOps work.
#    What production scenario this maps to.]
#
# Real scenario:
#   [One sentence. The actual situation.]
# ============================================================
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
