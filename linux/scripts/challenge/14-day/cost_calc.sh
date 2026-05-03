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
