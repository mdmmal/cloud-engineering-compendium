# Day 07 — Networking Notes
Date: 3/31/26
Source: Jeremy's IT Lab — Life of a Packet (Day 12)
Tier: 1

## Summary
This video tied everything together. Followed a single packet from PC1 to
PC4 across multiple routers and watched exactly what happens at each hop.
The big takeaway: the IP header never changes end to end. What changes at
every hop is the Ethernet header — each router strips the old MAC addresses
and rewrites them for the next leg. The IP address is the final destination.
The MAC address is only ever the next stop.

## How a Packet Actually Travels

PC1 (192.168.1.1) wants to reach PC4 (192.168.4.1). Different networks so
PC1 cannot send directly — has to go through its default gateway. Path taken:
PC1 → R1 → R2 → R4 → PC4.

Every hop follows the same three steps:
1. Receive frame, strip the Ethernet header (de-encapsulation)
2. Look up destination IP in routing table, find next hop
3. ARP for next hop MAC if unknown, wrap packet in new Ethernet header
   (re-encapsulation), send it out

The IP header rides through untouched the entire time.
Only the Ethernet header gets rewritten at each router.
Switches never touch either — they just forward and learn MAC addresses.

Hop by hop:

PC1 → R1
PC1 does not know R1's MAC. Sends ARP broadcast. R1 replies with AAAA.
Frame out: src MAC 1111, dst MAC AAAA, src IP 192.168.1.1, dst IP 192.168.4.1

R1 → R2
R1 strips Ethernet header. Routing table says next hop is 192.168.12.2 (R2).
ARPs for R2, gets CCCC back.
Frame out: src MAC BBBB, dst MAC CCCC. IP header unchanged.

R2 → R4
R2 strips header. Next hop is 192.168.24.4 (R4). ARPs for R4, gets EEEE.
Frame out: src MAC DDDD, dst MAC EEEE. IP header unchanged.

R4 → PC4
R4 strips header. 192.168.4.0/24 is directly connected. ARPs for PC4,
gets 4444 back.
Frame out: src MAC FFFE, dst MAC 4444. IP header unchanged.

## The Two Rules That Do Not Break

1. The destination IP never changes. From the moment PC1 sends to the moment
   PC4 receives, the destination IP is always 192.168.4.1. Routers do not
   touch the IP header.

2. The destination MAC is always only the next hop — never the final
   destination. PC1 puts R1's MAC as destination, not PC4's. R1 puts R2's
   MAC. And so on. MAC addresses are local. IP addresses are global.

## ARP Behavior Worth Noting

ARP runs every time a device does not know the MAC of the next hop.
Request goes out as a broadcast. Reply comes back unicast because the
target already learned the requester's MAC from the request itself.

Once ARP runs the result is cached. On the return trip from PC4 to PC1
there are zero ARP requests — every device already knows the next hop MAC.
First packet on a new path is always slightly slower because of this.

## Quiz — Worked Through

PC4 sends a packet to PC1 for all five questions.

Q1: Destination MAC leaving PC4's interface?
FFFE — R4's G0/2. PC4 sends to its default gateway first, not directly
to PC1. Default gateway for PC4 is R4.

Q2: Source MAC received on R1's G0/0?
CCCC — R2's G0/0. R2 was the previous hop so R2's MAC is the source.
Missed this one initially — confused myself thinking about R1 instead of
who sent the frame to R1.

Q3: Source MAC sent from SW1's G0/1?
AAAA — R1's G0/2. SW1 does not rewrite anything. Forwards the frame
exactly as received. Source MAC is whoever handed it to SW1, which is R1.

Q4: Destination IP sent from R4's G0/1?
192.168.1.1 — PC1's IP. IP header never changes. Destination is always
the final endpoint no matter which router is currently forwarding.

Q5: Source IP received on R1's G0/0?
192.168.4.1 — PC4's IP. Same reason. Source IP never changes in transit.

## Glossary

Encapsulation: Wrapping data in a header before sending. At Layer 2 this
means adding an Ethernet header with source and destination MAC addresses.

De-encapsulation: Stripping the header when a frame arrives. Routers do
this at every hop to read the IP header underneath.

ARP: How a device learns the MAC address of another device when it only
knows the IP. Broadcast request, unicast reply.

Default gateway: The router a device sends traffic to when the destination
is outside its local network.

Next hop: The immediately adjacent device a packet gets forwarded to. Not
the final destination — just the next stop.

MAC address scope: Local only. Only relevant on the current network segment.
Gets rewritten at every router.

IP address scope: End to end. Identifies original source and final
destination. Never changes in transit.

## Hands-On Rep
Drew the full topology on paper with all MAC addresses labeled at each
interface. Traced the packet PC1 to PC4 and wrote the src/dst MAC and
src/dst IP at every single hop. Then traced the return trip. IP header
flips source and destination on the return but the MAC hop logic stays
identical.

Worked all 5 quiz questions before checking. Got Q2 wrong first pass —
the source MAC on R1's incoming interface is the previous hop (R2), not
R1 itself. Makes sense in hindsight but had to think it through.

## Cloud Connection
Cloud connection: This is how AWS VPC routing works under the hood. When
an EC2 instance in one subnet sends traffic to an instance in another
subnet it goes through an implicit router. The IP header stays the same
end to end. The ENI MAC addresses get rewritten at each hop exactly like
this. A route table entry pointing to a NAT gateway or internet gateway
as next hop is the same logic R1 uses when it looks up 192.168.4.0/24
and finds R2. AWS just abstracts the physical layer away.

## What to Review Next Week
The two rules cold: IP never changes, MAC is only ever the next hop.
State the src/dst MAC and IP at any hop in a multi-router path without
drawing it out first.