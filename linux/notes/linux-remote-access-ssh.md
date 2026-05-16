# Remote Access and Secure File Transfer
**Track:** Linux
**Source:** LabEx — Remote Access and Secure File Transfer
**Date:** 2026-05-16
**Week:** Week 5 | Phase 1

---

## What This Is

SSH is how you control a remote Linux server from your own terminal. Once you're connected, you need ways to move files back and forth. This lab covers three tools for that: SCP for quick single-file copies, RSYNC for syncing folders efficiently, and SFTP for interactive browsing and transfer sessions.

---

## The Mental Model

```
Your machine (local)  ←──── SSH tunnel ────→  Remote server

Quick copy (one file):         SCP   →  throw it and done
Smart sync (whole folder):   RSYNC   →  only sends what changed
Browse and pick (interactive): SFTP  →  keep connection open, navigate around
```

SSH keys replace passwords. Not "no authentication" — authentication now happens through possession of your private key instead of something you type. The server checks: does the connecting machine have the private key that matches the public key I have on file? If yes, access granted.

---

## The DevOps Connection

Every cloud server you'll ever manage is accessed via SSH. There is no other way in. When you deploy to an EC2 instance, transfer config files to a server, or run a CI/CD pipeline that pushes to a remote host — this is the transport layer underneath all of it. RSYNC specifically shows up in deployment scripts where you only want to push changed files, not re-transfer an entire directory on every deploy.

---

## Commands / Syntax

### SSH
```bash
# Connect to a remote server
ssh user@hostname-or-ip

# Generate an SSH key pair (creates private + public key)
ssh-keygen

# Install your public key on a remote server (enables key-based auth)
ssh-copy-id user@hostname-or-ip
```

### SSH Config — The Address Book
Instead of typing full connection details every time, save them as a nickname.

```bash
# File location
~/.ssh/config

# Example entry
Host myserver
    HostName 192.168.1.100
    User jamal
    Port 2222

# Before: ssh jamal@192.168.1.100 -p 2222
# After:  ssh myserver
```

### SCP — Simple File Copy
```bash
# Syntax: scp [source] [destination]
# The colon (:) is what marks a remote location

# Upload a file to the remote server
scp upload.txt user@hostname:/tmp/

# Download a file from the remote server
scp user@hostname:/tmp/remotefile.txt ./local-copy.txt
```

The colon after the hostname is the signal that what follows is a path on the remote machine, not a local one.

### RSYNC — Smart Folder Sync
```bash
# Sync a local folder to a remote location
# Only transfers files that changed — not the whole folder
rsync -avz my_website/ user@hostname:/tmp/my_website_backup/
```

**Flag breakdown:**
| Flag | Means |
|---|---|
| `-a` | Archive — preserve permissions, timestamps, symlinks |
| `-v` | Verbose — show what's being transferred |
| `-z` | Compress — reduce transfer size over the network |

### SFTP — Interactive Transfer Session
```bash
# Open an interactive SFTP session
sftp user@hostname

# Once inside the session:
ls          # list files on remote
cd          # change directory on remote
lls         # list files on LOCAL machine
lcd         # change directory on LOCAL machine
put file    # upload to remote
get file    # download to local
exit        # close session
```

SFTP keeps the connection open. Use it when you need to browse around and transfer multiple files rather than copy one specific file you already know the path to.

---

## What I Got Wrong First

The colon in SCP syntax looks like it doesn't belong. `scp file.txt user@host:/tmp/` — that `:` is not decoration. Remove it and SCP treats the whole thing as a local path. The colon is what switches the destination from local to remote.

---

## Quick Recall

- `ssh user@host` = connect to remote server
- `ssh-keygen` then `ssh-copy-id` = set up key-based auth (no password)
- `~/.ssh/config` = save connection aliases so you type `ssh myserver` instead of full details
- SCP = one file, quick copy. Colon marks the remote side
- RSYNC = folder sync, only sends what changed. `-avz` is the standard flag set
- SFTP = interactive session, `put` uploads, `get` downloads, `lls`/`lcd` for local navigation

---

## Connected To

Before: Linux networking, understanding IP addresses and ports  
After: CI/CD pipeline file transfers, Ansible (which runs over SSH), EC2 access patterns
