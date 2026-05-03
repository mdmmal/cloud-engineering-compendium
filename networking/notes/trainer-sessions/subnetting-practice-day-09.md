# Day 09 — Networking Notes
Date: 4/2/26
Source: Subnet drill trainer — SPLIT mode
Duration: 13:12 | Avg per drill: 2:15 | Score: 1/5 perfect

## What I Did
Drilled SPLIT subnetting — taking a base network and dividing it into equal
subnets across two availability zones. Five problems total. One perfect.
Identified a clear error pattern: wrong block size on almost every problem.

## Error Pattern — What Went Wrong

Most frequent mistake: wrong block size (11 out of missed answers)

The root cause is the same on every problem. Jumping to counting subnets
before locking in the prefix and block size first. The block size drives
every other calculation — broadcast, last usable, next subnet network
address. If the block size is wrong everything downstream is wrong.

The fix: prefix → block size → then everything else. In that order, no
exceptions.

## Drill Breakdown

Drill 1 — 2:55 — Wrong
Problem: Split 10.11.112.0/21 into 2 subnets
New prefix: gave /23, correct is /22
Block size at /22 is 1024, not 512
Host count: gave 507, correct is 1019
Subnet 2 network: gave 10.11.114.0, correct is 10.11.116.0
Subnet 2 broadcast: gave 10.11.115.0, correct is 10.11.119.255
Subnet 2 last usable: gave 10.11.114.0, correct is 10.11.119.254

What broke: borrowed 1 bit from /21 which gives /22, not /23. /22 has
10 host bits so block size is 2^10 = 1024. Counting up by 1024 from
10.11.112.0 — that spans multiple third octets. Subnet 2 starts at
10.11.116.0 because 10.11.112.0 + 1024 addresses carries through the
third octet. Broadcast is network + 1023 = 10.11.119.255.

Drill 2 — 2:17 — Wrong
Problem: Split 10.16.232.0/22 into 2 subnets
Subnet 2 network: gave 10.16.234.0, correct is 10.16.236.0
Subnet 2 broadcast: gave 10.16.233.0, correct is 10.16.239.255
Subnet 2 last usable: gave 10.16.232.0, correct is 10.16.239.254

What broke: same block size error. /22 into 2 subnets = /23. Block size
at /23 is 512. 10.16.232.0 + 512 = 10.16.236.0. Got the network address
wrong which cascaded to broadcast and last usable.

Drill 3 — 3:18 — Correct
Problem: Split 10.26.58.0/23 into 4 subnets — full details on Subnet 1
New prefix: /25. Block size: 128. AWS usable: 123.
Subnet 1: 10.26.58.0 — broadcast 10.26.58.127 — last usable 10.26.58.126
Subnet 2: 10.26.58.128
Subnet 3: 10.26.59.0
Subnet 4: 10.26.59.128
All correct. The cross-octet carry at Subnet 3 was handled correctly.

Drill 4 — 1:28 — Wrong
Subnet 2 broadcast: gave 10.4.130.255, correct is 10.4.131.255
Subnet 2 last usable: gave 10.4.130.254, correct is 10.4.131.254
One octet off on both. Block size calculation was right but the carry
into the third octet was missed by one.

Drill 5 — 1:16 — Wrong
Subnet 3 broadcast: gave 10.1.161.255, correct is 10.1.161.127
Subnet 3 last usable: gave 10.1.161.254, correct is 10.1.161.126
Used a block size of 256 instead of 128. Classic /24 assumption on a
problem that was actually a /25.

## The One Rule That Fixes Most of This
Prefix first. Block size second. Everything else third.

Do not touch network addresses, broadcast, or host counts until the block
size is confirmed. Write it down before calculating anything else. The
block size is the only number that matters until it is locked in.

Block size reference:
/22 — 1024 addresses
/23 — 512 addresses
/24 — 256 addresses
/25 — 128 addresses
/26 — 64 addresses
/27 — 32 addresses

## What to Drill Next
Subnet 2 broadcast and last usable — error rate 1.9
Subnet 3 broadcast and last usable — error rate 2.3
Subnet 1 broadcast and last usable — error rate 2.6
Block size recall from prefix — flashcard mode before next drill session

## Cloud Connection
Cloud connection: Every wrong answer today would break a real VPC. Subnet
2 starting at the wrong network address means the route table points to
dead space. A broadcast address that is one octet off means traffic hits
the wrong subnet boundary. In AWS these are not abstract errors — they
cause instances to be unreachable, routing to fail silently, and security
group rules to apply to the wrong range. Getting block size