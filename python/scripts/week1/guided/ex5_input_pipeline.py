# define get_host()
def get_host():
#   prompt "Host: "
    host = input("Host: ")
    return host.strip().lower()
#   strip whitespace and lowercase the result

#   return it

# define get_port()
def get_port():
    port = input("Port: ")
    return int(port)
#   prompt "Port: "
#   convert to integer
#   return it

# define get_threshold()
def get_threshold():
    thres = input("CPU threshold %: ")
    return float(thres)


# define build_config(host, port, threshold)
def build_config(host, port, threshold):  
#   return "Monitoring [host]:[port] | Alert above [threshold]%"
    return f"Monitoring {host}:{port} | Alert above {threshold}%"

# define main()
def main():
#   store return value of get_host()
    host = get_host()
#   store return value of get_port()
    port = get_port()
#   store return value of get_threshold()
    threshold = get_threshold()
#   store return value of build_config()
    config = build_config(host, port, threshold)
#   print the config
    print(config)

# call main
main()