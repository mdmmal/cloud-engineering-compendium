# global: alert_log = []   (an empty list — stores all alert messages)
alert_log = []
# global: alert_count = 0  (counter)
alert_count = 0 

# define clean_message(raw)
def clean_message(raw):
#   strip and title-case the message
#   return it
    message = raw.strip().title()
    return message


# define create_alert(level, server, message)
def create_alert(level, server, message):
#   clean the message first
    cleaned = clean_message(message)
#   return "[LEVEL] [server]: [cleaned_message]"
#   (level should be uppercased)
    new_alert = f"[{level.upper()}] {server}: {cleaned}"
    return new_alert

# define fire_alert(level, server, message)
def fire_alert(level, server, message):
#   declare global alert_count and alert_log
    global alert_log
    global alert_count
#   increment alert_count
    alert_count += 1
#   create the alert string
    alert_string = create_alert(level, server, message)
#   append it to alert_log
    alert_log.append(alert_string)
#   print the alert string
    print(alert_string)

# define print_summary()
def print_summary():
#   print "--- Alert Summary ---"
    print("--- Alert Summary ---")
#   print "Total: [alert_count]"
    print(f"Total: {alert_count}")
    print("\n".join(alert_log))
#   join alert_log with "\n" and print it
   

# define main()
def main():
#   fire_alert("warning", "web-01", "  high cpu usage  ")
    fire_alert("warning", "web-01", " high cpu usage ")
#   fire_alert("critical", "db-01", "  disk full  ")
    fire_alert("critical", "db-01", "  disk full  ")
#   fire_alert("info", "cache-01", "  cache cleared  ")
    fire_alert("info", "cache-01", "  cache cleared  ")   
#   print_summary()
    print_summary()

# call main
main()