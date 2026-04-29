# define clean(raw)
def clean(raw):
#   strip whitespace from both ends
    return raw.strip().lower()
#   lowercase

#   return result


# define parse_tags(tag_string)
def parse_tags(tag_string):
#   split on ", " (comma then space)
    return tag_string.split(", ")
#   return the list


# define rebuild(tags)
def rebuild(tags):
#   join the list with " | "
    return " | ".join(tags)
#   return the result string


# define main()
def main():
#   raw = "  Prod, EC2, Web-Tier, us-east-1  "
    raw = "  Prod, EC2, Web-Tier, us-east-1  "
#   cleaned = clean(raw)
    cleaned = clean(raw)
#   tags = parse_tags(cleaned)
    tags = parse_tags(cleaned)
#   result = rebuild(tags)
    result = rebuild(tags)
#   print "Tags: [result]"
    print(f"Tags: {result}")


# call main
main()