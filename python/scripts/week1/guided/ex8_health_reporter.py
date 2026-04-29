# global constant: DEFAULT_REGION = "us-east-1"
DEFAULT_REGION = "us-east-1"

# define get_server()
def get_server():
#   prompt "Server name: "
    name = input("Server: ")
#   strip and lowercase
    return name.strip().lower()
#   return it

# define get_cpu()
def get_cpu():
#   prompt "CPU %: "
    cpu_val = float(input("CPU %: "))
#   convert to float
    return cpu_val
#   return it

# define get_memory()
def get_memory():
#   prompt "Memory %: "
    memory = float(input("Memory %: "))
#   convert to float
    return memory
#   return it

# define evaluate(cpu, memory)
def evaluate(cpu, memory):
#   if cpu > 90: return "CRITICAL"
    if cpu > 90:
        return "CRITICAL"
#   if memory > 90: return "CRITICAL"
    if memory > 90:
        return "CRITICAL"
#   if cpu > 75: return "WARNING"
    if cpu > 75:
        return "WARNING"
#   if memory > 75: return "WARNING"
    if memory > 75:
        return "WARNING"
#   return "HEALTHY"   
    return "HEALTHY"


# define format_report(server, cpu, memory, health)
def format_reporter(server, cpu, memory, health):
#   return "[server] | CPU: [cpu:.1f]% | MEM: [memory:.1f]% | [health] | [DEFAULT_REGION]"
    return f"{server} | CPU: {cpu:.1f}% | MEM: {memory:.1f}% | {health} | {DEFAULT_REGION}"
#   DEFAULT_REGION is a global — readable without the global keyword

# define main()
def main():
#   get server name
    name = get_server()
#   get cpu
    cpu_val = get_cpu()
#   get memory
    memory = get_memory()
#   evaluate health
    status = evaluate(cpu_val, memory)
#   format the report
    final_string = format_reporter(name, cpu_val, memory, status)
#   print it
    print(final_string)
# call main
main()