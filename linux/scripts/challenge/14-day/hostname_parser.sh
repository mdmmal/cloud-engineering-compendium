# ============================================================
# Script:       hostname_parser.sh
# Track:        Linux / Bash
# Week:         Week 1 | 14-Day Challenge
# Challenge:    14-Day Bash Scripting Challenge
# ============================================================
# What it does:
#   Takes a structured hostname string and extracts components
#   including environment prefix, region suffix, and length.
#   Demonstrates staging version replacement and format conversion.
#
# DevOps context:
#   Fleet identification and hostname normalization. In multi-region
#   deployments, server names encode environment and region. Parsing
#   them programmatically drives automated routing and tagging.
#
# Real scenario:
#   Automation script parses a fleet of hostnames to identify
#   which servers belong to production vs staging before applying
#   a configuration change to the correct group only.
# ============================================================
# ============================================================
# Script:       hostname_parser.sh
# Track:        Linux / Bash
# Week:         Week 1 | 14-Day Challenge
# Challenge:    14-Day Bash Scripting Challenge
# ============================================================
# What it does:
#   [2-3 sentences. Plain language. What happens when you run it.]
#
# DevOps context:
#   [Where this shows up in real DevOps work.
#    What production scenario this maps to.]
#
# Real scenario:
#   [One sentence. The actual situation.]
# ============================================================
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
