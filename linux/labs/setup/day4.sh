#!/bin/bash
# Silent setup — Day 4
# Do not read this file before running the lab

mkdir -p ~/devops-lab/day4/logs

python3 -c "
import random, os
from datetime import datetime, timedelta

services = ['api-gateway','auth-service','payment-processor','db-connector','cache-service']
levels = ['INFO']*68 + ['WARN']*22 + ['ERROR']*8 + ['CRITICAL']*2

errors = [
    'Connection timeout after 30s',
    'Database query failed: deadlock detected',
    'Memory allocation failed',
    'SSL handshake failed',
    'Rate limit exceeded for client 10.0.0.42',
    'Upstream service unreachable',
    'Disk I/O error on /dev/sda',
    'Authentication token expired',
]

# Weight one service to fail more than others
weighted_services = services + ['auth-service'] * 8 + ['payment-processor'] * 4

path = os.path.expanduser('~/devops-lab/day4/logs/service.log')
start = datetime(2026, 5, 1, 0, 0, 0)
with open(path, 'w') as f:
    for i in range(10000):
        ts = start + timedelta(seconds=i * 3)
        level = random.choice(levels)
        service = random.choice(weighted_services)
        if level in ['ERROR', 'CRITICAL']:
            msg = random.choice(errors)
        else:
            msg = f'Request processed successfully id={i}'
        f.write(f'[{ts.strftime(\"%Y-%m-%d %H:%M:%S\")}] [{level}] {service}: {msg}\n')
"
