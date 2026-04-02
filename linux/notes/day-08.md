# Day 08 — Linux Notes
Date: 4/1/26
Lab: LabEx — Bash Scripting: log_manager.sh

## What I Did
Built log_manager.sh from scratch — a script that automates log file
management using conditionals, for loops, and variables. Converted a manual
file-copying workflow into a repeatable, logic-based process that scales
regardless of how many log files exist.

## Commands and Concepts Used
if/else — checks whether a directory exists before acting on it
for loop — iterates over every .log file in a directory automatically
variables — store paths at the top so nothing is hardcoded throughout
cp — copies files from source to destination
mkdir — creates the destination directory before the script runs
ls — used to verify directory names and catch path typos
set -x — debug mode, prints every command the shell executes line by line

## What Actually Happened (The Real Notes)
Three real mistakes today that are worth keeping.

First was pathing errors. Got "No such file or directory" repeatedly because
of a typo — had backup where the directory was actually named backups. The
fix is always ls before assuming a path is correct. The shell does not guess
what was meant. If the name is wrong the command fails silently or throws
that error and moves on.

Second was placement logic. Put the for loop outside the if block initially.
The script would run the loop even when the directory did not exist, which
caused it to either fail or return nothing. The rule: if the loop depends on
a directory existing, it must live inside the conditional that verifies that
directory exists. Scope matters. A script that assumes a directory is there
without checking first is a script that fails in production.

Third was environment setup. The script cannot function if the file system
structure it expects does not exist. Had to mkdir the destination directory
before the script could actually run. Scripts are only as reliable as the
environment supporting them.

The error messages felt confusing at first but they are actually precise.
"No such file or directory" means cp could not find the destination — either
it does not exist or the name is wrong. An empty for loop output means
*.log matched zero files in that directory. Both tell exactly where the
script stopped. set -x makes this even clearer — adds it to the top of any
broken script and it prints every command the shell processes line by line.

## Commands I Could NOT Remember From Memory
- set -x — knew debug mode existed, forgot the exact syntax
- for loop syntax — had to think through the pattern:
  for file in /path/*.log; do ... done
- placing the loop inside the if block — kept defaulting to writing the
  loop first before thinking about scope

## Cloud Connection
Cloud connection: log_manager.sh is the same logic that runs inside AWS
Lambda functions, Docker containers, and EC2 User Data scripts. The for
loop that copies .log files locally is the same loop that syncs logs to
an S3 bucket or streams them to CloudWatch — just a different destination.
The if/else that checks whether a directory exists is the same validation
logic that runs inside a container before a service starts. In cloud
environments nobody SSHes into a machine to move files manually. This kind
of script gets baked into startup configuration so it runs automatically
every time an instance launches. The logic is identical — the destination
changes from a local folder to a cloud storage endpoint.