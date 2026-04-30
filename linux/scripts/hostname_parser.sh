#!/bin/bash

HOSTNAME="prod-web-01-us-east"

echo "=== Hostname Parser ==="
echo " Full hostname:       $HOSTNAME"
echo "Length:               ${#HOSTNAME}"
echo "Environment:          ${HOSTNAME:0:4}"
echo "Environment:          ${HOSTNAME:12:19}"
echo "Staging version:      ${HOSTNAME/#prod/staging}"
echo "Underscore format:    ${HOSTNAME//-/_}"
echo "======================"
