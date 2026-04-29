# global constant: DEFAULT_REGION = "us-east-1"
DEFAULT_REGION = "us-east-1"
# global variable: request_count = 0
request_count = 0

# define describe_region()
def describe_region():
#   print "Default region: [DEFAULT_REGION]"
    print(f"Default region: {DEFAULT_REGION}")
#   (reads the global — no keyword needed)

# define log_request(endpoint)
def log_request(endpoint):
#   declare global request_count so we can modify it
    global request_count
#   increment request_count by 1
    request_count += 1
#   print "[request_count] GET [endpoint]"
    print(f"{request_count} GET {endpoint}")

# define main()
def main():
#   call describe_region()
    describe_region()
#   call log_request("/api/instances")
    log_request("/api/instances")
#   call log_request("/api/status")
    log_request("/api/status")
#   call log_request("/api/logs")
    log_request("api/logs")

#   print "Total requests: [request_count]"
    print(f"Total requests: {request_count}")
# call main
main()