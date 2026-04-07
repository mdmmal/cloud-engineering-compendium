# Day 12 — Linux Notes
Date: 4/6/26
Source: SRE Command Trainer — Command Line flashcard session
Score: 95% (21/22) | Duration: 19:35 | Cards: 22 | Retried: 5

## What I Did
Command line flashcard session. 29 attempts across 22 cards. One skipped,
five retried before correct. Consistent 95% from last session — same score,
fewer retries, shorter duration. Improvement is there but a few commands
still not automatic.

## Cards That Needed Multiple Attempts

find /etc -type f — 1 retry
Prompt said /var/log, answer used /etc. The important part is -type f
filtering to regular files only. The path mismatch between prompt wording
and expected answer keeps causing hesitation here.

cp -r /var/www/app /var/www/app.bak — 1 retry
Recursive directory copy. -r is required any time the source is a
directory. Forgetting -r on a directory copy either fails or copies
nothing depending on the system.

mkdir /var/log/app — 2 retries
Create a directory so a service can write logs to it. Straightforward
command but took two attempts — likely typed the wrong path first.
mkdir requires the full path when creating outside the current directory.

cp nginx.conf nginx.conf.$(date +%Y%m%d) — 1 retry
Timestamped backup using command substitution. Same card from last session,
still not automatic. The $ before the parentheses is what makes it command
substitution — without it the shell treats it as a literal string.

ls -la — 1 retry
Full directory listing with hidden files, permissions, and owners. -l for
long format, -a for all including hidden. Both flags needed together.

## The One That Keeps Coming Back

head -20 /var/log/syslog — flagged for strengthening
Typed head less syslog. Two problems in one: used less instead of the -20
flag, and used a relative filename instead of the absolute path. head -20
reads the first 20 lines of a file. less is an entirely different command
that opens an interactive pager. The -20 flag is the number of lines,
not a separate command.

This is the same absolute path issue as tail -f from the last two sessions.
Commands that target log files need full absolute paths. /var/log/syslog
not just syslog.

## Commands Still Not Automatic
head -N — reads first N lines of a file, N is the flag not a separate word
head vs less — head prints lines and exits, less opens interactive pager
cp -r — required for directories, easy to forget under pressure
$(date +%Y%m%d) — command substitution for timestamped filenames
Absolute paths on all log file commands — /var/log/filename every time

## Cloud Connection
Cloud connection: mkdir /var/log/app is exactly what runs in a User Data
script when an EC2 instance launches a new service — the log directory
has to exist before the service starts or it fails silently. head -20
/var/log/syslog is the first command run when SSHing into an instance to
quickly check recent system activity without opening the full log. cp with
a timestamped backup before editing a config file is standard pre-change
procedure on any live server. These are not drills. This is the actual
sequence of commands used during instance setup and incident response.Date: 4/6/26
Source: SRE Command Trainer — Text-Fu flashcard session
Score: 44% (7/16) | Duration: 30:49 | Cards: 16 | Retried: 4 | Skipped: 9

## What I Did
Text-Fu flashcard session — text processing commands used in real SRE work.
grep, awk, sed, sort, uniq, cut, tee, xargs. 44% is a honest score for
commands that are genuinely new. Nine skipped means nine cards where the
command was not familiar enough to attempt. That is the gap to close.

## Cards That Needed Multiple Attempts

awk '{print }' access.log | sort -u | wc -l — 1 retry
Get total unique IP count from a log. Three commands piped together:
awk pulls the first field (IP address) from each line, sort -u sorts and
removes duplicates, wc -l counts the remaining lines. Each piece is simple
but combining them in the right order takes practice.

grep -r 'ERROR' /var/log/ — 2 retries
Recursive grep through a directory. -r makes grep search all files inside
the directory, not just a single file. Forgot -r on first attempts.

grep 'ERROR' payment.log | tail -10 — 2 retries
Most recent 10 ERROR entries. grep filters the lines, tail -10 takes the
last 10 of whatever grep returned. Order matters — grep first, tail second.

sort ips.txt | uniq — 1 retry
Get unique items from a list. uniq only removes consecutive duplicates so
sort must run first to group identical lines together. uniq alone on an
unsorted file misses non-consecutive duplicates.

## Cards Flagged for Strengthening

sort ips.txt | uniq -c
Typed uniq -c results.txt directly. Two problems: wrong filename, and
skipped the sort pipe. uniq -c counts occurrences of each unique line.
Still needs sort first or it undercounts. And the pipe is required —
uniq reads from stdin when piped, not directly from a file in this pattern.

sed -i 's/db-old.internal/db-new.internal/g' config.yml
Typed the sed command but closed the substitution early — missing the
closing single quote and the g flag and the filename. The full syntax is:
sed -i 's/old/new/g' filename
-i edits the file in place. s/old/new/ is the substitution. g applies it
to every match on the line, not just the first. All three parts required.

find /tmp -name '*.log' | xargs rm
Typed xargs rn instead of xargs rm. Typo but worth noting — xargs takes
output from the left side of the pipe and passes it as arguments to the
command on the right. find locates the files, xargs rm deletes them all.
rn is not a command.

## Cards Skipped — Need to Learn These

cut -d' ' -f1 access.log
Cuts the first field from each line using space as delimiter. -d sets the
delimiter, -f sets which field to extract. cut is the lighter alternative
to awk for simple field extraction.

grep 'ERROR' app.log | tee /tmp/errors.txt
tee reads from stdin and writes to both stdout and a file simultaneously.
grep finds the errors, tee saves them to a file while still printing to
screen. Useful when output needs to be both reviewed and saved.

grep ' 500 ' access.log | awk '{print }' | sort | uniq -c | sort -rn | head -5
Find top 5 IPs hitting 500 errors. Full pipeline: grep filters 500 status
lines, awk pulls the IP, sort groups them, uniq -c counts each, sort -rn
sorts by count descending, head -5 takes the top five. This is a real
production command for identifying sources of server errors.

sort -n sizes.txt
Numeric sort. Default sort is alphabetical so 10 comes before 9. -n sorts
by actual number value. Required any time the column being sorted contains
numbers.

grep -in 'timeout' app.log
Case-insensitive search with line numbers. -i ignores case so TIMEOUT,
Timeout, and timeout all match. -n prints the line number alongside each
match. Both flags useful when scanning logs manually.

## Key Concepts From This Session

Pipes chain commands — output of left becomes input of right. Order is
always: filter → transform → count → sort → limit.

sort before uniq — uniq only removes consecutive duplicates. Without sort
first, non-consecutive duplicates survive.

sed syntax: sed -i 's/old/new/g' filename
-i = in place, s = substitute, g = global (all matches per line).
Missing any part gives wrong results or a syntax error.

xargs — takes piped input and passes it as arguments to another command.
find | xargs rm is how multiple files get deleted from a find result.

grep flags to know cold:
-r recursive through directories
-i case insensitive
-n show line numbers
-in both together

## Cloud Connection
Cloud connection: Every command in this session is a real SRE log analysis
tool. grep -r 'ERROR' /var/log/ is the first command run after an alert
fires on an EC2 instance. The 500-error pipeline is exactly how the source
of a production incident gets identified from access logs before CloudWatch
dashboards are even checked. sed -i for in-place config edits is how
database hostnames get swapped during a migration without opening a text
editor. tee is how log output gets captured to a file during a live
incident so there is a record of what was seen. These commands are not
supplementary — they are the primary toolkit for working inside a running
Linux system.
