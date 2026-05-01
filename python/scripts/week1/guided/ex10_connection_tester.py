# define make_connection_string(host, port, protocol)
def make_connection_string(host, port, protocol):
#   return "[protocol]://[host]:[port]"
    return f"{protocol}://{host}:{port}"
# define log_attempt(connection_string, attempt_number)
def log_attempt(connection_string, attempt_number):
#   return "Attempt [attempt_number]: connecting to [connection_string]"
    return f"Attempt {attempt_number}: connecting to {connection_string}"
# define main()
def main():
#   build connection string for "db.internal", port 5432, protocol "postgresql"
    db_conn = make_connection_string("db.internal", 5432, "postgresql")
#   build connection string for "cache.internal", port 6379, protocol "redis"
    cache_conn = make_connection_string("cache.internal", 6379, "redis")
#   build connection string for "api.internal", port 443, protocol "https"
    api_conn = make_connection_string("api.internal", 443, "https")
#   log and print attempt 1 for db
    db_log = log_attempt(db_conn, 1)
    print(db_log)
#   log and print attempt 2 for cache
    cache_log = log_attempt(cache_conn, 2)
    print(cache_log)
#   log and print attempt 3 for api
    api_log = log_attempt(api_conn, 3)
    print(api_log)
# call main
main()