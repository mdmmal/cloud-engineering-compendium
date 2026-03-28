# Day 03 — Networking Notes
Date: 3/26/26
Source: Independent subnetting deep dive (various videos)

## Summary
Subnetting is how you divide a network into smaller, more manageable pieces.
In cloud environments there are no IP address classes — everything is CIDR
notation. Understanding subnetting at the binary level is non-negotiable for
AWS VPC work. This session was math-heavy and focused on building the
mechanical skill of subnetting from scratch.

## The Core Analogy
An IP address works like a street address. Every street can have the same
street name, but each house has a unique number. An IP address works the same
way — the network portion is the street, the host portion is the house number.
Two devices on different networks can have the same host number as long as
their network portions differ.

## How IP Addresses Are Structured
- Every IPv4 address is 32 bits total
- Those 32 bits are split into two parts: network + host
- The subnet mask tells you where the split happens
- A subnet mask is always a continuous string of 1s followed by 0s — never
  mixed (no 10101010 style masks)

Example: 192.168.1.0/24
- /24 means the first 24 bits = network portion
- 32 - 24 = 8 bits remaining for hosts
- 2^8 = 256 total addresses
- 256 - 2 = 254 usable hosts (subtract network address and broadcast address)

## Binary Is the Foundation
You cannot subnet reliably without understanding binary. The subnet mask in
binary is what actually determines the boundary:

/24 in binary: 11111111.11111111.11111111.00000000
Dotted decimal: 255.255.255.0

/26 in binary: 11111111.11111111.11111111.11000000
Dotted decimal: 255.255.255.192

The 0s are your host bits. Count them, raise 2 to that power, subtract 2.
That is your usable host count.

## The Math Pattern (Memorize This)
| Prefix | Host Bits | Total Addresses | Usable Hosts |
|--------|-----------|-----------------|--------------|
| /24    | 8         | 256             | 254          |
| /25    | 7         | 128             | 126          |
| /26    | 6         | 64              | 62           |
| /27    | 5         | 32              | 30           |
| /28    | 4         | 16              | 14           |
| /29    | 3         | 8               | 6            |
| /30    | 2         | 4               | 2            |

Each step up in prefix length cuts the host count in half.
/30 is the smallest practical subnet — used for point-to-point links (2 hosts).

## Natural Masks vs CIDR
A natural mask is the default mask for a class of address — /8, /16, /24.
CIDR (Classless Inter-Domain Routing) throws out classes entirely and lets
you use any prefix length. In AWS there are no classes — everything is CIDR.
When you build a VPC you pick a CIDR block. When you create subnets inside
it you pick smaller CIDR blocks. This is all subnetting.

## Key Terms
CIDR notation: Writing a prefix length after the address with a slash.
192.168.1.0/24 — the /24 is the CIDR notation.

Network address: First address in a subnet. All host bits = 0. Not assignable.

Broadcast address: Last address in a subnet. All host bits = 1. Not assignable.

Usable hosts: Everything between network and broadcast.

Subnet mask: The 32-bit number that defines the network/host boundary.
Written as dotted decimal (255.255.255.0) or CIDR (/24) — same thing.

## What to Practice
- Convert a /24, /25, /26, /27, /28 to dotted decimal from memory
- Given a prefix length, state the usable host count without calculating
- Given an IP and prefix, identify the network address and broadcast address
- Do this on paper until it is automatic

## Cloud Connection
Cloud connection: Every AWS VPC is a CIDR block. Every subnet inside it is
a smaller CIDR block carved from that range. When you build a VPC with
10.0.0.0/16 and create a public subnet at 10.0.1.0/24 and a private subnet
at 10.0.2.0/24 — that is subnetting. You cannot build AWS infrastructure
without this. The math you did today is the exact math AWS uses under the hood.