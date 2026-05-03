# Day 04 — Linux Notes
Date: 3/26/26
Lab: LabEx — Linux Toolkit for Process Management

## What I Did
Worked through process inspection, identification, termination, and background
execution. Used ps and top to observe running processes, pgrep to find specific
processes by name, pkill to terminate misbehaving ones, and nohup with & to
run scripts that persist after the terminal closes. Launched critical_service.sh
and resource_hog.sh as real background processes to practice these in context.

## Commands Learned
ps — static snapshot of currently running processes — ps aux
ps aux — all processes, all users, with CPU and memory detail — ps aux
ps aux | head — pipe ps output to head to see just the first lines — ps aux | head
top — dynamic real-time process viewer, updates live — top
pgrep — find a process by name, returns its PID — pgrep nginx
pgrep -f — match against the full command string not just process name — pgrep -f critical_service.sh
pkill — terminate a process by name — pkill resource_hog
nohup — keeps a process running after the terminal session closes — nohup ./critical_service.sh &
& — sends a process to the background immediately — ./script.sh &

## What Actually Happened (The Real Notes)
Tried to run ps aux | head before understanding what ps aux actually returned.
Good instinct — piping to head to preview output before reading the whole
thing is smart practice. Worth keeping that habit.

ps vs top clicked clearly: ps is a photograph, top is a live feed. ps shows
you what was running when you ran the command. top shows you what is happening
right now and keeps updating. The analogy that landed: top is a stethoscope.
Even if cloud platforms have AI-driven diagnostics, knowing how to use top
means you can do direct intervention on any Linux machine without depending
on external tooling.

pgrep -f is the one to remember. Plain pgrep matches only the process name.
pgrep -f matches the entire command string — so if your script was launched
as ./scripts/critical_service.sh you can find it by any part of that path.
More precise, more useful in practice.

The nohup + & combination is what makes background services actually work.
& alone puts a process in the background but it dies when the terminal closes.
nohup alone keeps it running but it stays in the foreground. Together they do
what you actually want: background and persistent. This is how real daemons
and long-running server tasks are managed.

## Commands I Could NOT Remember From Memory
- nohup exact syntax — kept wanting to put & before the command not after
- pgrep -f vs pgrep — had to think through which flag matches full string
- SIGTERM vs SIGKILL distinction — know kill exists but signal numbers not automatic yet

## Cloud Connection
Cloud connection: When you SSH into an EC2 instance and a process is hanging
or eating CPU, these are the exact commands you run. ps aux to see what is
running, top to watch resource usage live, pgrep to find the PID of the
problem process, pkill to kill it. nohup is how background services stay
alive on a server after your SSH session drops — which happens constantly
in real cloud work. This entire lab is direct SRE daily tooling.