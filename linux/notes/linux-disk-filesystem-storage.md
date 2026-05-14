# Linux Networking Fundamentals
**Track:** Linux
**Source:** LabEx — Linux Networking Fundamentals
**Date:** 2026-05-13
**Week:** Week 5 | Phase 1

---

## What This Is

Every Linux machine connected to a network has interfaces, addresses, and routes. This lab covers how to see those things, test connectivity, diagnose failures layer by layer, resolve DNS names, inspect which services are listening on which ports, and download files from the command line. This is the diagnostic toolkit for any network-related incident.

---

## The Mental Models

**Network interface = mailbox.** The physical or virtual slot where network traffic enters and leaves the machine.

**IP address = house number.** The unique identifier that lets other machines find and send data to this one.

**Port = suite number in an office building.** The IP gets you to the building. The port gets you to the specific business inside it.

```
IP Address: 192.168.1.10   →  Building address
Port: 80                   →  Suite 80 (Web server)
Port: 22                   →  Suite 22 (SSH)
Port: 53                   →  Suite 53 (DNS)

Open port  = door is open, business is running
Closed port = nobody answers
```

**DNS = phone book.** You know the name (`google.com`). DNS looks up the number (IP address) for you. `/etc/resolv.conf` is the page of the phone book that tells your machine which phone book to call.

---

## The DevOps Connection

This is exactly how you debug an EC2 instance that can't reach other services. The questions are always:
- Can I reach my router (gateway)?
- Can I reach the internet?
- Can I reach the specific target?

The first "no" tells you where the problem lives. Security group? Route table? Internet gateway? Wrong DNS? Same layered logic, different tool names.

The root cause framework:
- Ping works + page won't load → DNS problem first
- Ping fails + network looks fine → routing or firewall
- Port closed → service crashed or never started
- Port open → service is running (even if unhealthy)

---

## Commands / Syntax

### Interfaces and Addresses
```bash
# List all network interfaces (hardware doors)
ip link

# Show IP addresses assigned to each interface
ip addr

# Common interfaces:
# lo       = loopback (127.0.0.1) — talking to yourself, internal only
# eth0     = primary external interface (wired)
# ens33    = same thing, different naming convention
```

### Connectivity Testing
```bash
# Test connection to an IP — sends N packets, shows if replies come back
ping -c 4 8.8.8.8

# Echo received = good
# No echo = bad (connection broken or blocked)
# Slow echo = high latency

# Find your gateway (your local router's IP)
ip route | grep default

# Test gateway connectivity first — always start local
ping -c 4 <gateway-ip>
```

**Troubleshooting sequence — always layer by layer, never guess:**
```
Step 1: ping 127.0.0.1        → Is my network stack alive?
Step 2: ping <gateway>        → Can I reach my router?
Step 3: ping 8.8.8.8          → Can I reach the internet by IP?
Step 4: ping google.com       → Is DNS working?
First "no" = where the problem lives.
```

### DNS Diagnostics
```bash
# Quick name-to-IP lookup
host google.com

# Detailed lookup — shows TTL, record type, resolver used
dig google.com

# Reverse lookup — IP to name
dig -x 8.8.8.8

# Check which DNS resolver this machine is using
cat /etc/resolv.conf
```

**Reading DNS failures:**
- `NXDOMAIN` = name not found (bad hostname or DNS doesn't know it)
- Timeout / hangs = resolver is unreachable (check `/etc/resolv.conf`)
- IP ping works but name doesn't = DNS failure, not network failure

**In AWS:** DNS failures usually mean VPC DNS settings are wrong or the resolver is misconfigured.

### Port Inspection
```bash
# List all open TCP ports — what doors are open?
ss -ltn

# List all open UDP ports
ss -lun

# Show open TCP ports AND which process owns each one
sudo ss -ltnp

# Check one specific port (is the web server running?)
ss -ltn | grep :80

# Check port 80 and who owns it
sudo ss -ltnp | grep :80
```

**Flag breakdown:**
| Flag | Means |
|---|---|
| `-l` | Listening (open, waiting for connections) |
| `-t` | TCP |
| `-u` | UDP |
| `-n` | Numeric (show `80` not `http`) |
| `-p` | Process (show which program owns the port) |

**What "listening" means:** The service has opened that network endpoint and is waiting. It doesn't guarantee the service is healthy, but it confirms something is running there.

### Downloading Files
```bash
# wget — simple, reliable download (delivery truck)
wget https://example.com/file.txt

# curl — Swiss Army knife, prints to screen by default
curl https://example.com/file.txt

# curl — check if a file exists without downloading it
curl -I https://example.com/file.txt

# curl — download and save with a custom filename
curl -o myfile.txt https://example.com/file.txt
```

**When to use which:**
- `wget` = just download a file, simple and done
- `curl` = testing APIs, checking headers, scripting HTTP requests

---

## Root Cause Analysis Pattern

When a service is unreachable, two possible causes:

```
NETWORK problem  = can't get to the machine at all (ping fails)
SERVICE problem  = machine is reachable but the port is closed (ping works, curl fails)

ping → success
curl → "Connection Refused"
Conclusion: SERVICE (the app isn't running, not a network issue)
```

---

## What I Got Wrong First

Testing IP connectivity and testing name resolution are not the same check. `ping 8.8.8.8` passing doesn't mean DNS works. `ping google.com` failing while `ping 8.8.8.8` succeeds means the network is fine and DNS is broken. Always test both separately.

---

## Quick Recall

- `ip link` = interfaces (the mailboxes), `ip addr` = IP addresses (the house numbers)
- `lo` = loopback (127.0.0.1), internal only
- `ip route | grep default` = find your gateway IP
- Layer-by-layer: self → gateway → internet IP → DNS name
- `ss -ltnp` = open TCP ports + which process owns each one
- Open port ≠ healthy service, but closed port = service is down
- `wget` = download, `curl` = download + API testing
- Ping works + nothing loads = check DNS first

---

## Connected To

Before: File system navigation, process monitoring  
After: SSH and secure file transfer, service management with systemd, firewall configuration, AWS security groups and VPC networking
