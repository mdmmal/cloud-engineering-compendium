def check_status(server):
    print(f"{server} is online")

def main():
    check_status("web-01")
    check_status("db-01")
    check_status("cache-01")

main()