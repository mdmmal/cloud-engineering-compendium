REGION = "us-east-1"

def deploy(service, environment):
    print(f"Deploying {service} to {environment} in {REGION}")

def main():
    deploy("api-gateway", "staging")
    deploy("lambda-processor", "production")

main()