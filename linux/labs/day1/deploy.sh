#!/bin/bash
echo '[deploy] Starting pre-flight check...'
echo '[deploy] Checking disk space...'
df -h / | tail -1
echo '[deploy] Checking memory...'
free -h | grep Mem
echo '[deploy] Writing deploy log...'
echo "Deploy run: $(date)" >> ~/devops-lab/day1/logs/deploy.log
echo '[deploy] Pre-flight complete. Ready to deploy.'
