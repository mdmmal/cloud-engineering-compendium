# DevOps Networking Trainer v2 — Redesign Prompt
## Implementation spec for the existing trainer app

---

## WHAT THIS PROMPT IS

This is the complete redesign spec for the networking trainer.
Paste this into the app or chat that manages the trainer.
Every section below is an instruction for what to build or change.

---

## THE CORE PROBLEM WITH v1

The current trainer:
- Tests networking knowledge you don't have yet
- Gives you a text box to type concepts into
- Has no visible output — no terminal, no commands, no consequence
- Shows 8 topics at once with no sequencing
- Has no connection to scripts you've already written
- Teaches nothing — it only quizzes

The redesigned trainer must teach first, then test.

---

## THE THREE MODES — REQUIRED FOR EVERY CONCEPT

Every concept in the trainer has exactly three modes.
The user moves through them in order.

### Mode 1 — LEARN
Teach the concept before testing it.
No questions. No text boxes. Just explanation.

Required sections in Learn mode:
1. THE CONCEPT — 2-3 sentences, plain English, what it is and why it exists
2. HOW IT WORKS — numbered steps, what actually happens when this concept is in play
3. WHAT BREAKS WITHOUT IT — one paragraph, the real cost of misconfiguration
4. THE COMMAND — which Linux command you use to inspect or diagnose this concept
5. SCRIPT CONNECTION — how this concept connects to a script the user has already written

The script connections to use:
- DNS → log_monitor.sh (watches service by hostname — DNS resolves the name)
- Routing → deploy_check.sh (runs on server inside VPC — route tables decide traffic path)
- NAT → backup_rotate.sh (private subnet server needs outbound internet — NAT enables it)
- Security Groups → readiness_check.sh (validates before deploy — SG must allow the new port)
- VPC Architecture → deploy_pipeline.sh (full pipeline runs across VPC components)
- Subnetting → provision_size.sh (sizing decisions require understanding IP ranges)

### Mode 2 — READ OUTPUT
Show real terminal output. Ask what it means.
No typing a concept explanation. Read the output and answer a specific question.

Required structure for each output scenario:
1. THE SITUATION — 2 sentences, what's happening, why you're running this command
2. THE COMMAND — the exact command as it would appear in a terminal
3. THE OUTPUT — fake but realistic terminal output, properly formatted
4. THE QUESTION — one specific question about what the output tells you
5. SHOW ANSWER button — reveals the full explanation
6. KEY LINES — after the answer, highlight 2-3 specific lines from the output
   and explain exactly what each one means

Each concept needs minimum 3 output scenarios:
- One showing healthy/working state
- One showing a failure state
- One showing an ambiguous state that requires further investigation

The output must look like a real terminal. Use monospace formatting.
Include realistic details: timestamps, IP addresses in RFC 1918 ranges,
realistic hostnames, realistic error messages.

### Mode 3 — DIAGNOSE
Full incident. Multiple outputs. Figure out what's wrong.

Required structure:
1. THE INCIDENT — written like a 2am Slack message from the on-call engineer.
   Plain English first (early concepts), technical language for later concepts.
   2-4 sentences maximum. Something is broken. Someone needs an answer.
2. TERMINAL OUTPUTS — show 2-3 command outputs side by side or stacked.
   The combination of outputs tells the story. No single output gives the answer alone.
3. THE QUESTION — "What is the problem and what do you fix?"
4. USER ANSWER BOX — text area for the user to type their diagnosis
5. SHOW ANSWER button — reveals full explanation including:
   - What the problem is
   - Why each output pointed to it
   - The exact fix
   - What would have happened if the wrong fix was applied
   - SCRIPT CONTEXT — how this incident connects to a script the user has written

---

## THE CONCEPT LIST AND SEQUENCE

Concepts unlock in order. Each one builds on the previous.
Do not show all concepts at once.

Unlock sequence:
1. DNS — unlocked by default (first concept)
2. Routing — unlocks after 1 successful Diagnose in DNS
3. NAT — unlocks after 1 successful Diagnose in Routing
4. Security Groups — unlocks after 1 successful Diagnose in NAT
5. VPC Architecture — unlocks after 1 successful Diagnose in Security Groups
6. Subnetting — unlocks after 1 successful Diagnose in VPC Architecture
7. TCP/IP Model — unlocks after 1 successful Diagnose in Subnetting
8. NACLs vs Security Groups — unlocks after 1 successful Diagnose in TCP/IP Model

This sequencing is intentional. Routing only makes sense after DNS.
NAT only makes sense after Routing. Security Groups only make sense after NAT.

---

## THE AWS CONNECTION — REQUIRED IN EVERY CONCEPT

Every concept must have an AWS CONNECTION section in Learn mode.
This prepares the user for what they'll see in the AWS console starting Week 8.

Examples:
- DNS → "In AWS: Route 53 is the authoritative DNS. VPC resolver is at CIDR base + 2.
  Private Hosted Zones create internal records visible only inside the VPC."
- Routing → "In AWS: Every subnet has a route table. Local route always wins for internal
  traffic. 0.0.0.0/0 → IGW = public subnet. 0.0.0.0/0 → NAT = private subnet."
- NAT → "In AWS: NAT Gateway sits in a public subnet. ~$0.045/hr + data charges.
  Private subnet route tables point 0.0.0.0/0 to the NAT Gateway."
- Security Groups → "In AWS: Stateful — inbound allow automatically allows return traffic.
  Instance-level, not subnet-level. All inbound denied by default."

---

## THE SESSION REPORT — REQUIRED AT END OF EVERY SESSION

When the user completes a concept (all three modes) or ends a session,
the trainer generates a session report in this exact format:

```
SESSION REPORT — [Concept Name]
Date: [date]
Modes completed: Learn / Read Output / Diagnose

Performance:
- Read Output scenarios completed: X of Y
- Diagnose scenarios attempted: X
- Diagnose scenarios correct first attempt: X

Weak areas:
- [specific output or scenario they struggled with]

DevOps connection made:
- [the script connection for this concept]

AWS connection to remember:
- [the AWS connection for this concept]

Post seed:
- [one post idea from this session]
  Example: "Diagnosed a DNS failure today using dig. Here's what NXDOMAIN
  actually means and when you see it in production."

What's next:
- [next concept that will unlock after completing this one]

Commit message to use:
networking: notes — [concept name] learn + diagnose session completed
```

---

## THE COMMAND REFERENCE — WHAT TO TEACH PER CONCEPT

DNS:
- Primary command: dig
- Secondary: nslookup, ping (to confirm IP vs name resolution)
- What to show: ANSWER section, NXDOMAIN, timeout, SERVER line

Routing:
- Primary command: traceroute
- Secondary: ip route, netstat -r
- What to show: successful multi-hop, asterisks (drop), single hop (local)

NAT:
- Primary command: curl (to external endpoint)
- Secondary: ping (to external IP), traceroute
- What to show: HTTP 200 success, connection timeout, refused vs timeout difference

Security Groups:
- Primary command: nc (netcat)
- Secondary: curl -v, telnet (port check)
- What to show: "succeeded", "connection refused" vs "connection timed out" difference

VPC Architecture:
- All of the above combined
- Scenarios that require running multiple commands and combining outputs

Subnetting:
- Primary command: ipcalc (if available), manual calculation
- Secondary: ip addr, ip route
- What to show: CIDR notation, network/broadcast addresses, usable range

TCP/IP Model:
- Commands at each layer: ping (L3), nc (L4), curl (L7)
- What to show: which layer each command operates at and what it tells you

NACLs vs Security Groups:
- Same commands as Security Groups
- Scenarios where SG is correct but NACL is blocking
- Show the difference in behavior (timeout vs refused)

---

## THE INCIDENT FORMAT — TWO LEVELS

Early concepts (DNS, Routing): Plain English incidents
"2am. The app is returning errors. The database is running.
The app server can't connect to it. Here's what you find when you investigate."

Later concepts (NAT, SG, VPC): Technical incidents
"23:47 UTC. CPU spike on prod-web-03 after deployment #847.
Health checks passed. Response latency spiked from 120ms to 4.2s.
Security group was modified 30 minutes before the deployment."

---

## WHAT THE REDESIGNED TRAINER DOES NOT DO

- Does not give text boxes to type concept definitions into
- Does not show all 8 concepts at once
- Does not test before teaching
- Does not give scenarios without incidents that created them
- Does not give answers without explaining why every output line matters
- Does not end a session without generating the session report

---

## THE OPENING SCREEN

When the user opens the trainer, they see:

1. One sentence: "This trainer teaches you to read a broken network
   the way an on-call engineer would."
2. Current unlocked concept (DNS by default)
3. A one-sentence description of the incident that will be used in Diagnose mode
   — shown before they start, so they know what situation they're building toward
4. Three mode buttons: LEARN → READ OUTPUT → DIAGNOSE
5. The script this concept connects to

Do not hit them with information immediately.
Pull them in with the incident first.

---

## VISUAL REQUIREMENTS

Terminal output must look like a terminal:
- Monospace font
- Dark background
- Realistic formatting including semicolons, brackets, indentation
- Highlight key lines after answer is revealed (different color or bold)

The incident text should feel urgent:
- Short sentences
- Real timestamps
- Real-sounding hostnames and IPs in RFC 1918 range (10.x.x.x, 172.16-31.x.x, 192.168.x.x)

Progress indicators:
- Show which mode the user is in (Learn / Read Output / Diagnose)
- Show which concept is active and which are locked
- Show session report button after concept is complete

---

## IMPLEMENTATION PRIORITY

If rebuilding in phases:

Phase 1 (minimum viable):
- DNS concept with all three modes
- Session report at end
- AWS connection in Learn mode
- Script connection banner

Phase 2:
- Routing and NAT concepts
- Concept unlock sequence
- Multiple output scenarios per concept

Phase 3:
- Remaining 5 concepts
- Full unlock sequence
- Cross-concept diagnose scenarios (require knowledge from multiple concepts)
