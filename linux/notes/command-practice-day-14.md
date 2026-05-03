# Day 14 — Linux Notes
Date: 4/9/26
Source: SRE Command Trainer — Command Line + Text-Fu session

Command Line: 20/22 | Duration: 20:36 | Retried: 6 | Skipped: 2
Text-Fu: 15/16 | Duration: 63:52 | Retried: 9 | Skipped: 1

## What I Did
Two sessions back to back. Command Line and Text-Fu. Command Line holding
steady at 91%. Text-Fu jumped to 94% — up from 89% last session. The
pipeline commands and grep combinations that were being skipped are now
being attempted and answered correctly on retry.

## Command Line — Cards That Needed Retries

find /var/log -mtime -1 — 1 retry
Prompt said /etc, answer uses /var/log. The path mismatch between prompt
wording and expected answer keeps causing hesitation. The flag -mtime -1
is automatic now — the path is the part that trips it up.

cp -r /var/www/app /var/www/app.bak — 2 retries
Recursive directory copy. -r still not firing automatically when the
prompt says "copy directory and all contents." The flag is required any
time the source is a directory.

wc -l app.log — 1 retry
Line count. Still occasionally mixing up -l and -c. -l counts lines,
-c counts bytes.

rm -i /tmp/errors.txt — 1 retry
Delete with confirmation prompt. -i flag prompts before each deletion.
New card — the -i flag was not in previous sessions.

rm /tmp/errors.txt — 1 retry
Plain delete without flags. Got confused between this and the -i version
above. Two rm cards in the same session caused hesitation on both.

ls -la — 1 retry
Full listing with hidden files and permissions. Still not instant on
first attempt despite being in every session.

## Command Line — Flagged for Strengthening

mv /tmp/nginx.conf.bak /etc/nginx/nginx.conf
Typed mv nginx.conf.bak /etc/nginx/nginx.conf.bak — two errors. Missing
/tmp/ at the start of the source path, and added .bak to the destination
filename. The destination should be nginx.conf not nginx.conf.bak — the
point of the mv is to restore the backup to its original name and location.
Source needs full absolute path. Destination filename drops the .bak.

mkdir /var/log/app
Typed mkdir opt/ — completely wrong path. The prompt was about creating
a directory so a service can write logs. /var/log/app is where application
logs live on Linux systems. opt/ is unrelated.

## Text-Fu — Cards That Needed Retries

grep ' 500 ' access.log | awk '{print $1}' | sort | uniq -c | sort -rn | head -5 — 2 retries
Top 5 IPs causing 500 errors. Full pipeline is becoming more familiar but
still needs two attempts. The order is: grep filters status lines, awk
extracts IP field, sort groups, uniq -c counts, sort -rn ranks descending,
head -5 limits output. Getting closer to automatic.

sort -n sizes.txt — 1 retry
Numeric sort. -n sorts by actual number value not alphabetically. Without
-n the sort treats numbers as strings so 10 comes before 9.

grep -r 'ERROR' /var/log/ — 1 retry
Recursive grep through a directory. -r flag is what makes it recurse.
Single quotes around ERROR — not double quotes.

cut -d' ' -f1 access.log — 2 retries
Extract first field using space delimiter. -d sets delimiter, -f sets
field number. Still not automatic — cut is used less than grep and awk
so it takes longer to fire.

awk '{print $1}' access.log | sort -u | wc -l — 2 retries
Total unique IP count. awk pulls first field, sort -u deduplicates,
wc -l counts. The -u flag on sort does the deduplication in one step
instead of sort | uniq separately.

grep -in 'timeout' app.log — 2 retries
Case-insensitive search with line numbers. -i ignores case, -n shows
line numbers. Both flags together. Still having to think through which
flag does which.

grep 'ERROR' app.log | tee /tmp/errors.txt — 1 retry
Output to screen and file simultaneously. tee splits the stream — stdout
still prints, file gets written at the same time.

grep 'ERROR' app.log > /tmp/errors.txt — 1 retry
Redirect output to file only. > writes to file, nothing prints to screen.
Different from tee which does both. Easy to confuse the two.

sort ips.txt | uniq — 2 retries
Unique list. sort must come before uniq — uniq only removes consecutive
duplicates so an unsorted file gives wrong results.

## Text-Fu — Flagged for Strengthening

find /tmp -name '*.log' | xargs rm
Still being skipped. xargs takes piped output and passes it as arguments
to the next command. find locates all matching files, xargs rm deletes
them all in one shot. Single quotes around *.log required.

## What Is Actually Improving
Text-Fu 94% is a real jump from 44% on Day 12. The pipeline commands are
no longer being skipped — they are being attempted and answered. grep -in,
tee, awk pipelines are landing on retry instead of being skipped entirely.
That is the right direction.

Command Line is consistent at 91%. The same cards keep needing retries —
find path confusion, cp -r, ls -la. These need one more week of sessions
before they are fully automatic.

## Commands Still Not Automatic
mv with full absolute paths on both source and destination
mkdir — getting the right path for the right use case
cp -r — still forgetting -r for directory copies
find -mtime path — flag is automatic, path still causes hesitation
tee vs > — both write to file but tee also prints to screen
sort | uniq vs sort -u — two ways to deduplicate, know both

## Cloud Connection
Cloud connection: rm -i before deleting a config file on a live EC2
instance is standard practice — the confirmation prompt is a last check
before something irreversible happens. mv /tmp/nginx.conf.bak
/etc/nginx/nginx.conf is exactly how a config restore happens after a
bad deployment — pull the backup from /tmp and move it back to its
original location with its original name. The tee vs redirect distinction
matters during incidents — tee lets output be watched live while also
being saved, which is what happens when running diagnostics and needing
a record at the same time.