#!/bin/bash

#if no argument provided:
if [ -z "$1" ]; then
    #print usage
    echo "Usage: $0 <path>"
    #exit 1
    exit 1
fi

#TARGET = $1
TARGET="$1"

#if TARGET is not a directory:
if [ ! -d "$TARGET" ]; then
    #print error
    echo "Error: $TARGET does not exist or is not a directory"
   #exit 1
   exit 1
fi

#collect:
    #file_count  = number of files under TARGET
file_count=$(find "$TARGET" -type f | wc -l)
    #dir_count   = number of dirs under TARGET
dir_count=$(find "$TARGET" -type d | wc -l)
    #largest     = file with most bytes

largest_raw=$(find "$TARGET" -type f -printf "%s %f\n" 2>/dev/null | sort -rn | head -1)
largest_size=$(echo "$largest_raw" | awk '{print $1}')
largest_name=$(echo "$largest_raw" | awk '{print $2}')

if [ "$largest_size" -ge 1048576 ] 2>/dev/null; then
  largest_display=$(echo "$largest_size" | awk '{printf "%.1fMB", $1/1048576}')
elif [ "$largest_size" -ge 1024 ] 2>/dev/null; then
  largest_display=$(echo "$largest_size" | awk '{printf "%.1fKB", $1/1024}')
else
  largest_display="${largest_size}B"
fi

largest=$(find "$TARGET" -type f -printf "%s %p\n" | sort -rn | head -1| )
    #recent      = file with newest modification time
recent=$(find "$TARGET" -type f -printf "%T@ %f\n" | sort -rn | head -1 | awk '{print $2}')
    #log_count   = number of .log files
log_count=$(find "$TARGET" -type f -name "*.log" | wc -l)
    #gz_count    = number of .gz files
gz_count=$(find "$TARGET" -type f -name "*.gz" | wc -l)
    #sh_count    = number of .sh files
sh_count=$(find "$TARGET" -type f -name "*.sh" | wc -l)

#print formatted report with all values
echo "============================================"
echo "  FILESYSTEM REPORT: $TARGET"
echo "  Generated: $(date '+%Y-%m-%d %H:%M:%S')"
echo "============================================"
printf "  %-20s %s\n" "Total files:"    "$file_count"
printf "  %-20s %s\n" "Total dirs:"     "$dir_count"
printf "  %-20s %s — %s\n" "Largest file:" "$largest_display" "$largest_name"
printf "  %-20s %s\n" "Most recent:"    "$recent"
printf "  %-20s %s\n" ".log files:"     "$log_count"
printf "  %-20s %s\n" ".gz files:"      "$gz_count"
printf "  %-20s %s\n" ".sh files:"      "$sh_count"
echo "============================================"