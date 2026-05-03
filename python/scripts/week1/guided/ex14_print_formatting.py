# store server = "web-01", status = "RUNNING", region = "us-east-1", cpu = 87.666
import time

server = "web-01"
status = "RUNNING"
region = "us-east-1"
cpu = 87.666

# line 1: print server, status, region on one line separated by " → " using sep
print(server, status, region, sep=' → ' )
# line 2: print "Checking status..." with no newline, then print "OK" on the same line
print("Checking status...", end=" ")
time.sleep(2)
print("OK")
# line 3: print cpu rounded to 2 decimal places with a % sign
print(f"CPU Load: {cpu:.2f}%")
# line 4: print a divider: "---" using print() — just a plain string
print("---")
# line 5: print all three string vars again, this time separated by " | " using sep
print(server, status, region, sep=' | ' )