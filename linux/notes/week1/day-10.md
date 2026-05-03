# Day 10 — Linux Notes
Date: 4/3/26
Lab: Unix System Administration — Module 2 Permissions Activity

## What I Did
Executed a 10-command script session for a Unix System Administration
assignment. Built and verified a full permissions and directory management
workflow before running it — chmod with symbolic notation, recursive copy
with preserved permissions, recursive permissions removal, directory
listing with multiple flags, and a permanent recursive force delete. One
submission only so audited everything outside the script session first
before running it clean.

## Commands Used

chmod ug+rwx MUHAMMAD_JAMAL
Add rwx for user and group using symbolic notation. Starting permissions
were drwxr-x--- so this added write to group, resulting in drwxrwx---.

cp -r -p MUHAMMAD_JAMAL /home/STUDENTS/majors/teststu/SysAdmin/SUBMISSIONS
Recursive copy with permissions and timestamps preserved. Two separate
flags as required — -r for recursive, -p for preserve. Copies the full
directory and all contents to SUBMISSIONS.

cd /home/STUDENTS/majors/teststu/SysAdmin/SUBMISSIONS
Navigate to SUBMISSIONS to work on the copy directly.

chmod -R o-rwx MUHAMMAD_JAMAL
Recursively remove all permissions for others on the copied directory.
-R makes it apply to all contents inside, not just the top level.

ls -lrt MUHAMMAD_JAMAL
Long format, reverse order, sorted by modification time. Flag order: l
for long, r for reverse, t for sort by modification time.

cd
Return home with no path specified. Bare cd instead of cd ~ because the
assignment said no path specified and ~ is technically a path shorthand.

rm -rf ./MUHAMMAD_JAMAL
Permanently and recursively remove MUHAMMAD_JAMAL and all contents from
home. The ./ scopes it explicitly to the current directory. This is
irreversible — audited location carefully before running.

pwd
Print working directory to confirm location after returning home.

ls MUHAMMAD_JAMAL
List MUHAMMAD_JAMAL in home directory after deletion — expected output is
an error: cannot access MUHAMMAD_JAMAL: No such file or directory. This
confirms the rm -rf worked correctly.

ls -lrt /home/STUDENTS/majors/teststu/SysAdmin/SUBMISSIONS/MUHAMMAD_JAMAL
Same format as command 5, targeting the copy in SUBMISSIONS using full
absolute path. The copy was never removed so it should still exist here.

## What Actually Happened (The Real Notes)
Audited everything before entering the script session. Confirmed MUHAMMAD_JAMAL
existed in home with all 6 files, SUBMISSIONS was accessible, and starting
permissions were drwxr-x---. Running the audit outside the session first
meant no guessing or fixing inside the session where errors cannot be
cleaned up.

The cd vs cd ~ decision mattered. ~ is a shorthand path reference so bare
cd was the cleaner choice when the requirement said no path specified.
Small distinction but the kind of thing that gets flagged.

The rm -rf command required the most confidence before running. The logic
chain: command 2 copies to SUBMISSIONS, the original stays in home, command
6 returns home, command 7 removes ./MUHAMMAD_JAMAL from home. The copy in
SUBMISSIONS is untouched. Traced the flow completely before the session
started because there is no recovering from a wrong rm -rf.

Command 9 returning an error was expected and intentional — that error
message is the proof the deletion worked.

## Commands I Could NOT Remember From Memory
- ls flag order for -lrt — had to confirm l before r before t
- chmod -R lowercase — kept second guessing whether it was -R or -r
  (it is uppercase -R for recursive on chmod)
- cp -r -p flag separation — assignment required two separate options,
  not combined into -rp

## Cloud Connection
Cloud connection: This entire workflow maps directly to EC2 and S3 work.
chmod and chown on config files and SSH keys is standard practice every
time a new instance is configured. cp -p preserving timestamps is the same
principle behind S3 object metadata preservation when syncing files.
chmod -R o-rwx locking down a directory mirrors IAM policies that restrict
public access to S3 buckets. The audit-before-execute discipline — checking
that paths exist and permissions are correct before running a destructive
command — is the same mindset behind running terraform plan before terraform
apply. You do not run the destructive operation until you have confirmed the
state of what you are about to change.