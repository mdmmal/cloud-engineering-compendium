# Day 09 — Networking Notes
Date: 4/2/26
Source: Jeremy's IT Lab — VLANs Part 1 (Day 16)
Tier: 1

## Summary
VLANs solve a problem that subnets alone cannot fix. Subnets separate
devices at Layer 3 but a switch only understands Layer 2. Even with three
separate subnets on one switch, a broadcast from any device still floods
to every port. VLANs create separate broadcast domains at Layer 2 so
traffic stays contained to the group it belongs to. The two reasons to use
VLANs are performance and security — less unnecessary broadcast traffic
and controlled access between departments.

## The Problem VLANs Solve

One switch, three departments: Engineering, HR, Sales. All on the same
192.168.1.0/24 network. Engineering sends a broadcast — every device on
every port receives it. Even after splitting into three subnets (/26 each),
the switch does not know about Layer 3. It sees a broadcast MAC (all Fs)
and floods out every port regardless of subnet. The departments are logically
separated at Layer 3 but still in the same broadcast domain at Layer 2.

Two options to fix it: buy a separate switch per department (expensive and
inflexible) or configure VLANs (one switch, multiple logical broadcast
domains).

## How VLANs Work

VLANs are configured on the switch on a per-interface basis. Each interface
gets assigned to a VLAN. The switch treats each VLAN as a completely
separate LAN — broadcast traffic arriving on a VLAN 10 interface only
floods to other VLAN 10 interfaces. VLAN 20 traffic stays in VLAN 20.

A switch never forwards traffic directly between VLANs. Inter-VLAN traffic
must go through a router. The router receives it, applies any security
policies, and sends it back to the switch on the destination VLAN interface.

## Key Terms

Broadcast domain: The group of devices that receive a broadcast frame sent
by any one member. Routers do not forward broadcasts so each router
interface defines a boundary.

LAN: A single broadcast domain. More specific than just "local area" —
if devices share a broadcast domain they are in the same LAN.

VLAN: A logically separated broadcast domain within a switch. Same physical
hardware, different Layer 2 boundaries.

Access port: A switch interface assigned to exactly one VLAN. Connects to
end hosts — PCs, servers. Gives the host access to its VLAN.

Trunk port: A switch interface that carries traffic for multiple VLANs.
Covered in the next video.

## VLAN Configuration (Cisco CLI)

Show existing VLANs:
show vlan brief

All interfaces are in VLAN 1 by default. VLAN 1 and VLANs 1002-1005
exist by default and cannot be deleted.

Assign interfaces to a VLAN:
interface range g1/0 - 3
switchport mode access
switchport access vlan 10

If the VLAN does not exist yet the switch creates it automatically when
the interface is assigned. Can also create manually:
vlan 10
name ENGINEERING

After configuring all three:
VLAN 10 — Engineering — G1/0 through G1/3
VLAN 20 — HR — G2/0 through G2/2
VLAN 30 — Sales — G3/0 through G3/3

show vlan brief confirms assignments and names.

## Quiz — Worked Through

Q1: How many broadcast domains in a network with no VLANs configured?
6 — each router interface plus everything connected to it is one broadcast
domain. Switches do not create boundaries, routers do.

Q2: How many broadcast domains with VLANs configured?
5 — one per configured VLAN plus the point-to-point link between the two
routers.

Q3: What happens if you assign an interface to a VLAN that does not exist?
B — the switch creates the VLAN automatically.

Q4: PC3 sends a broadcast. How many devices receive it?
3 — the switch, the router interface in VLAN 20, and the other PC in
VLAN 20. VLANs contain the broadcast to that group only.

Q5: You create VLANs 10, 20, 30. How many appear in show vlan brief?
C — 8 total. VLANs 1 and 1002-1005 exist by default (5 total). Add 3
more = 8.

## Glossary

VLAN: Virtual Local Area Network. A logical broadcast domain created on
a switch by grouping interfaces together regardless of physical location.

Access port: Switch interface belonging to a single VLAN. Default mode
for end host connections.

show vlan brief: Cisco command that lists all VLANs and their assigned
interfaces.

switchport mode access: Sets the interface to access mode — one VLAN only.

switchport access vlan [id]: Assigns the interface to a specific VLAN.

Inter-VLAN routing: Routing traffic between VLANs through a router.
Switches do not do this on their own.

## Hands-On Rep
Drew the three-department topology on paper. Labeled each interface with
its VLAN assignment. Traced a broadcast from Engineering and drew exactly
which interfaces it reaches with VLANs configured vs without. Traced a
unicast from Engineering to Sales showing the path through the router and
back. Worked all 5 quiz questions before checking answers. Got all correct.

## Cloud Connection
Cloud connection: VLANs are the on-premise version of what AWS does with
subnets and security groups inside a VPC. A public subnet and a private
subnet in the same VPC are logically separated the same way VLAN 10 and
VLAN 20 are separated on a switch. Traffic between them must pass through
a router or gateway where policies are applied. Security groups enforce
what traffic is allowed between subnets the same way a router enforces
inter-VLAN policies. Understanding VLANs makes VPC design intuitive
because the problem being solved is identical — contain broadcast domains,
enforce access control, separate departments or tiers at the network layer.

## What to Review Next Week
A switch never forwards directly between VLANs — always through a router.
VLANs 1 and 1002-1005 exist by default and cannot be deleted.
show vlan brief output — know what it shows and how to read it.