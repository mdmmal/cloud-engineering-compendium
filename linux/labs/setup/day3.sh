#!/bin/bash
# Silent setup — Day 3
# Do not read this file before running the lab

mkdir -p ~/devops-lab/day3

# Write the stubborn process script
cat > /tmp/.lab_process.sh << 'EOF'
#!/bin/bash
trap '' SIGTERM SIGHUP
while true; do
  dd if=/dev/urandom bs=512k count=1 2>/dev/null | base64 > /dev/null
  sleep 0.3
done
EOF
chmod +x /tmp/.lab_process.sh

# Launch it silently in the background
nohup /tmp/.lab_process.sh > /dev/null 2>&1 &
nohup /tmp/.lab_process.sh > /dev/null 2>&1 &

# Also write a pid file so the student can verify it ran (but not what to do)
echo $! > ~/devops-lab/day3/.lab_started
