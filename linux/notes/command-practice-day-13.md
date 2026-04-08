# Day 13 — Linux Notes
Date: 4/7/26
Source: SRE Command Trainer — Command Line + Text-Fu session
Score: 89% (34/38) | Duration: 94:30 | Attempts: 52 | Retried: 8

Command Line: 22/22 — perfect
Text-Fu: 12/16 — four skipped, eight retried

## What I Did
Full session covering both Command Line and Text-Fu cards. First perfect
score on Command Line — 22 for 22 with no skips. Text-Fu still has gaps
but the retried cards are getting answered correctly, just not on the
first attempt. Progress is clear across both tracks.

## Command Line — 22/22 Perfect
First clean sweep on Command Line. Every card answered correctly including
the ones that have needed retries in previous sessions. The pathing
discipline and flag combinations are becoming automatic.

Cards that still needed retries:

cp nginx.conf nginx.conf.$(date +%Y%m%d) — 2 retries
Timestamped backup. The command substitution syntax $(date +%Y%m%d) still
not firing automatically. The $ before the parentheses is what makes it
execute — without it the shell treats it as a literal string.

mkdir -p /var/log/app/errors — 1 retry
Create nested directory path in one command. -p creates all parent
directories that do not exist yet. Without -p, mkdir fails if any
intermediate directory is missing.

cat nginx.conf — 1 retry
Print file contents to screen. Simple command, hesitation likely from
the prompt wording "get on screen to inspect" rather than the command
itself.

## Text-Fu — 12/16

Cards that needed retries:

sort ips.txt | uniq -c — 1 retry
Count occurrences of each unique line. sort groups identical lines first,
uniq -c counts them. The -c flag on uniq is what adds the count. Without
sort first, non-consecutive duplicates get counted separately.

cut -d' ' -f1 access.log — 1 retry
Extract the first field using space as delimiter. -d sets the delimiter,
-f sets which field. cut is the lighter option vs awk when only one field
is needed from a structured file.

grep 'ERROR' payment.log | tail -10 — 2 retries
Last 10 error entries. grep filters first, tail -10 takes the last ten
results. Order matters — grep then tail, not the other way around.

grep 'ERROR' app.log > /tmp/errors.txt — 1 retry
Redirect grep output to a file. > writes stdout to the file, replacing
any existing contents. >> would append instead. Used > here to create
a clean errors file.

sort ips.txt | uniq — 3 retries
Unique list from a file. sort first to group duplicates, uniq to remove
them. Kept attempting uniq alone without the sort pipe first.

## Cards Flagged for Strengthening

grep -r 'ERROR' /var/log/ — flagged for single vs double quotes
Typed grep -r "ERROR" /var/log/ with double quotes instead of single
quotes. Functionally identical in most cases but the expected answer uses
single quotes. Worth matching exactly — in some shell contexts double
quotes allow variable expansion where single quotes do not. Single quotes
are safer for literal string matching in grep.

grep ' 500 ' access.log | awk '{print $1}' | sort | uniq -c | sort -rn | head -5
Skipped. Full pipeline for finding top IPs hitting 500 errors. Need to
build this from memory: grep filters status code lines, awk extracts IP,
sort groups, uniq -c counts, sort -rn ranks by count descending, head -5
takes the top five.

sort -n sizes.txt — skipped
Numeric sort. Without -n the sort is alphabetical so 10 comes before 9.
-n sorts by actual numeric value.

find /tmp -name '*.log' | xargs rm — skipped
Find files matching a pattern and delete them all. xargs takes the piped
output and passes each result as an argument to rm. Single quotes around
*.log required so the shell does not expand the wildcard before find runs.

## What Is Improving
Command Line is clean. Every card including previously difficult ones like
tail -f and find -mtime is now answering correctly. The absolute path
habit is sticking.

Text-Fu gaps are specific — the pipeline commands and xargs are the ones
still being skipped. The simpler grep and sort combinations are landing
on retry if not first attempt.

## Commands Still Not Automatic
sort | uniq vs sort | uniq -c — know the difference cold
$(date +%Y%m%d) — command substitution, $ before parentheses required
mkdir -p — for nested paths, -p is required
The 500-error pipeline — need to build it from scratch without looking
find | xargs rm — pattern for batch file deletion
sort -n — numeric sort, not alphabetical

## Cloud Connection
Cloud connection: The 500-error pipeline is a real production diagnostic.
When an alert fires for elevated error rates on an EC2 instance, that
exact sequence — grep for status code, awk for IP, sort, uniq -c, sort
-rn, head -5 — identifies the top offending IPs in seconds from the access
log before any dashboard is even opened. grep 'ERROR' app.log >
/tmp/errors.txt captures the error snapshot during an active incident so
there is a record even if the log rotates. find /tmp -name '*.log' |
xargs rm is how temp log files get cleaned up on a schedule via cron.
mkdir -p is in every infrastructure setup script that creates directory
structures for new services. These are not practice commands. They are
the actual toolkit.