# Day 14 — Networking Notes
Date: 4/9/26
Source: Subnet drill trainer — BASIC mode + SPLIT mode

BASIC: 100% (5/5 perfect) | Duration: 12:28 | Avg/drill: 2:28 | Missed: 0
SPLIT: 60% (3/5 perfect) | Duration: 10:51 | Avg/drill: 1:58 | Missed: 3

## BASIC — First Perfect Score

Five for five. No misses. BASIC is done. The boundary formulas are
automatic. Block size recall is no longer the bottleneck. Drill 1 took
7:08 which pulled the average up — drills 2 through 5 averaged under 90
seconds each. The speed will come down naturally with more reps.

BASIC progression:
Day 11: 40%
Day 12: 60%
Day 13: 80%
Day 14: 100%

## SPLIT Session

Three perfect, two wrong. Both errors on drills 4 and 5. Same root cause
as every previous SPLIT session — block size not locked in before
calculating. Three block size errors total.

Drill 4 — Wrong
AWS hosts: gave 507, correct is 251.
507 is the /23 answer. 251 is the /24 answer. Used the wrong prefix going
into the host count calculation. The prefix determines the block size which
determines everything else. Getting the prefix wrong at step one means
every answer after it is wrong.

Drill 5 — Wrong
Subnet 8 broadcast: gave 10.11.237.191, correct is 10.11.237.255
Subnet 8 last usable: gave 10.11.237.190, correct is 10.11.237.254

The difference between .191 and .255 is a block size of 64 vs 256.
Used /26 math on what was a /24 problem. Subnet 8 in a /24 problem with
block size 256 — the eighth subnet counting up by 256 from the base
address lands in a different third octet entirely. Getting to subnet 8
in a large split requires tracking the cross-octet carry carefully.

## The Pattern Across All SPLIT Sessions

BASIC is solved. SPLIT keeps b