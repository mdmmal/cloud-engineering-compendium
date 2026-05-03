# Day 13 — Networking Notes
Date: 4/7/26
Source: Subnet drill trainer — BASIC mode + SPLIT mode

BASIC:  80% (4/5 perfect) | Duration: 14:05 | Avg/drill: 2:46 | Missed: 1
SPLIT:  60% (3/5 perfect) | Duration: 12:01 | Avg/drill: 2:19 | Missed: 7

## Progress Check
BASIC scores by session:
Day 11: 40%
Day 12: 60%
Day 13: 80%

That is a straight line up. BASIC is close to automatic. SPLIT still needs
work but the avg time per drill is dropping — 3:25 on Day 11, 2:19 today.
The math is getting faster even when the answers are wrong.

## BASIC Session

Four perfect drills. One error.

Drill 4 — Wrong
Total usable hosts: gave 512, correct is 510.
Gave the total address count instead of the usable host count. Block size
was 512 meaning the prefix was /23. Total addresses = 512. Usable = 512
- 2 = 510. Always subtract 2 for network and broadcast. This is the
standard calculation — AWS subtracts 5, standard subtracts 2.

That is the only error in the BASIC session. One mistake, clean on
everything else. The boundary formulas are starting to stick.

## SPLIT Session

Three perfect, two wrong.

Drill 1 — Wrong
New prefix: gave /24, correct is /23.
Borrowed 1 bit from a /22 base. /22 + 1 = /23, not /24. Used /24 block
size of 256 throughout a /23 problem where block size is 512. Everything
downstream was off by half.

AWS hosts: gave 251 (/24 answer), correct is 507 (/23 answer)
Subnet 2 network: gave 10.29.125.255, correct is 10.29.126.0
Subnet 1 broadcast: gave 10.29.125.254, correct is 10.29.125.255
Subnet 1 last usable: gave 10.29.125.253, correct is 10.29.125.254

All four wrong answers are exactly one position off from what /23 gives.
Used /24 math on a /23 problem. The prefix error came first and everything
else followed.

Drill 5 — Wrong
New prefix and AWS hosts flagged. Same block size root cause — prefix not
confirmed before calculating.

## What Is Actually Improving
BASIC boundary formulas are becoming automatic — broadcast, first usable,
last usable all correct across 4 of 5 drills today.
Speed is dropping consistently — from 3:25 avg to 2:19 avg in two sessions.
Single-subnet problems are close to reliable.

## What Still Breaks
SPLIT prefix calculation — still calculating the new prefix wrong before
starting. /22 into 2 subnets = /23, not /24. The log₂ step is the one
getting skipped under time pressure.

The fix is the same: state the new prefix out loud before writing anything
else down. New prefix = base + bits borrowed. Bits borrowed = log₂(subnets
needed). Write it. Confirm it. Then calculate block size from that prefix.

## Boundary Formulas
Network:       snap down to nearest multiple of block size
Broadcast:     network + block size - 1
First usable:  network + 1
Last usable:   broadcast - 1
Usable hosts:  block size - 2 (standard) / block size - 5 (AWS)

## Bits Borrowed Reference
2 subnets  → 1 bit
4 subnets  → 2 bits
8 subnets  → 3 bits
16 subnets → 4 bits

## Block Size Reference
/22 — 1024
/23 — 512
/24 — 256
/25 — 128
/26 — 64
/27 — 32
/28 — 16
/30 — 4

## Cloud Connection
Cloud connection: The /23 vs /24 prefix error is exactly the kind of
mistake that creates undersized subnets in a VPC. Designing a private
subnet with /24 when the requirement called for /23 cuts the available
host count in half — 251 usable instead of 507. In a production environment
that means running out of IP addresses mid-deployment when new instances
cannot be launched because the subnet is exhausted. Fixing it requires
destroying and recreating the subnet which takes down everything attached
to it. Getting the prefix right before building is cheaper than fixing it
after.