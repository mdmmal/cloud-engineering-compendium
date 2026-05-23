jamal@home-lab:~/bash-lab$ cat log_analyzer_v1.sh

#!/bin/bash

#HEADER
echo "======================================================"
echo "SCRIPT: log_analyzer_v2.sh"
echo "PURPOSE: Script that finds log files and scans them for error tags."
echo "USAGE: ./log_analyzer_v2.sh"
echo "======================================================"

#SECTION 1-Configuration
LOG_DIR=${1:-$HOME/bash-lab/logs}
TAGS=("ERROR" "CRITICAL" "FATAL")
REPORT_FILE="$HOME/bash-lab/log_analysis_report.txt"

#SECTION 2 Functions


#SECTION 3 Validation
#if [[ ! -f "$LOG_FILE"  ]]; then
#	echo "[ERROR] Log file not found: $LOG_FILE"
#	exit 1
#fi

if [[ ! -d "$LOG_DIR"  ]]; then 
	echo "[ERROR] Log directory not found: $LOG_DIR"
	exit 1
fi

#SECTION 4 Main Logic

#Reset report file with each run
> "$REPORT_FILE"

echo "[INFO] Log directory: $LOG_DIR" | tee -a "$REPORT_FILE"
echo "[INFO] Report will be saved to: $REPORT_FILE" | tee -a "$REPORT_FILE"
echo "================================================" | tee -a "$REPORT_FILE"

#Iteration over every file
for file in $(find "$LOG_DIR" -name "*.log" -mtime -1); do
	echo "" | tee -a "$REPORT_FILE"
	echo "File: $file" | tee -a "$REPORT_FILE"

	for tag in "${TAGS[@]}"; do
		count=$(grep -c "$tag" "$file")
		printf " %-10s count: %s\n" "$tag" "$count" | tee -a "$REPORT_FILE"
	done
done

#Completion Message
echo "" | tee -a "$REPORT_FILE"
echo "================================================" | tee -a "$REPORT_FILE"
echo "[INFO] Analysis complete. Report saved: $REPORT_FILE" | tee -a "$REPORT_FILE"
exit 0

#SECTION 5 Report/ Cleanup
#

