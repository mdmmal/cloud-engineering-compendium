# Day 06 — Linux Notes
Date: 3/30/26
Labs: LabEx — Backup and Recovery Pipeline + APT Package Management

## What I Did
Two labs today. Built a full backup and recovery pipeline from scratch using
tar and cron — archived critical directories, verified the archive, simulated
disaster recovery, and automated the whole process on a schedule. Then worked
through the full APT software lifecycle — syncing package metadata, installing,
inspecting, removing, and cleaning up orphaned dependencies.

## Commands Learned
tar -czvf — creates a compressed archive — tar -czvf backup.tar.gz data/ config/ logs/
tar -tzvf — lists archive contents without extracting — tar -tzvf backup.tar.gz
tar -xzvf — extracts the full archive — tar -xzvf backup.tar.gz
tar -xzvf --wildcards — extracts a single file — tar -xzvf backup.tar.gz config/app.conf
date +%Y-%m-%d — formats today's date for filenames — backup-$(date +%Y-%m-%d).tar.gz
crontab -e — opens cron scheduler to add automated jobs — crontab -e
cron syntax — minute hour day month weekday — 0 2 * * * /path/to/backup.sh
apt update — syncs package metadata, does not install anything — sudo apt update
apt install — installs a package — sudo apt install packagename
apt show — inspects package details before installing — apt show packagename
apt remove — removes a package, leaves config files — sudo apt remove packagename
apt autoremove — removes orphaned dependencies — sudo apt autoremove

## What Actually Happened (The Real Notes)
The tar flags felt similar to the arithmetic behind chmod — you have to know
which options to combine and in what order. -c creates, -z compresses, -v
shows progress, -f means the next argument is the filename. Once that logic
clicked it felt less like memorizing and more like constructing an argument
the same way chmod 755 is constructed. Some flags were self-explanatory,
others needed reps.

The -f flag specifically tripped me up. Without it tar looks at stdin and
breaks. Flag ordering is strict in many Unix tools — same discipline as
getting argument order right in useradd and usermod.

Biggest lesson from the backup lab: tried to verify and restore an archive
that had never been created yet. Sequencing matters. In a real system if the
backup job silently fails you will not know until disaster hits. Verification
is its own dedicated step for exactly that reason.

Empty archive was the subtle one — ran the backup before app.conf existed
so it was not included. No error, no warning. Backup completed successfully
but was incomplete. That is the dangerous kind of failure because everything
looks fine until you need the file.

cron required absolute paths. Relative paths break because cron runs without
your shell environment — it does not know where you are. Always use full
paths in automated scripts.

On the APT side: hit permission denied early. The rule is simple — if it
modifies system state it needs sudo, if it just reads or inspects it probably
does not. apt show works without sudo. apt install does not. That is the
Principle of Least Privilege in practice.

apt update does not install anything. It only syncs metadata so your system
knows what versions are available. Running install without update first means
you might pull an outdated version. Always update before install.

## Commands I Could NOT Remember From Memory
- tar flag order — -f must come directly before the filename
- cron syntax order — minute hour day month weekday, kept reversing it
- $(date +%Y-%m-%d) exact format string — knew the concept, not the syntax
- apt autoremove vs apt remove — had to think through which handles
  orphaned dependencies vs the package itself

## Cloud Connection
Cloud connection: Both labs map directly to AWS. tar = EBS snapshots and S3
uploads — capturing state at a point in time. Timestamped filenames = S3
versioning. cron = AWS EventBridge — identical syntax, managed at cloud scale.
tar -tzvf verification = AWS Backup audit reports and checksum validation.
Extracting a single file = RDS point-in-time recovery and granular restore.
On the APT side: User Data scripts on EC2 run apt update and apt install
automatically on boot so instances come up pre-configured without anyone
SSHing in. In mature environments these commands get baked into AMIs or
Ansible playbooks — nobody runs them manually on live servers. The tools
change, the thinking does not. A backup strategy must answer four questions:
what do I back up, how do I know it worked, can I restore from it, and will
it keep happening without me. You answered all four today.