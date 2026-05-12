# File System Navigation and File Operations
**Track:** Linux
**Source:** Unix System Administration / LabEx lab
**Date:** 2026-05-11
**Week:** Week 5 | Phase 1

---

## What This Is

The Linux filesystem is a hierarchy of directories, each with a specific purpose. Navigating it and managing files from the terminal is the foundation of everything — every DevOps task starts with knowing where you are and what's there.

---

## How It Works

The filesystem tree starts at `/` (root). Key directories:

- `/bin` — the toolbox where all the commands live
- `/etc` — the settings area for system configuration
- `/home` — personal directories, one per user

File operations move data around that tree using commands that take source and destination arguments. Wildcards let you target multiple files at once without naming them individually.

---

## The DevOps Connection

These "low-level" operations are the foundation of the daily DevOps workflow:

- **IaC (Terraform/CloudFormation):** You are organizing directory structures containing configuration scripts the same way you manage files in the terminal.
- **Containers/Docker:** `COPY`, `WORKDIR`, and `RUN` inside a Dockerfile execute the same logic as `cp`, `mkdir`, and `mv` — building a predictable filesystem inside a container.
- **CI/CD Pipelines:** Automated pipelines navigate into source folders, move build artifacts to a `dist` folder, create backups of previous releases, and remove build caches to save storage.
- **Server Maintenance:** When SSHing into a production server to troubleshoot, these shell skills are what you use to inspect logs, organize config files, and clear disk-clogging temp data.

---

## Commands / Syntax

```bash
# List contents — long format, recursive, with type indicators
ls -FRl

# Move all files starting with 'data_' into a backup directory
mv data_* backup/

# Remove files matching exactly 'temp_' + one character (? is character-specific)
rm temp_?

# * wildcard — matches everything after the pattern
rm temp_*
```

| Command | Purpose |
|---|---|
| `ls` | List directory contents — verify workspace state before any operation |
| `cd` | Change directory — first step in any terminal-based task |
| `mkdir` | Create directories — organize config files, logs, app assets |
| `cp` | Copy files — back up config files before making changes |
| `mv` | Move or rename files — deploy artifacts from build folder to serving directory |
| `rm` | Remove files — clean up temp build files or logs consuming cloud storage |

**Wildcard reference:**
- `*` — matches any number of characters
- `?` — matches exactly one character
- `.bak` — conventional suffix for backup file naming

---

## What I Got Wrong First

The distinction between `*` and `?` matters. `rm temp_*` catches everything after the underscore regardless of length. `rm temp_?` is strict — one character only. Using the wrong one in a cleanup script on a production server is a real problem.

---

## Quick Recall

- `/bin` = commands, `/etc` = config, `/home` = users
- `mv data_* backup/` moves every file starting with `data_`
- `?` = one character wildcard, `*` = any length wildcard
- `.bak` is the convention for backup naming
- `cp` before editing config files — always

---

## Connected To

Before: Terminal basics, directory structure  
After: Shell scripting, file permissions, `find` command, CI/CD artifact management
