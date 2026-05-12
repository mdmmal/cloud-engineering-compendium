# Shell Redirection and Pipelines
**Track:** Linux
**Source:** Unix System Administration / LabEx lab
**Date:** 2026-05-11
**Week:** Week 5 | Phase 1

---

## What This Is

Redirection and pipelines are the mechanism for chaining Linux commands together so the output of one becomes the input of the next. This is how raw terminal commands become production-grade log analysis tools.

---

## How It Works

In a pipeline, each command has a specific role. One command prepares the data so the next can work. The relationship between `sort` and `uniq` is a classic example of this: `sort` lines like up matching entries together, then `uniq` collapses the neighboring duplicates. `uniq` can't find every duplicate on its own — it only collapses neighboring ones. Sorting first is what makes it work.

`>` redirects output to a file. `2>` redirects error messages only — standard output still goes to the terminal.

An `alias` gives a real command a shorter nickname for your session.

---

## The DevOps Connection

This is how real systems handle log analysis at scale:

- **Log Aggregation:** The "Input → Filter/Aggregate → Report" pattern in this lab is exactly how centralized logging systems like the ELK Stack or Splunk function. The local file is just a scaled-down version of what those tools process across distributed microservices.
- **Observability:** DevOps engineers don't read raw logs. They build pipelines — using `awk`, `sed`, `grep`, and shell — to aggregate, filter, and alert on system health.
- **Automation:** Chain these commands into a script, put it in a cron job or CI/CD build step, and you have automated monitoring for security threats or server performance metrics.

---

## Commands / Syntax

```bash
# Redirect standard output to a file
command > output.txt

# Redirect errors only (stderr) to a file
command 2> errors.txt

# Pipe output of one command into the next
command1 | command2

# Classic pattern — sort first so uniq can collapse duplicates
sort file.txt | uniq

# Count how many times each line appears
sort file.txt | uniq -c

# Sort those counts numerically to find the most frequent entries
sort file.txt | uniq -c | sort -n

# Create a session alias
alias nickname='real command'
```

**Pipeline stage roles:**
- `sort` — prepares data (lines up duplicates)
- `uniq` — collapses neighboring duplicates
- `uniq -c` — adds a frequency count to each collapsed line
- `sort -n` — ranks by numeric value (critical for finding top talkers)
- `>` — persists output to a file for auditing

---

## What I Got Wrong First

`uniq` feels like it should find all duplicates in a file. It doesn't. It only collapses duplicates that are next to each other. Running `uniq` without sorting first gives you wrong counts. The sort step is not optional.

---

## Quick Recall

- `>` redirects output to a file, `2>` redirects errors only
- `sort | uniq` = the classic deduplication pattern
- `uniq -c` = add frequency count per line
- `sort -n` = rank by number, not alphabetically
- One command prepares the data so the next can work

---

## Connected To

Before: Viewing and searching files, understanding stdin/stdout  
After: Shell scripting, `awk`, `sed`, log analysis scripts, cron jobs
