# define get_instance_id()
def get_instance_id():
#   prompt "Instance ID: "
    instance = input("Instance ID: ")
    return instance.strip()
#   strip whitespace
#   return it (keep original casing — no lowercase)

# define get_region()
def get_region():
#   prompt "Region: "
    region = input("Region: ")
    return region.strip().lower()
# strip and lowercase
#   return it

# define get_port()
def get_port():
#   prompt "Port: "
    port = input("Port: ")
    return int(port)
#   convert to integer
#   return it

# define get_cpu_limit()
def get_cpu():
#   prompt "CPU limit %: "
    cpu_limit = input("CPU Limit: ")
    return float(cpu_limit)
#   convert to float
#   return it

# define build_summary(instance, region, port, cpu_limit)
def build_summary(instance, region, port, cpu_limit):
#   return "[instance] | [region] | port [port] | cpu limit [cpu_limit:.1f]%"
    return f"[BUILD SUMMARY]: {instance} | {region} | port {port} | cpu limit {cpu_limit:.1f}%"

# define main()
def main():
#   get all four values
    instance = get_instance_id()
    region = get_region()
    port = get_port()
    cpu_limit = get_cpu()
#   build summary
    build_summary(instance, region, port, cpu_limit)
#   print it
    print(build_summary(instance, region, port, cpu_limit))
# call main
main()