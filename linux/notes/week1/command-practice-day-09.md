# Day 09 — Linux Notes
Date: 4/2/26
Source: Command line practice drills

## What I Did
Drilled core Linux commands from memory — file inspection, log management,
recursive search, backup and restore operations. Tracked exactly where
attempts failed and why.

## Commands Drilled

wc -c — byte size of a file — wc -c nginx.conf
wc -l — line count of a file — wc -l app.log
find -mtime -1 — files modified in the last day — find /var/log -mtime -1
find -name — recursive search by filename pattern — find /var/log -name '*.log'
cp — copy a file — cp nginx.conf nginx.conf.bak
cp -r — recursively copy a directory — cp -r /var/www/app /var/www/app.bak
mv — move or rename a file — mv /tmp/nginx.conf.bak /etc/nginx/nginx.conf
ls -la — full directory listing with permissions and ownership — ls -la
cat — print file contents — cat nginx.conf
head -20 — read first 20 lines of a file — head -20 /var/log/syslog
tail -f — follow a log file in real time — tail -f /var/log/app/payment.log

## What Actually Happened

wc -c vs wc -l — mixed these up on the first attempt. -c is bytes, -l is
lines. They look similar enough to confuse. I mix up their logic. The distinction
matters in practice — byte size and line count are different diagnostics.

find with -name and wildcards — took me 3 attempts. The single quotes around
*.log are required I tend to forget them. Without them the shell expands the wildcard before
find ever sees it, which breaks the search. find needs to receive '*.log'
as a literal string and handle the matching itself.

cp for backup — took me 3 attempts. The command itself is simple but the
specific naming convention cp nginx.conf nginx.conf.bak did not come
immediately. Backup naming is a convention worth locking in: original
name plus .bak extension.

mv for restore — took me 2 attempts. The full absolute path on both sides
is what tripped it up. mv /tmp/nginx.conf.bak /etc/nginx/nginx.conf
requires knowing the exact destination path. In a real restore scenario
getting the destination wrong drops the file in the wrong place silently.

tail -f — got the flag right, got the path wrong. Typed tail -f
payment.log instead of tail -f /var/log/app/payment.log. The file exists
at a specific absolute path. Relative paths only work when already in that
directory. This is the same pathing discipline from the cron lesson —
always use absolute paths when the location matters.

cp -r — typed the correct command but flagged for strengthening. The -r
flag means recursive — required any time the source is a directory, not
just a file. cp without -r on a directory fails silently or throws an
error depending on the system.

## Commands to Flag for Review
tail -f — always use the full absolute path to the log file
find -name — always single-quote the wildcard pattern
wc -c vs wc -l — bytes vs lines, do not mix them up
cp -r — required for directories, optional flag that is easy to forget

## Cloud Connection
Cloud connection: Every command drilled today is direct EC2 work. wc -l
and tail -f are the first tools used when SSHing into an instance to
diagnose a problem — how many lines in this log, what is happening in
this log right now. find /var/log -mtime -1 is how recent log files get
located before shipping them to CloudWatch or S3. cp nginx.conf
nginx.conf.bak before editing a config file is standard practice on any
server — always preserve the original before touching it. mv to restore
from /tmp is exactly what happens after pulling a backup file down from
S3 and moving it into place. These are not practice drills. This is the
actual incident response command sequence.