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
sequence of commands used during instance setup and incident response.