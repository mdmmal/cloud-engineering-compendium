# Day 05 — Networking Notes
Date: 3/26/26
Source: Independent subnetting practice — 40 min reps

## What I Did
Drilled /27 subnetting from scratch. Worked through finding network address,
broadcast address, first and last usable host, and total usable hosts for
10.0.180.244/27. Built the mental model for how block size drives everything
else in the calculation.

## The Core Mechanic That Clicked
The number after the slash tells you how many bits are locked for the network.
The remaining bits are yours for hosts.

/27 = 32 bits total - 27 locked = 5 free bits
2^5 = 32 addresses per block

Once you know the block size, the rest is just math:
- Snap the IP down to the nearest multiple of that block size = network address
- Network address + block size - 1 = broadcast address
- Network + 1 = first usable host
- Broadcast - 1 = last usable host
- Block size - 2 = usable hosts (standard)
- Block size - 5 = usable hosts (AWS — reserves 5 IPs per subnet)

## Worked Example: 10.0.180.244/27

Step 1 — Network address
Last octet is 244. Find the nearest multiple of 32 that is ≤ 244.
32 x 7 = 224
32 x 8 = 256 (too high)
Network address = 10.0.180.224

Step 2 — Broadcast address
224 + 31 = 255
Broadcast = 10.0.180.255

Step 3 — Usable range
First usable = 10.0.180.225
Last usable  = 10.0.180.254

Step 4 — Host count
Standard: 32 - 2 = 30 usable hosts
AWS:      32 - 5 = 27 usable hosts
(AWS reserves 5 per subnet: network, broadcast, +3 for routing/DNS/future use)

## Prefix Cheat Sheet (Memorize This)
/24 — block 256  — usable 254
/25 — block 128  — usable 126
/26 — block 64   — usable 62
/27 — block 32   — usable 30
/28 — block 16   — usable 14
/30 — block 4    — usable 2

Each step up in prefix cuts the block size in half.
/30 is the floor for point-to-point links — exactly 2 usable addresses.

## What to Keep Repping
- Given any IP and prefix, find network and broadcast in under 60 seconds
- Know the cheat sheet above cold — no calculating, just recall
- Know the AWS 5-IP reservation rule — it will come up every time you
  build a VPC subnet

## Cloud Connection
Cloud connection: Every AWS VPC subnet is this math. When you create a
subnet with 10.0.1.0/24 you get 254 usable IPs by standard math but only
251 in AWS because of the 5 reserved addresses. When you size subnets for
a VPC you are doing exactly this — picking a prefix that gives you enough
hosts without wasting address space. A /27 giving 30 usable addresses is
a reasonable size for a small private subnet. A /28 giving 14 is tight but
workable for a database tier with few instances. This is the foundation of
every VPC design decision.