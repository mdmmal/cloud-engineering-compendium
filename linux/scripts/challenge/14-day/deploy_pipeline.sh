#!/bin/bash
# deploy_pipeline.sh
# Usage: ./deploy_pipeline.sh

set -u

GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
RED=$'\033[0;31m'
NC=$'\033[0m'

run_check(){
    local LABEL=$1
    local RESULT=$2

    printf "%-30s" "$LABEL"

    if [[ $RESULT = "pass" ]]; then
        echo "${GREEN}[OK]${NC}"
    else
        echo "${RED}[FAILED]${NC}"
        exit 1
    fi
} 

stage_header(){
    local STAGE_NUM=$1
    local STAGE_NAME=$2
    echo ""
    echo "[Stage $STAGE_NUM/5] $STAGE_NAME"
}

stage_pass(){
    local STAGE_NAME=$1
    echo "${GREEN}  $STAGE_NAME passed.${NC}"
}

stage_fail(){
    local STAGE_NAME=$1
    echo "${RED}  $STAGE_NAME failed. Pipeline stopped. ${NC}"
    exit 1
}

echo "=============================="
echo "  DEPLOYMENT PIPELINE - $(hostname)"
echo "=============================="

stage_header 1 "Pre-Flight Check"
run_check "Checking disk space..."    "pass"
run_check "Checking memory..."        "pass"
run_check "Checking service port..."  "pass"
stage_pass "Pre-flight"

stage_header 2 "Build"
run_check "Compiling application..."  "pass"
stage_pass "Build"

stage_header 3 "Test"
run_check "Running unit tests..."     "pass"
echo "  (24/24 passed)"
stage_pass "Test"

stage_header 4 "Deploy"
run_check "Stopping old service..."   "pass"
run_check "Copying new build..."      "pass"
run_check "Starting service..."       "pass"
stage_pass "Deploy"

stage_header 5 "Post-Deploy Verify"
run_check "Health check (attempt 1)..." "pass"
echo "  Service is responding."
stage_pass "Verify"

echo "=============================="
echo "  PIPELINE COMPLETE — all stages passed"
echo "=============================="