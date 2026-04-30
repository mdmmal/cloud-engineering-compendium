#!/bin/bash

current_user=$(whoami)
hostname=$HOSTNAME
time=$(date)
working_dir=$(pwd)
home_dir=$HOME

echo "=== Provisioning Started ==="
echo "Run by:   $current_user"
echo "Host:     $hostname"
echo "Time:     $time"
echo "CWD:      $working_dir"
echo "home:     $home_dir"
echo "============================"