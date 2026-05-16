#!/bin/bash
# Silent setup — Day 1
# Do not read this file before running the lab

mkdir -p ~/devops-lab/day1/{scripts,logs,output}

cat > ~/devops-lab/day1/scripts/deploy.sh << 'EOF'
#!/bin/bash
echo '[deploy] Starting pre-flight check...'
echo '[deploy] Checking disk space...'
df -h / | tail -1
echo '[deploy] Checking memory...'
free -h | grep Mem
echo '[deploy] Writing deploy log...'
echo "Deploy run: $(date)" >> ~/devops-lab/day1/logs/deploy.log
echo '[deploy] Pre-flight complete. Ready to deploy.'
EOF

touch ~/devops-lab/day1/logs/.keep
touch ~/devops-lab/day1/output/.keep

chmod 000 ~/devops-lab/day1/scripts/deploy.sh
sudo chown root:root ~/devops-lab/day1/scripts/deploy.sh
chmod 000 ~/devops-lab/day1/logs
sudo chown root:root ~/devops-lab/day1/logs
chmod 555 ~/devops-lab/day1/output
