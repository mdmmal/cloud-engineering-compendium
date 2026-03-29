# Day 05 — Linux Notes
Date: 3/26/26
Lab: LabEx — Linux Networking & Firewall Fundamentals

## What I Did
Worked through the full network troubleshooting workflow on a Linux machine.
Checked network interfaces and IP addresses, tested connectivity with ping,
inspected open ports and listening services, and configured a firewall using
ufw. Practiced the full incident response pattern: Observe, Identify, Isolate,
Remediate.

## Commands Learned
ip addr — shows all network interfaces and their IP addresses — ip addr
ifconfig — older alternative to ip addr, same purpose — ifconfig
ping — tests end-to-end reachability using ICMP — ping 8.8.8.8
ss — shows active sockets and listening ports — ss -tuln
netstat — older alternative to ss, same purpose — netstat -tuln
ufw enable — activates the firewall — sudo ufw enable
ufw allow — opens a specific port through the firewall — sudo ufw allow 80
ufw status — shows current firewall rules and whether it is active — sudo ufw status

## What Actually Happened (The Real Notes)
The biggest real-world lesson today: creating firewall rules is not the same
as enabling the firewall. I set up all the ufw rules correctly but the
firewall was not actually active until I ran ufw enable. Rules without
enabling = no protection. That order of operations matters and it is exactly
the kind of thing that causes silent failures in production — everything
looks configured but nothing is actually enforced.

The other thing that clicked: you have to know what you are looking for before
moving from step to step. Troubleshooting is not just running commands — it
is running the right command, reading the output, and knowing what it means
before deciding what to run next. If you cannot interpret what ip addr or ss
returns, the output is useless.

The incident response pattern makes this concrete:
Observe — what does the system show? (ip addr, ss, ufw status)
Identify — what is wrong or missing?
Isolate — is it the interface, the port, the firewall, or the app?
Remediate — fix the specific layer that is broken.

ping failing does not mean the server is down. It might mean ICMP is blocked
by a security group. That distinction matters in cloud environments where
security groups block ICMP by default — you can have a fully healthy EC2
instance that does not respond to ping.

ss vs netstat: ss is the modern replacement. Both show listening ports but
ss is faster and more detailed. The key thing to read in the output is
whether a service is bound to 0.0.0.0 (accessible from outside) vs 127.0.0.1
(localhost only, not reachable externally). A container that binds to
127.0.0.1 will show as running but return connection refused from outside —
which is a common production gotcha.

## Commands I Could NOT Remember From Memory
- ss flags: -tuln — had to look up what each letter means
  (t=TCP, u=UDP, l=listening, n=show port numbers not service names)
- ufw enable vs ufw allow — mixed up which one activates the firewall
  vs which one adds a rule

## Cloud Connection
Cloud connection: This entire lab is the AWS incident response toolkit.
When an EC2 instance is unreachable, this is the exact sequence: check the
ENI (Elastic Network Interface) with ip addr, test connectivity with ping
knowing security groups may block ICMP, use ss to confirm the app is actually
listening on the right port, and verify the security group rules mirror what
ufw does at the OS level. Security groups in AWS are the cloud-native version
of ufw — same concept, different layer. When Terraform or Kubernetes
deployments fail, these Linux commands are what you use inside a bastion host
or troubleshoot container to find out why.