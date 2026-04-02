# Day 08 — Networking Notes
Date: 4/1/26
Source: Independent subnetting practice — /23 VLSM drill

## What I Did
Worked through a full /23 split into 8 equal subnets. Focused on the
cross-octet carry problem — where block size math pushes the third octet
to increment. Pulled full details on Subnet 4 including broadcast and
last usable host.

## The Problem
Network: 10.17.86.0/23
Requirement: 8 subnets
Pull full details on Subnet 4.

## Step by Step

Step 1 — New prefix length
Need 8 subnets. 2^3 = 8 → borrow 3 bits.
23 + 3 = /26

Step 2 — Block size
/26 → 32 - 26 = 6 host bits → 2^6 = 64 addresses per subnet

Step 3 — Usable hosts (AWS)
64 - 5 = 59 usable hosts per subnet
(AWS reserves 5 per subnet: network, broadcast, +3 for routing/DNS/future)

Step 4 — Count up by 64 across the /23 range
A /23 spans two octets: 10.17.86.0 through 10.17.87.255 (512 total addresses).
Counting up by 64, the third octet carries when the fourth octet exceeds 255.

Subnet 1 — 10.17.86.0
Subnet 2 — 10.17.86.64
Subnet 3 — 10.17.86.128
Subnet 4 — 10.17.86.192
Subnet 5 — 10.17.87.0   ← carry happens here
Subnet 6 — 10.17.87.64
Subnet 7 — 10.17.87.128
Subnet 8 — 10.17.87.192

Subnet 5 is where the carry occurs. 192 + 64 = 256 — last octet resets
to 0, third octet increments from 86 to 87. Subnet 4 itself sits cleanly
within the .86.x range. The carry only happens at the boundary between
Subnet 4 and Subnet 5.

Step 5 — Subnet 4 full details
Network address:   10.17.86.192
Block size 64 → last address = 192 + 63 = 255
Broadcast:         10.17.86.255
Last usable host:  10.17.86.254
First usable host: 10.17.86.193
Usable hosts:      59 (AWS) / 62 (standard)

## The Cross-Octet Rule Reinforced
Any time the prefix is smaller than /24 the block size is 256 or larger
and the carry happens in the third octet. With a /26 the block size is 64
so multiple subnets fit inside the fourth octet before carrying — but the
carry still happens eventually. Track when 4th octet + block size exceeds
255 and that is exactly where the third octet increments and the fourth
resets to 0.

/23 in particular means 512 total addresses spread across two values of
the third octet. Every subnetting problem on a /23 or larger will cross
that boundary. Identify it early and count through it deliberately.

## Prefix Reference (Keep Handy)
/24 — block 256  — usable 254 standard / 251 AWS
/25 — block 128  — usable 126 standard / 123 AWS
/26 — block 64   — usable 62 standard  / 59 AWS
/27 — block 32   — usable 30 standard  / 27 AWS
/28 — block 16   — usable 14 standard  / 11 AWS
/30 — block 4    — usable 2 standard   / not practical in AWS

## What to Keep Repping
- Any /23 or larger: identify the cross-octet carry point before starting
- Pull full subnet details (network, broadcast, first/last usable) on any
  subnet in the sequence, not just the first one
- Know the AWS 5-reservation rule cold — it changes host counts on every
  VPC subnet calculation

## Cloud Connection
Cloud connection: This exact problem is VPC subnet planning. When designing
a VPC across two availability zones with a /23 address block, each AZ gets
subnets carved from that range. The carry from .86.x to .87.x is not an
error — it is expected and intentional. A /26 per subnet giving 59 usable
hosts is a realistic size for an application tier in a private subnet.
Getting Subnet 4's broadcast and last usable host right matters because
those boundaries define where one subnet ends and the next begins in the
route table. One wrong address and traffic routes to the wrong place.