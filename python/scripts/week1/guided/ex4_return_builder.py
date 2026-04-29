# define get_service() — returns the string "ec2" (does NOT print it)
def get_service():
    return "ec2"
# define get_region() — returns the string "us-east-1" (does NOT print it)
def get_region():
    return "us-east-1"
# define build_label(service, region) — returns "[service] in [region]"
def build_label(service, region):
    return f"{service} in {region}"

# define main()
def main():
#   store return value of get_service() in a variable called service
    service = get_service()
#   store return value of get_region() in a variable called region
    region = get_region()
#   store return value of build_label(service, region) in a variable called label
    label = build_label(service, region)
#   print label
    print(label)
# call main
main()
