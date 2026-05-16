#!/bin/bash
# Silent setup — Day 5
# Do not read this file before running the lab

mkdir -p ~/devops-lab/day5/{reports,logs}

# Leave some disk bloat to make the audit interesting
dd if=/dev/urandom of=~/devops-lab/day5/logs/old-build.bin bs=1M count=60 2>/dev/null

# Leave a log with errors for the audit to summarize
python3 -c "
import random, os
from datetime import datetime, timedelta

services = ['api-gateway','auth-service','db-connector']
levels = ['INFO']*72 + ['WARN']*18 + ['ERROR']*8 + ['CRITICAL']*2

path = os.path.expanduser('~/devops-lab/day5/logs/app.log')
start = datetime(2026, 5, 1, 0, 0, 0)
with open(path, 'w') as f:
    for i in range(5000):
        ts = start + timedelta(seconds=i * 5)
        level = random.choice(levels)
        service = random.choice(services)
        msg = 'Request ok' if level == 'INFO' else f'Event {level.lower()} on {service}'
        f.write(f'[{ts.strftime(\"%Y-%m-%d %H:%M:%S\")}] [{level}] {service}: {msg}\n')
"
