# define a function called ping that takes a host as input
def ping(host):
    print(f"Pinging: {host}")
#   print "Pinging: [host]"

# define the main function
def main():
    ping("8.8.8.8")
    ping("10.0.0.1")
    ping("192.169.1.1")
#   call ping with "8.8.8.8"
#   call ping with "10.0.0.1"
#   call ping with "192.168.1.1"

# call main
main()