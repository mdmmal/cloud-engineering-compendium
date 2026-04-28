#End point bulder tha3t returns values cahin functions

def get_enviorment():
    return input("Enviorment(staging/prod): ").strip().lower()
    
def build_url(env):
    return f"https://api.{env}.company.com"

def main():
    env = get_enviorment()
    url = build_url(env)
    print(f"Connecting to: {url}")

main ()
