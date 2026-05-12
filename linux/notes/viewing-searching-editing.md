# Viewing, Searching, and Editing Files
**Track:** Linux
**Source:** Unix System Administration / LabEx lab
**Date:** 2026-05-11
**Week:** Week 5 | Phase 1

---

## What This Is

Three-phase workflow for interacting with files in a Linux environment: audit what's there, search for what matters, fix what's wrong. This is the diagnostic cycle every SRE runs when a service fails.

---

## How It Works

**Phase 1 — Audit (Viewing):** Before touching anything, assess the current state. Read the file. Know what you're working with.

**Phase 2 — Diagnostic (Searching):** Production config files are hundreds of lines. You don't read them top to bottom. You grep for the thing that's broken.

**Phase 3 — Remediation (Editing):** Fix it in the terminal with a text editor. No GUI. SSH means terminal only.

`/etc/passwd` is the master directory of user information — a long system file that's a real-world target for all three phases.

---

## The DevOps Connection

This is the exact workflow for troubleshooting a service failure caused by misconfiguration:

1. `cat` or `less` to read the config file without accidentally changing it
2. `grep "port" config.yaml` to isolate the broken parameter without scanning hundreds of lines manually
3. `nano` or `vim` to correct the value via SSH, no graphical environment needed

Combining command-line diagnostics with structured editing reduces downtime caused by invalid configuration syntax. Every step leaves an audit trail of what you looked at and what you changed.

---

## Commands / Syntax

```bash
# View a file — full dump
cat /etc/passwd

# View a large file safely — page through it without risk of edits
less /etc/passwd

# View first N lines
head filename

# View last N lines (useful for live log monitoring)
tail filename

# Search for a pattern in a file
grep "pattern" filename

# Search — case insensitive
grep -i "pattern" filename

# Invert — print lines that DON'T match
grep -v "pattern" filename

# Real-world example: find a port setting in a config file
grep -i "port" /path/to/config.yaml

# Edit a file in the terminal
nano filename
vim filename
```

---

## What I Got Wrong First

`grep -v` is easy to misread. It feels like it should mean "verbose" but it means invert — print everything that does NOT match. Confusing these in a diagnostic session sends you looking at the wrong lines.

---

## Quick Recall

- `cat` = fast dump, `less` = safe inspection of large files
- `grep "pattern" file` = find lines containing the pattern
- `-i` flag = ignore case, `-v` flag = invert match
- `nano` or `vim` = terminal editor for remote config fixes
- `/etc/passwd` = master user information file

---

## Connected To

Before: File system navigation, knowing where config files live  
After: Shell redirection, pipelines, log analysis, `sed` for in-place edits
