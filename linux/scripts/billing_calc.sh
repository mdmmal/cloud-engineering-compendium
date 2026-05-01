#!/bin/bash

INSTANCES=6
HOURLY_RATE=2
HOURS_PER_DAY=24
DAYS_IN_MONTH=30
DISCOUNT_PCT=10

DAILY_COST=$(( $INSTANCES * $HOURLY_RATE * $HOURS_PER_DAY))
MONTHLY_COST=$(( $DAILY_COST * $DAYS_IN_MONTH))
DISCOUNT_AMT=$(( $MONTHLY_COST * $DISCOUNT_PCT / 100 ))
FINAL_COST=$(( $MONTHLY_COST - $DISCOUNT_AMT ))

echo "=== Cloud Billing Summary ==="
echo "Instances:          \$$INSTANCES"
echo "Hourly Rate:        \$$HOURLY_RATE"
echo "Daily Cost:         \$$DAILY_COST"
echo "Monthly Cost:       \$$MONTHLY_COST"
echo "Discount (10%):     \$$DISCOUNT_AMT"
echo "Final Cost:         \$$FINAL_COST"
echo "============================="