# ============================================================
# Script:       cost_calc.sh
# Track:        Linux / Bash
# Week:         Week 1 | 14-Day Challenge
# Challenge:    14-Day Bash Scripting Challenge
# ============================================================
# What it does:
#   Calculates a monthly infrastructure cost estimate from server
#   count, per-server cost, storage volume, per-TB cost, and a
#   support fee. Outputs a formatted cost breakdown report.
#
# DevOps context:
#   Infrastructure cost calculator for pre-provisioning decisions.
#   Produces a line-item breakdown before committing to a resource
#   configuration. Maps to FinOps cost estimation before a sprint.
#
# Real scenario:
#   Engineer runs this before a quarterly infrastructure review
#   to produce a cost breakdown that justifies or challenges the
#   current resource allocation.
# ============================================================
# ============================================================
# Script:       cost_calc.sh
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

SERVERS=4
COST_PER_SERVER=120
STORAGE_TB=10
COST_PER_TB=25
SUPPORT_FEE=200

SERVER_TOTAL=$(( SERVERS * COST_PER_SERVER ))
STORAGE_TOTAL=$(( STORAGE_TB * COST_PER_TB ))
SUBTOTAL=$(( SERVER_TOTAL + STORAGE_TOTAL ))
GRAND_TOTAL=$(( SUBTOTAL + SUPPORT_FEE ))

echo "=== Monthly Cost Estimate ==="
echo "Serves (4 x \$120):        \$$SERVER_TOTAL"
echo "Storage (10TB x \$25):     \$$STORAGE_TOTAL"
echo "Subtotal:                 \$$SUBTOTAL"
echo "Support Fee:              \$$SUPPORT_FEE"
echo "---"
echo "Grand Total:              \$$GRAND_TOTAL"
echo "============================="
