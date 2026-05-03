def clean_entry(raw):
    return raw.strip().upper()

def main():
    raw = input("Enter log entry: ")
    new_entry = clean_entry(raw)
    fields = new_entry.split(": ")
    print(f"Cleaned: {new_entry}")
    for field in fields:
        print(field)

main()