# Day 11 — Networking Notes
Date: 4/5/26
Source: Subnet drill trainer — SPLIT mode + BASIC mode
SPLIT: 20% (1/5 perfect) | Duration: 20:24 | Missed: 19
BASIC: 40% (2/5 perfect) | Duration: 44:14 | Missed: 5

## What I Did
Two drill sessions today. SPLIT mode first — splitting networks into equal
subnets across availability zones. BASIC mode second — single subnet full
detail calculations. Both sessions flagged the same root cause: wrong block
size driving every downstream error.

## Error Pattern — Both Sessions

Most frequent mistake: wrong block size (22x in SPLIT, 3x in BASIC)

This is the same error from Day 09 drills. Still not locking in prefix →
block size before doing anything else. Every wrong broadcast, every wrong
last usable host, every wrong subnet network address traces back to starting
with the wrong block size. The calculation is not the problem. The input
to the calculation is.

The fix is the same one from last session and still not automatic:
prefix → block size → everything else. In that order. Written down before
touching anything else.

## SPLIT Session — Errors Broken Down

Drill 1 — 6:24 — Wrong
Problem: Split 10.7.172.0/23 into 4 subnets
Gave /26, correct is /25. Borrowed 2 bits from /23 = /25, not /26.
Block size at /25 is 128, not 64. That one wrong prefix cascaded into
every answer being off by exactly half.

Subnet 1: 10.7.172.0
Subnet 2: gave 10.7.172.64, correct is 10.7.172.128
Subnet 3: gave 10.7.172.128, correct is 10.7.173.0
Subnet 4: gave 10.7.172.128.192 (invalid), correct is 10.7.173.128
Subnet 2 broadcast: gave 10.7.172.127, correct is 10.7.172.255
Subnet 2 last usable: gave 10.7.172.126, correct is 10.7.172.254
AWS hosts: gave 59 (/26 answer), correct is 123 (/25 answer)

Root cause: used /26 block size of 64 throughout a /25 problem.

Drill 2 — 4:11 — Wrong
Problem: Split a /21 into 4 subnets
Misread the base network — had 10.21.x.x instead of 10.12.x.x throughout.
Every address was wrong because the starting point was wrong. Not a block
size error this time — a reading error. Slow down and confirm the base
network address before calculating anything.

Correct subnets at /23 block size 512:
Subnet 1: 10.12.224.0
Subnet 2: 10.12.226.0
Subnet 3: 10.12.228.0 — broadcast 10.12.229.255
Subnet 4: 10.12.230.0

Drill 3 — 3:37 — Correct
Only perfect drill of the SPLIT session.

Drill 4 — 1:08 — Wrong
Problem: Split 10.0.128.0/22 into 2 subnets
/22 into 2 = /23. Block size 512.
Gave /24 block size of 256 answers throughout.
Subnet 2 network: gave 10.0.128.128, correct is 10.0.130.0
Subnet 1 broadcast: gave 10.0.128.127, correct is 10.0.129.255
The .22 → .23 prefix conversion was not done before calculating.

Drill 5 — 1:45 — Wrong
Subnet 2 broadcast: gave 10.17.129.255, correct is 10.17.131.255
Two octets off in the third position. Block size error again.

## BASIC Session — Errors Broken Down

Drill 2 — 25:21 — Wrong
Broadcast: gave 10.0.125.240, correct is 10.0.125.239
Off by one. Broadcast = network address + block size - 1. Not network
+ block size. The -1 was skipped.

Drills 4 and 5 — Wrong
First usable: gave network address itself instead of network + 1
Last usable: gave broadcast address itself instead of broadcast - 1

The off-by-one errors on first and last usable are a separate problem
from block size. The formulas are not locked in automatically yet.

Network address = first address (not usable)
First usable = network + 1
Broadcast = network + block size - 1
Last usable = broadcast - 1

These four lines need to be automatic. Not calculated. Recalled.

## The Two Problems to Fix Before Next Session

Problem 1: Block size not locked in before calculating
Every SPLIT error and most BASIC errors come from this. Before writing
a single address down: identify the prefix, state the block size, write
it down. Then calculate.

Problem 2: Off-by-one on boundaries
Broadcast is network + block size - 1, not network + block size.
First usable is network + 1, not network.
Last usable is broadcast - 1, not broadcast.
These are getting mixed up under time pressure.

## Block Size Reference — Memorize Cold
/22 — 1024
/23 — 512
/24 — 256
/25 — 128
/26 — 64
/27 — 32
/28 — 16
/30 — 4

## Boundary Formulas — Memorize Cold
Network address:   base IP snapped down to nearest multiple of block size
Broadcast:         network + block size - 1
First usable:      network + 1
Last usable:       broadcast - 1
AWS usable hosts:  block size - 5

## What to Drill Next
Flashcard mode on block size before the next timed drill session.
Subnet 2, 3, 4 network addresses in SPLIT problems — error rate 2.1
Broadcast and last usable host — error rate 2.4
First usable host — error rate 2.4

## Cloud Connection
Cloud connection: Every off-by-one error in these drills would break a
real VPC. A broadcast address that is one off means the subnet boundary
is wrong and the next subnet overlaps. Overlapping subnets in AWS cause
routing failures that are silent until traffic hits the wrong destination.
A first usable host calculated as the network address itself means an
EC2 instance gets assigned an unroutable IP. These are not abstract
errors — they are the difference between a VPC that works and one that
routes traffic to the wrong place with no obvious error message.