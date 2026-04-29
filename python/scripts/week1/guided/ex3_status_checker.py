# define check_status(server, status, region)
#   print "[status] | [server] is online in [region]"
def check_status(server, status, region="us-east-1"):
    print(f"{status} | {server} is online in {region}")


# define main()
#   check "web-01", "RUNNING", "us-east-1"
#   check "db-01", "STOPPED", "us-west-2"
#   check "cache-01", "RUNNING", "eu-west-1"
def main():
    check_status("web-01", "RUNNING")
    check_status("db-01", "STOPPED", "us-west-2")
    check_status("cache-01", "RUNNING", "eu-west-1")


# call main
main()