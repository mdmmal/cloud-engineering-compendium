# Day 2 — Disk Emergency Investigation

## Starting state
- Disk usage: 47% (3.4G used / 7.6G)

## What I found
- cache/build-cache.bin: 121M — build cache never cleared
- archive/release-v1.tar.gz: 81M — old release never deleted
- tmp/temp_*.dat: 81M — temp files never cleaned up
- logs/application.log: 13M — unrotated log file

## What I did
- Removed build cache
- Removed archive
- Removed temp files
- Truncated log to last 1000 lines (safe — preserves recent entries)

## Result
- Disk usage: 43% (3.1G used / 7.6G)
- All bloat directories at 4K
- Log file reduced to 64K
