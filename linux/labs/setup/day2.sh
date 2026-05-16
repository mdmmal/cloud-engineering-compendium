#!/bin/bash
# Silent setup — Day 2
# Do not read this file before running the lab

mkdir -p ~/devops-lab/day2/{logs,cache,tmp,archive}

# Bloated unrotated log
python3 -c "
import random, os
levels = ['INFO']*70 + ['WARN']*20 + ['ERROR']*8 + ['CRITICAL']*2
services = ['api-gateway','auth-service','payment-processor','db-connector','cache-service']
errors = [
    'Connection timeout after 30s',
    'Database query failed: deadlock detected',
    'Memory allocation failed',
    'SSL certificate verification failed',
    'Rate limit exceeded for client 10.0.0.42',
    'Upstream service unreachable',
]
path = os.path.expanduser('~/devops-lab/day2/logs/application.log')
with open(path, 'w') as f:
    for i in range(200000):
        level = random.choice(levels)
        service = random.choice(services)
        msg = random.choice(errors) if level in ['ERROR','CRITICAL'] else f'Request processed id={i}'
        f.write(f'[2026-04-{random.randint(1,30):02d}] [{level}] {service}: {msg}\n')
"

# Build cache bloat
dd if=/dev/urandom of=~/devops-lab/day2/cache/build-cache.bin bs=1M count=120 2>/dev/null

# Old temp files
for i in {1..40}; do
  dd if=/dev/urandom of=~/devops-lab/day2/tmp/temp_$i.dat bs=1M count=2 2>/dev/null
done

# Old archive
dd if=/dev/urandom of=~/devops-lab/day2/archive/release-v1.tar.gz bs=1M count=80 2>/dev/null
