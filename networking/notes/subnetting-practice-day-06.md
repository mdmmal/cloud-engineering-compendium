# Day 06 — Networking Notes
Date: 3/27/26
Source: Independent subnetting practice — SPLIT subnetting + AWS VPC context

## What I Did
Drilled two subnetting problem types: splitting a network into equal subnets
by borrowing bits, and splitting a /23 across two octets in an AWS VPC
context. Hit a real mistake on the /23 split and worked through exactly
why it was wrong.

## Core Mechanic: Splitting Into Equal Subnets
The pattern is always the same:
Subnets needed → find the power of 2 → that's bits to borrow
Add borrowed bits to base prefix → that gives new prefix
New prefix → calculate block size → count up by block size

Bits borrowed reference:
2 subnets  → 1 bit  → block 128
4 subnets  → 2 bits → block 64
8 subnets  → 3 bits → block 32
16 subnets → 4 bits → block 16

## Worked Example 1: Split 10.0.108.0/24 Into 4 Subnets

Step 1 — Bits to borrow
Need 4 subnets. 2^2 = 4 → borrow 2 bits
New prefix = 24 + 2 = /26

Step 2 — Block size
/26 = 32 - 26 = 6 host bits → 2^6 = 64 addresses per block

Step 3 — Usable hosts
64 - 2 = 62 usable hosts per subnet

Step 4 — Count up by 64
Subnet 1 = 10.0.108.0
Subnet 2 = 10.0.108.64
Subnet 3 = 10.0.108.128
Subnet 4 = 10.0.108.192

## Worked Example 2: Split 10.0.118.0/23 Into 2 Subnets (AWS VPC)

New prefix = /24 (borrowing 1 bit from /23)
Block size = 2^8 = 256 (one full /24 per subnet)
Usable hosts per subnet = 256 - 2 = 254 (251 in AWS)

Subnet 1 = 10.0.118.0
Subnet 2 = 10.0.119.0

## The Mistake I Made and Why
Added 256 to the last octet: 10.0.118.0 + 256 = 10.0.118.256
That is not valid. An octet maxes out at 255. When the block size is 256
or larger, the increment carries into the third octet — not the fourth.

118 + 1 = 119, last octet resets to 0 → 10.0.119.0

The rule: any time the prefix is smaller than /24, the block size is 256
or larger and the increment happens in the third octet. Flag it immediately
when you see /23, /22, or anything bigger.

## What to Keep Repping
- Bits to borrow table from memory — 2 subnets through 16 subnets
- Any time prefix is smaller than /24, watch the third octet not the fourth
- Practice /23 and /22 splits specifically — these will appear in VPC design

## Cloud Connection
Cloud connection: This is exactly how AWS VPC subnets are designed for high
availability. You split a large CIDR block across multiple availability zones
— each AZ gets its own subnet. A /23 split into two /24s gives you one subnet
per AZ with 251 usable hosts each. The /23 cross-octet problem is a real
gotcha when planning VPC address space — if you get the second subnet wrong
your entire routing table is broken before you even launch an instance.