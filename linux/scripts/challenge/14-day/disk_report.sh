#!/bin/bash

if [ $# -eq 0 ]; then
 echo "Usage: disk_report.sh "$1" "
 exit 1
fi

TARGET=$1

if [ ! -d "$TARGET" ]; then
    echo "Error: $TARGET does not exist or is not a directory"
   #exit 1
    exit 1
fi

dir_size=$(du -h -s $TARGET | awk '{print $1}')

echo "============================================"
echo "DISK REPORT: $TARGET"
echo "Generated: $(date '+%Y-%m-%d %H:%M:%S')"
echo "Total size: ${dir_size}GB"
echo "============================================"
echo "Subdirectory          Size     Files    Status"
echo "------------          ----     -----    ------"

flagged=0
largest_dir=""
largest_mb=0

for sub_dir in "$TARGET"/*/; do
    size_subdir=$(du -hs "$sub_dir" | awk '{print $1}')
    file_count=$(find "$sub_dir" -type f | wc -l)
    size_mb=$(du -sm "$sub_dir" | awk '{print $1}')
    
    if [ "$size_mb" -gt 500 ]; then
        status="[!] OVER 500MB"
        flagged=$((flagged + 1))
    else
        status="OK"
    fi

    if [ "$size_mb" -gt "$largest_mb" ]; then
        largest_mb=$size_mb
        largest_dir=$sub_dir
    fi

    printf "%-30s %-10s %-10s %s\n" "${sub_dir%/}" "$size_subdir" "$file_count" "$status"
done

echo "============================================"
echo "  Flagged: $flagged directories over 500MB"
echo "  Recommendation: Investigate $largest_dir first."
echo "============================================"