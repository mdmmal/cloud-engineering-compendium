
#!/bin/bash

####################################################################################################
####################################################################################################
#What is INPUT?
##ALL log files from find command in the directory path

#What is OUTPUT
##Terminal text peer file per tag counts

#What can go WRONG?
##directory missing, no log files, wrong argument type

#What REPEATS?
##Parsing thprugh each file in the directory(Outter loops). Parsing through each tag(inner loop)

#What DECIDES?
##count only
####################################################################################################
####################################################################################################

#HEADER
echo "======================================================"
echo "SCRIPT: log_analyzer_v1.sh"
echo "PURPOSE: Script that finds log files and scans them for error tags."
echo "USAGE: ./log_analyzer_v1.sh"
echo "======================================================"

#SECTION 1
LOG_DIR="$HOME/bash-lab/logs"
TAGS=("ERROR" "CRITICAL" "FATAL")

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
for file in $(find "$LOG_DIR" -name "*.log" -mtime -1); do
	echo ""
	echo "File: $file"

	for tag in "${TAGS[@]}"; do
		count=$(grep -c "$tag" "$file")
		printf " %-10s count: %s\n" "$tag" "$count"
	done
done

echo ""
echo "Analysis complete."
#SECTION 5 Report/ Cleanup
#
#
