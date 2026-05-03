# Day 02 — Linux Notes
Date: 3/26/26
Lab: LabEx — Professional Linux System Administration & Security Hardening

## What I Did
Acted as a system administrator for a semi-live environment (TechNova/Project
Phoenix). Created and managed user accounts for a full team, set up home
directories, enforced password policies, controlled group-based permissions,
and disabled unauthorized access. Full IAM cycle from scratch.

## Commands Learned
useradd — creates a new user account — useradd -m username
useradd -m — creates user WITH a home directory — useradd -m sarah
userdel — deletes a user account — userdel username
usermod — modifies an existing user account — usermod -aG groupname username
usermod -aG — appends a user to a group without removing existing groups — usermod -aG devteam sarah
groupadd — creates a new group — groupadd devteam
passwd — sets or changes a user password — passwd username
adduser — higher-level interactive alternative to useradd — adduser username

## What Actually Happened (The Real Notes)
Linux system administration is becoming muscle memory. The logical structure
of commands matters — it is not just about knowing the command, it is about
knowing the exact argument framing before you run it.

Made a real mistake today: added a supervisor user without the -m flag, so
she had no home directory. Could not just append the fix — had to delete the
user entirely and re-add her correctly. Lesson: read the full requirement for
each user before running useradd. Getting it wrong costs more time than
reading carefully upfront.

The -m flag is now deeply familiar — first learned it through Git, now it
shows up universally. That cross-tool pattern recognition is useful.

Key question I sat with: did I actually authenticate users, or did I just
create passwords? There is a difference. Creating a password is not the same
as verifying identity — authentication requires the user to prove they are who
they claim to be. Worth understanding that boundary clearly.

usermod -aG clicked conceptually. The "append to Group" structure follows the
same logical framing as the rest of Linux — it reads like what it does.

adduser vs useradd: adduser is a higher-level wrapper, more interactive, adds
nuance to how the user creation argument is framed. useradd is lower-level
and more explicit. Both valid — the choice affects what you need to specify
manually.

## Commands I Could NOT Remember From Memory
- /etc/login.defs — knew it exists but could not recall the exact path
- /etc/shadow — same, know what it stores but path not automatic yet
- exact flag order for usermod -aG — had to think through it

## Cloud Connection
In AWS, IAM is the entire foundation of account security. Creating users,
assigning them to groups, enforcing least privilege, disabling dormant
accounts — this is exactly what AWS IAM does but at cloud scale. Every
permission boundary you set manually in Linux today is what AWS IAM policies
automate. Understanding it at the Linux level means AWS IAM will make sense
when you get there.