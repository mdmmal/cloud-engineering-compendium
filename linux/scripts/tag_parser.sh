#!/bin/bash

DEPLOY_TAG="v3.1.0-staging-eu-west-1"

echo "=== Tag Parser ==="
echo "Full Tag:     ${DEPLOY_TAG[@]}"
echo "Length:       ${#DEPLOY_TAG}"
echo "Version:      ${DEPLOY_TAG:0:6}"
echo "Region:       ${DEPLOY_TAG:15:22}"
echo "Prod tag:     ${DEPLOY_TAG/staging/production}"
echo "Dot format:   ${DEPLOY_TAG//-/.}"
echo "Uppercase V:  ${DEPLOY_TAG/#v/V}"
echo "=================="