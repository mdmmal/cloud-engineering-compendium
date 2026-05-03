# Day 01 — Linux Notes
Date: 3/25/26
Lab: LabEx — Linux File Security and Access Control

## What I Did
I configured a secure project environment for "Project Phoenix." This included setting granular file permissions to protect sensitive keys, assigning project ownership to specific development groups, and implementing setgid on shared directories to ensure that new files automatically inherit the correct group ownership for team collaboration.

## Commands Learned

chmod — Changes file mode bits (permissions) — chmod 640 secret.key
chown — Changes file owner and group — chown :devteam project_dir
ls -ld — Lists directory details without entering it — ls -ld /home/labex/project
chmod g+s — Sets the setgid bit on a directory — chmod g+s /home/labex/project

## What Actually Happened (The Real Notes)
The focus was on balancing security with usability. By using setgid, I ensured that team members can collaborate in a shared directory without constantly manually changing group ownership for every new file created. Proper ownership (using chown) and minimal permissions (using chmod) are the first lines of defense in Linux system administration.

## Commands I Could NOT Remember From Memory
- chmod g+s: I often forget the exact syntax for setting the setgid bit, usually needing to verify if it's a letter or a number (2xxx) for the octal mode.
- ls -ld: I frequently forget to add the -d flag, which results in listing the contents of the directory instead of its own permissions.

## Cloud Connection
In AWS, EC2 instances run Linux and you'll set these exact permissions on app files and config directories. chmod and chown are how you lock down sensitive files like SSH keys (~/.ssh must be chmod 700) and application config files that contain database passwords.