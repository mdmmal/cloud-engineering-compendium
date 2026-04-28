#!/bin/bash

#preflight validation script that check for values and reports

DEPLOY_DEV="production"
BUILD_ID=$(date +%Y%m%d-%H%M%S)

echo "=== Pre-Flight Check ==="
echo "Deploy Enviorment:  $DEPLOY_DEV"
echo "Build ID:           $BUILD_ID"
echo "Home Directory:     $HOME"
echo "========================"
