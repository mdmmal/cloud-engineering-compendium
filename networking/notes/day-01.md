# Video 15 — Subnetting Part 3: Class A Networks and VLSM
Date: 3/25/26
Source: Jeremy's IT Lab — Day 15 (Final Subnetting Video)
Tier: 1

## Summary (Your Own Words)
This was the final subnetting video. It covered three things: quiz answers
from the previous video, subnetting Class A networks, and VLSM (Variable-Length
Subnet Masks). Class A subnetting works exactly the same as Class B and C —
the process is identical, the numbers are just bigger because you have 24 host
bits instead of 8 or 16. VLSM is how real networks are built — instead of
forcing every subnet to be the same size, you assign different prefix lengths
to each subnet based on how many hosts it actually needs. This wastes far less
address space than using one fixed prefix length for everything.

## Glossary
FLSM (Fixed-Length Subnet Masks): All subnets in a network use the same
prefix length. Simple but wasteful — small subnets get the same space as large ones.

VLSM (Variable-Length Subnet Masks): Subnets can use different prefix lengths.
Each subnet gets only as much space as it needs. More efficient, used in real networks.

Class A network: First octet is the network portion (/8). Leaves 24 bits for
subnetting and hosts — huge address space.

Network address: First address in a subnet, all host bits set to 0. Not usable
by a host.

Broadcast address: Last address in a subnet, all host bits set to 1. Not usable
by a host.

Usable hosts: Total addresses minus 2 (network and broadcast).

Point-to-point connection: A link between exactly 2 routers. Only needs 2
usable addresses, so /30 is the right prefix length (gives exactly 2 usable).

## Quiz Questions

Q1: What is the difference between FLSM and VLSM?
A1: FLSM uses the same prefix length for every subnet. VLSM uses different
prefix lengths so each subnet is sized to match how many hosts it actually needs.

Q2: You need 2000 subnets from a /8 network. How many bits do you borrow
and what prefix length do you use?
A2: Borrow 11 bits (2^11 = 2048, which covers 2000). /8 + 11 = /19.

Q3: When using VLSM, what order do you assign subnets in and why?
A3: Largest to smallest. You assign the biggest subnet first at the start of
the address space, then work down. This keeps the subnets organized and
prevents address space gaps.

Q4: A point-to-point router link needs how many usable addresses, and what
prefix length should you use for the CCNA exam?
A4: 2 usable addresses. Use /30 (gives 4 total, 2 usable). Not /31, even
though /31 technically works — the CCNA exam expects /30.

## Hands-On Rep
Work through the VLSM example from the video on paper.
Network: 192.168.1.0/24 divided into 5 subnets.

Assign in order from largest to smallest:
1. Tokyo LAN A — 110 hosts — use /25 — 192.168.1.0/25
   Network: 192.168.1.0  |  Broadcast: 192.168.1.127  |  Usable: 126

2. Toronto LAN B — 45 hosts — use /26 — 192.168.1.128/26
   Network: 192.168.1.128  |  Broadcast: 192.168.1.191  |  Usable: 62

3. Toronto LAN A — 29 hosts — use /27 — 192.168.1.192/27
   Network: 192.168.1.192  |  Broadcast: 192.168.1.223  |  Usable: 30

4. Tokyo LAN B — 8 hosts — use /28 — 192.168.1.224/28
   Network: 192.168.1.224  |  Broadcast: 192.168.1.239  |  Usable: 14
   (Note: /29 only gives 6 usable — not enough. Must use /28.)

5. Point-to-point — 2 hosts — use /30 — 192.168.1.240/30
   Network: 192.168.1.240  |  Broadcast: 192.168.1.243  |  Usable: 2

## Cloud Connection
Cloud connection: VLSM is exactly how AWS VPC subnets work. When you build
a VPC you assign different CIDR blocks to each subnet — a large public subnet
might be a /24, a private app subnet a /26, and a database subnet a /28.
You never give every subnet the same size. That is VLSM in practice.

## What to Review Next Week
VLSM steps from memory: largest to smallest, assign sequentially, pick the
tightest prefix length that still fits the host count.