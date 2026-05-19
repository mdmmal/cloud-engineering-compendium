#!/bin/bash

echo "========================================"
echo "=============5 QUESTIONS.==============="
echo "========================================"

echo "How many ERRORs in application.log? $(grep -c "ERROR" logs/application.log)"
echo "How many CRITICALs in system.log? $(grep -c "CRITICAL" logs/system.log)"
echo "How many .log files does find return? $(find logs/ -name "*.log"|wc -l)"
echo "Find log files modified in last 24 hours. $(find logs/ -name "*.log" -mtime -1)"

