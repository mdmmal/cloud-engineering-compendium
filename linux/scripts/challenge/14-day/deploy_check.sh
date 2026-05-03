#!/bin/bash

#This script displays the basic system context to the terminal


echo "=== Deployment Check ==="
echo "Host: $(hostname)"
echo "User: $(whoami)"
echo "Date: $(date)"
#Print current working directory and the working shell
echo "Workinf dir: $PWD"
echo "Shell: $SHELL"
echo "========================"
