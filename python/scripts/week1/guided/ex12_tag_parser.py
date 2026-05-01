# define parse_tags(raw_tags)
def parse_tags(raw_tags):
#   raw_tags comes in as "env=prod,service=api,region=us-east-1"
#   split on "," to get a list of "key=value" strings
    tag_list = raw_tags.split(",")
#   return the list
    return tag_list

# define format_tag(tag_pair)
def format_tag(tag_pair):
#   receives one "key=value" string like "env=prod"
#   replace the "=" with ": "
    formatted = tag_pair.replace("=", ": ")   
#   return the formatted string
    return formatted

# define build_report(tag_list)
def build_report(tag_list):
#   join the list with "\n" (newline) so each tag is on its own line
    report = "\n".join(tag_list)
#   return the result
    return report

# define main()
def main():
#   hardcode raw = "env=prod,service=api-gateway,region=us-east-1,team=platform"
    raw = "env=prod,service=api-gateway,region=us-east-1,team=platform"
#   parse into a list
    tags = parse_tags(raw)
#   format each tag in the list (loop through it)
    formatted_list = []
#   build the report from the formatted list
    for tag in tags:
        formatted_list.append(format_tag(tag))

# build the report (THIS WAS MISSING)
    report = build_report(formatted_list)

#   print "--- Tag Report ---"
    print("--- Tag Report ---")
#   print the report
    print(report)
# call main
main()