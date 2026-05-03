# Day 12 — Networking Notes
Date: 4/6/26
Source: Subnet drill trainer — BASIC mode
Score: 60% (3/5 perfect) | Duration: 20:12 | Avg/drill: 3:57 | Missed: 3

## What I Did
BASIC mode drill session. Five single-subnet problems. Three perfect. Two
wrong, both tracing back to the same two errors that have shown up in every
session: off-by-one on broadcast and last usable, and cross-octet carry
miscalculated.

## Improvement From Last Session
Day 11 BASIC: 40% (2/5)
Day 12 BASIC: 60% (3/5)
Moving in the right direction. Block size errors dropping. Off-by-one and
cross-octet errors are now the primary problems, not block size itself.

## Drill Breakdown

Drill 1 — 8:34 — Correct
Drill 2 — 4:01 — Wrong
Drill 3 — 3:22 — Correct
Drill 4 — 2:50 — Wrong
Drill 5 — 1:00 — Correct

## Errors Broken Down

Drill 2 — Off by one
Broadcast: gave 10.0.198.160, correct is 10.0.198.159
Last usable: gave 10.0.198.159, correct is 10.0.198.158

Added block size to network address without subtracting 1.
Broadcast = network + block size - 1. Not network + block size.
The -1 is not optional. It is always there. Every time.

Example: network 10.0.198.128, block size 32
Broadcast = 128 + 32 - 1 = 159. Not 160.
Last usable = 159 - 1 = 158.

Drill 4 — Cross-octet carry
Broadcast: gave 10.23.255, correct is 10.0.23.255
Dropped an octet entirely in the answer. Block size was 256 or larger
meaning the broadcast address lands in the next third octet. Wrote the
address with only three octets instead of four — a formatting error on
top of the cross-octet confusion.

Any time block size is 256 or larger the increment happens in the third
octet, not the fourth. Identify this before calculating. The moment the
prefix is /23 or smaller, flag it as a cross-octet problem and slow down.

## The Two Errors Still Showing Up Every Session

Off by one on broadcast:
Broadcast = network + block size - 1
Last usable = broadcast - 1
Write these out every time until they are automatic.

Cross-octet carry:
Any prefix smaller than /24 means block size is 256 or larger.
The carry happens in the third octet.
Flag it immediately when the prefix is /23, /22, /21, or larger.

## Block Size Reference
/22 — 1024
/23 — 512
/24 — 256
/25 — 128
/26 — 64
/27 — 32
/28 — 16
/30 — 4

## Boundary Formulas — Still Need to Be Automatic
Network:       base IP snapped to nearest multiple of block size
Broadcast:     network + block size - 1
First usable:  network + 1
Last usable:   broadcast - 1
AWS usable:    block size - 5

## Cloud Connection
Cloud connection: The off-by-one error on broadcast is the kind of mistake
that creates overlapping subnets in a VPC. If the broadcast address is
calculated as 10.0.198.160 instead of 10.0.198.159 the next subnet starts
at the wrong address and two subnets share an address. In AWS overlapping
CIDR blocks on subnets cause route table conflicts that are hard to
diagnose and require tearing down and rebuilding the subnet. One wrong
digit in the broadcast calculation breaks the entire address plan.