# Day 11 — Linux Notes (continued)
Date: 4/5/26
Source: SRE Command Trainer — Command Line flashcard session
Score: 95% (21/22) | Duration: 31:08 | Cards: 22 | Retried: 7

## What I Did
Command line flashcard session drilling SRE-relevant commands from memory.
39 attempts across 22 cards. One skipped, seven retried before correct.
Strong session overall but the same tail -f pathing error from last session
showed up again.

## Cards That Needed Multiple Attempts

cp nginx.conf nginx.conf.bak — 1 retry
Backup before proceeding. The naming convention is the thing — .bak suffix
on the original filename. Simple command, just not automatic yet.

find /etc -type f — 4 retries
Prompt said list every plain file under /var/log but the answer used /etc.
The -type f flag is what matters here — filters results to regular files
only, excluding directories and symlinks. Got tripped up on the path
mismatch between the prompt wording and the expected answer.

find /var/log -mtime -1 — 3 retries
Files modified in the last 24 hours. -mtime -1 means modified less than
1 day ago. The minus sign before the 1 is what makes it "within the last"
rather than "exactly 1 day ago." Kept getting the flag wrong.

wc -l app.log — 2 retries
Line count. Still mixing up -l and -c under pressure. -l is lines, -c is
bytes. The letter matches what it counts: l for lines, c for characters/bytes.

cp nginx.conf nginx.conf.$(date +%Y%m%d) — 2 retries
Timestamped backup using command substitution. $(date +%Y%m%d) appends
today's date to the filename. The format string %Y%m%d produces YYYYMMDD.
Forgot the $ before the parentheses on first attempts.

wc -c app.log — 1 retry
Byte count. Same wc confusion as above, other direction.

ls -la — 2 retries
Permissions on every file in the directory. -l for long format, -a for
all files including hidden. Both flags needed — -l alone misses hidden
files, -a alone does not show permissions.

## The One That Keeps Coming Back

tail -f /var/log/app/payment.log — flagged for strengthening
Typed tail -f payment.log again. Same error as last session. The -f flag
is correct. The path is wrong. tail -f requires the full absolute path
to the log file. Relative paths only work when already in that directory.
This command is used remotely over SSH where the working directory is
never guaranteed — absolute path is the only safe form.

This is the third time this exact mistake has appeared. The flag is not
the problem. The pathing discipline is.

## Commands to Review Before Next Session
tail -f — always absolute path, never relative
find -type f — the flag that filters to regular files only
find -mtime -1 — minus sign means within the last N days, not exactly
wc -l vs wc -c — l for lines, c for bytes, do not swap them
$(date +%Y%m%d) — command substitution syntax, $ before the parentheses

## Cloud Connection
Cloud connection: Every command retried today is a real incident response
tool. wc -l on a log file is how the line count gets checked before and
after a deployment to confirm logs are being written. find -mtime -1 is
how recently modified files get located when something changed on a server
and nobody knows what. cp with a timestamped backup is standard practice
before editing any config file on a live EC2 instance — always preserve
the original. tail -f with the full absolute path is how a live log gets
monitored during a deployment or incident. The absolute path requirement
is not pedantic — over SSH you are never guaranteed to be in the directory
you think you are.