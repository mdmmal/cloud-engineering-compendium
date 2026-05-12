# Shell Environment, Variables, Users, Groups, and Permissions
**Track:** Linux
**Source:** Unix System Administration / LabEx lab
**Date:** 2026-05-11
**Week:** Week 5 | Phase 1

---

## What This Is

Two connected topics: the shell environment (what variables are active in your session and how to control them) and Linux's identity and permission system (who owns what and who can do what to it). Together they define how a Linux system controls access — which is the foundation of cloud security.

---

## How It Works

**Environment:**
Every terminal session carries environment variables — key-value pairs that programs and the shell itself read to know how to behave. `env` lists every variable currently set. `date` prints the current system time; `date +'%F'` formats it as `YYYY-MM-DD`.

**Identity:**
`/etc/passwd` is the master directory of users — it tracks primary group membership, home directories, and which shell starts after login. `id` shows which groups the current user belongs to.

**Permissions:**
Every file has an owner (user), a group, and a permission set for three categories: user, group, other. Permissions are expressed as read (r=4), write (w=2), execute (x=1). Add them together to get the octal value for each category.

`chmod` changes file permissions. `chown` changes the owner. `chgrp` changes the group.

`umask` is a permission filter applied at file creation — it defines which permissions to subtract from the maximum default. It doesn't set permissions directly; it removes them.

---

## The DevOps Connection

Permission misconfiguration is one of the most common causes of cloud security incidents. In AWS, the principle of least privilege (IAM policies) maps directly to Linux permission logic — give the minimum access needed, nothing more. Understanding octal permissions makes reading and setting security policies intuitive rather than arbitrary.

SSH key pairs use `600` permission (owner read/write only). If your `.pem` file is `777`, AWS will reject the connection. The permission system is not theoretical.

---

## Commands / Syntax

```bash
# List all environment variables in current session
env

# Print current date
date

# Print date formatted YYYY-MM-DD
date +'%F'

# Check current user's groups
id

# Change file owner
chown username /path/to/file

# Change file group
sudo chgrp groupname /path/to/file

# Change permissions — octal mode (absolute, resets all permissions)
chmod 644 filename
chmod 755 filename
chmod 600 filename

# Change permissions — symbolic mode (relative, tweaks existing)
chmod +x filename          # add execute for everyone
chmod o-r runme.sh         # remove read from 'other'
chmod u+w filename         # add write for user only

# Create a group
groupadd groupname

# Apply group ownership
sudo chown :groupname /path/to/file
```

**Octal reference:**
| Value | Meaning |
|---|---|
| `777` | Everyone reads, writes, executes |
| `755` | Owner full access; group and other read/execute |
| `644` | Owner read/write; group and other read only |
| `600` | Owner read/write only — nothing for group or other |

**Symbolic syntax:** `[Who][Action][What]`
- Who: `u` (user), `g` (group), `o` (other), `a` (all)
- Action: `+` (add), `-` (remove), `=` (set exactly)
- What: `r`, `w`, `x`

**Octal vs Symbolic:**
- Octal = good for resetting (absolute, defines the full permission set)
- Symbolic = good for tweaks (relative, changes one thing without touching the rest)

**umask:**
- `0` = take nothing (leave the permission)
- `2` = subtract write
- `4` = subtract read

---

## What I Got Wrong First

`umask` subtracts from the default — it does not set permissions. It's easy to read it as "set these permissions" when it actually means "remove these from whatever the default would be." The direction matters.

---

## Quick Recall

- `env` = list session environment variables
- `date +'%F'` = formatted date as YYYY-MM-DD
- `/etc/passwd` = master user directory (groups, home dirs, shell)
- `r=4, w=2, x=1` — add them for each category
- `600` = SSH key permissions (owner read/write only)
- Octal resets, symbolic tweaks

---

## Connected To

Before: File system navigation, knowing what files exist and where  
After: Sudo and privilege escalation, SSH key management, IAM in AWS, security group logic
