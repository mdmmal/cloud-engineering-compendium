# Adjusted Curriculum — Weeks 5–12+
## Built around who you actually are, not who the original plan assumed

---

## THE HONEST REFRAME

The original 10-week plan assumed you'd be running LabEx labs as the primary vehicle.
You went further — you built trainers, wrote review systems, ran your own drills.
That's a higher ceiling than the plan expected. So the plan needs to match you.

What's real right now:
- Linux commands: solid. Running from memory.
- Bash: daily. Getting reps. Scripts getting written.
- Python: basics are there. Scripts are the gap — need to be written and committed.
- Networking: the biggest gap. Knowledge exists from videos but no execution vehicle.
  That's now fixed with the DevOps Network Trainer.
- Git/commits: inconsistent. Last commit was a week ago. This is the one discipline issue.
- LinkedIn: first post done. Voice established. Volume is missing.
- Follow-along project: named but not started.

Spring ball is over. You have real time back. This is the window.

---

## WHAT DOESN'T CHANGE

**The exit criteria are the exit criteria.** They're not arbitrary — every item on that list is
something a junior DevOps/SRE interviewer will test you on directly. Nothing gets skipped.

**Daily commits are non-negotiable.** Not because of rules — because a GitHub graph with
daily green squares is the most credible thing a self-taught engineer can show a recruiter.
It's visible proof of consistency over time. You cannot fake it retroactively.

**The sequence is still right:** Linux/Python/Bash/Networking → AWS → Docker → CI/CD → Terraform.
What changes is the intensity, the tools, and the project vehicle.

---

## THE ADJUSTED DAILY STACK

Every single day contains all five of these. Not "most days." Every day.

| Track | Daily Action | Done When |
|---|---|---|
| **Networking** | 15–20 min DevOps Network Trainer OR 1 Jeremy's IT Lab video + cloud connection note | Committed to `networking/notes/` |
| **Python** | CS50P problem set attempt OR current script iteration — bring it here for drill | `.py` file committed or session logged |
| **Bash** | Write or iterate one script — even one new line, one new function | Committed to `linux/scripts/` |
| **Subnetting** | Daily drill — 5 problems minimum | Logged |
| **Git close** | `git add . && git commit -m "..." && git push` | GitHub shows today's activity |

That's the floor. Every day. The follow-along project and sadservers stack on top.

---

## WEEKS 5–7 — CLOSE THE FOUNDATION GAPS

**The one goal for these three weeks:** Get every Phase 1 exit criteria checkbox to green.
You're not moving to AWS until the list is done. But the list is closer than it feels.

### Python — The Most Urgent Track

You have the concepts. The scripts don't exist yet. That's the only gap.

Script sequence — do these in order, one at a time, bring each one here:

| Script | What It Does | Concepts It Locks In |
|---|---|---|
| `file_organizer.py` | Reads a folder, counts files, finds biggest | loops, os module, conditionals |
| `json_reader.py` | Reads a config file, pulls fields, warns on missing | dictionaries, JSON, file I/O |
| `api_caller.py` | Calls GitHub API, formats the output | requests library, error handling |
| `log_analyzer.py` | Reads a log file, counts errors vs warnings | string parsing, counting patterns |
| `cli_tool.py` | Takes flags like --check-disk, --check-memory | sys.argv or argparse, subprocess |

**How we work on scripts together:** You open a new `.py` file. You write what you
think goes there — even if it's just comments describing what each section should do.
You bring it here. We drill it until you can write it without looking.
Then you commit it. That's the complete loop.

### Bash — Keep Building

You're already doing this daily. The named scripts that need to exist:

| Script | What It Does |
|---|---|
| `hello.sh` | Prints name + date |
| `file_counter.sh` | Counts files in a folder |
| `system_check.sh` | Disk space, memory, top 5 processes |
| `log_searcher.sh` | Takes a word + filename, finds matching lines |
| `backup.sh` | Copies folder with today's date in backup name |

If you've already written versions of these — commit them. Even v1 that partially works.
A committed imperfect script beats a perfect script that doesn't exist in the repo.

### Networking — Now Has a Structure

**Dual-track approach:**

Track A — Jeremy's IT Lab (CCNA Tier 1): one video per day, 4 outputs committed.
Priority videos for the exit criteria:

1. TCP/IP Model (how data actually moves)
2. IPv4 Addressing Parts 1 & 2
3. Subnetting Parts 1–3 + VLSM lab
4. Routing + Static Routes + Life of a Packet
5. VLANs Parts 1 & 2
6. DNS + DHCP labs
7. NAT + lab
8. Standard ACLs + lab
9. TCP/UDP + Wireshark lab

Track B — DevOps Network Trainer: minimum 3 scenarios per day.
Foundation difficulty until you're hitting Strong on 80%+ of them.
Then move to Applied.

**The networking exit test:** At the end of week 7, you draw a full VPC diagram from memory.
Public subnet, private subnet, IGW, NAT Gateway, route tables, security groups. No looking.
If you can draw it and explain every component, networking is done.

### Sadservers

Starts this Saturday. One problem. Easy difficulty.
You don't solve it in 40 minutes? Read the solution. Write notes on what you missed. Commit the notes.
That counts. The attempt is the rep.

---

## WEEK 7 — PHASE 1 EXIT CHECK

Run through every item on the exit criteria list.
Check the ones you can do from memory right now without assistance.
Anything unchecked = the focus of week 7.

The check isn't "do I understand it" — it's "can I do it right now in a terminal with no help."

**Linux checklist:**
- Navigate filesystem from memory (ls, cd, cat, grep, pipes)
- Check and kill processes (ps, top, kill)
- Manage services (systemctl start/stop/status)
- Edit a file in vim (open, type, save, quit)
- 3+ bash scripts written and committed
- ping, curl, dig from memory

**Python checklist:**
- variables, lists, dicts, loops, if/else, functions — write them cold
- Read and write files
- Parse JSON
- try/except
- 5 scripts committed

**Networking checklist:**
- Explain IP addresses and subnet masks in plain English
- Subnet a /24 into /26s on paper
- Explain routing, DNS, DHCP, NAT in plain English
- Draw a VPC from memory
- All Tier 1 CCNA priority videos done with notes committed

**Git/Career checklist:**
- 40+ commits with clear messages
- Organized repo: linux/, python/, networking/
- 4+ LinkedIn posts
- 20+ people followed
- 30+ comments made

---

## WEEKS 8–10 — AWS HANDS-ON (Phase 2 Entry)

Once the exit criteria are checked, this is what happens.

**Week 8 — IAM + Account Setup**
- AWS free tier account created if not already
- IAM: create a user, create a role, attach a policy, understand least privilege
- Commit: notes on what IAM is and why it exists
- LinkedIn post: "Set up IAM for the first time. Here's what least privilege actually means."

**Week 9 — Build a VPC from Scratch**
- Public subnet + private subnet
- Internet Gateway attached
- NAT Gateway in public subnet
- Route tables configured for both subnets
- Security groups for a web server and a database
- This is where every networking concept you drilled pays off.
- Commit: architecture diagram + notes on every decision made
- LinkedIn post: "Built a VPC from scratch. Here's what each component does and why."

**Week 10 — EC2 + S3 + CloudWatch**
- Launch EC2 inside your VPC. SSH into it using your Linux skills.
- Create S3 bucket, upload files, set permissions.
- Create a CloudWatch CPU alarm on the instance.
- Commit: screenshots + notes
- LinkedIn post: "SSHed into an EC2 instance inside a VPC I built. Terminal screenshot."

---

## THE FOLLOW-ALONG PROJECT — Named and Structured

This is what you're building toward. Not right now — after week 10.
But it needs to be named so you know what you're working toward.

**Project: 2-Tier Web App — Flask + MySQL, Docker + Jenkins, deployed on EC2**

This is the first real portfolio project. It touches every bucket simultaneously:
- Linux (EC2 is a Linux server)
- Python (Flask is Python)
- Docker (packages the app and database)
- CI/CD (Jenkins pipeline triggers on every GitHub push)
- AWS (EC2 is the deployment environment)

**The flow you'll build:**
1. Flask app + MySQL database — working locally
2. Dockerize both — Flask in one container, MySQL in another, Docker Compose runs both
3. EC2 instance set up — Jenkins installed, GitHub connected
4. Jenkins pipeline — triggers on push, builds Docker image, runs tests, deploys
5. App accessible on port 5000 from the internet

**What makes it portfolio-grade:**
- Your own GitHub repo (not a fork)
- README with architecture diagram showing the full flow
- Notes on every Jenkins build that failed and what fixed it
- LinkedIn posts documenting the build — including the failures

**When it starts:** After week 10. After the VPC and EC2 foundations are real.
You don't Docker before you understand what you're deploying to.

---

## SUMMER (June–August) — Phase 2 Full Depth

By the time summer hits, the foundation is locked. This is the acceleration window.

**June — Docker + First Project Running**
- Docker fundamentals: images, containers, Dockerfile, Docker Compose
- Flask + MySQL project fully Dockerized and running locally
- Jenkins installed and pipeline running on EC2
- First project committed and documented

**July — CI/CD + Terraform Intro**
- GitHub Actions pipeline built (modern alternative to Jenkins)
- Understand the difference between Jenkins and GitHub Actions — both in the portfolio
- Terraform basics: init, plan, apply, destroy
- Write a Terraform config that provisions the EC2 + VPC from code instead of console clicks

**August — Kubernetes Intro + SAA-C03 Prep Begins**
- EKS basics: deploy the Flask app to a managed Kubernetes cluster
- SAA-C03 prep starts: Stephane Maarek Udemy course
- Tutorials Dojo practice exams begin

---

## THE LINKEDIN RHYTHM — REBUILT

You have the voice. "Box. Finish." energy carries into posts.
What's been missing is volume. Here's the new rhythm:

**Post triggers (anything that happens = potential post):**
- Script that errored out and what fixed it
- Sadservers problem attempted — solved or not
- Networking concept that finally clicked
- Jenkins build that failed 6 times before working
- VPC diagram you drew from memory for the first time
- Any terminal screenshot that shows something real happening

**Frequency:** Once per week minimum. You have enough daily activity to generate 3+ posts per week
if you're paying attention to what's happening in your sessions.

**Post formula that always works:**
```
[What I was trying to do] + [what broke] + [what I learned] + [screenshot]
```

That's it. That formula works for every stage of this journey.

---

## THE REAL INTENTIONALITY STANDARD

You said you can feel yourself becoming DevOps-adjacent. That feeling is accurate.
The tools you built, the daily scripting, the trainers — that's not watching videos.
That's building muscle.

The intentionality gap that remains is specifically this:
**Things happen in your sessions that don't get committed and don't become posts.**

A bash script that errors out is valuable. A Python function you had to rewrite three times is valuable.
A sadservers problem you couldn't solve is valuable. None of it is valuable if it stays in your head.

The commit is the proof. The post is the signal. Together they build the track record.

**The adjusted standard:** If you sat down and did work today, three things must happen.
1. Something was committed.
2. The commit message is specific enough that you know what you did six months from now.
3. If something interesting happened — broke, clicked, confused you, surprised you — it goes on the list for this week's LinkedIn post.

That's intentionality with teeth.
