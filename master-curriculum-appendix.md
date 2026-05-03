# Master Curriculum Appendix
## Getting a Junior DevOps/SRE Role by December 2026
### Appended to Phase 1 + Phase 2 Plan — Built Around Real Gaps and Real Job Market

---

## THE NORTH STAR

**Target:** Junior DevOps Engineer or Cloud/SRE-adjacent role in DFW area.
**Target start date:** December 2026 / January 2027.
**Application window:** September 1 – November 30, 2026.
**Everything in this document serves that date.**

Not IT helpdesk. Not support. A role where you are writing scripts, managing infrastructure,
working in a terminal, and deploying things. That role exists and is achievable by December.
But only if the gaps are closed on a specific schedule.

---

## WHAT THE JOB MARKET ACTUALLY REQUIRES

Based on real junior DevOps postings pulled from Indeed, Glassdoor, LinkedIn, and Dice:

### The Non-Negotiable Stack (Every Posting Has These)
```
Linux           — navigate, manage processes, scripting, SSH
Python          — automation scripts, not web dev
Git/GitHub      — daily usage, branching, clean commit history
Docker          — containerize an app, write a Dockerfile
CI/CD           — GitHub Actions or Jenkins pipeline that actually runs
AWS             — EC2, S3, VPC, IAM, CloudWatch hands-on
Networking      — TCP/IP, DNS, subnetting, security groups (for troubleshooting)
```

### The Differentiators (What Separates You From Other Junior Candidates)
```
Terraform             — IaC, even at basics level
AWS Certification     — Cloud Practitioner minimum, SAA-C03 makes you competitive
A deployed project    — something live with a README and architecture diagram
Kubernetes basics     — not required but mentioned in 60%+ of postings
Prometheus/Grafana    — observability awareness
```

### What They Actually Test In Interviews
- "Walk me through this project" — they click your GitHub, read your README
- Linux troubleshooting scenarios — very similar to sadservers problems
- Networking diagnosis — "app can't reach database, what do you check?"
- CI/CD concept questions — "what happens between git push and production?"
- AWS architecture questions — "how would you design a highly available web app?"
- Scripting — "write a bash script that does X" or "explain this Python script"

### What Does NOT Get You the Job
- Watching videos without building anything
- Knowing concepts but having no GitHub proof
- A resume with vague bullets like "worked with Linux" or "familiar with cloud"
- No certification — signals you know it in theory only
- A quiet LinkedIn — recruiters check and they notice

---

## THE FIVE GAPS AND HOW EACH ONE CLOSES

---

### GAP 1 — NO DEPLOYED PROJECT
**Risk level: Highest. This is the gap that costs you the offer.**

You have skills. You have knowledge. You have trainers you built yourself.
None of that shows up when a recruiter clicks your GitHub and sees no deployed application.

**The project: Flask + MySQL + Docker + Jenkins on EC2**

This is the right project because it touches five skill buckets in one build:
Linux (EC2), Python (Flask), Docker (containers), CI/CD (Jenkins), AWS (deployment environment).
One project. Every major interview topic covered.

**Build sequence — do not skip steps:**

| Step | Action | Target Date |
|---|---|---|
| 1 | Clone a starter Flask app repo. Run it locally. Read every file. | Week 6 |
| 2 | Write a Dockerfile for the Flask app. Build it. Run it. | Week 6 |
| 3 | Write docker-compose.yml running Flask + MySQL together | Week 7 |
| 4 | Both containers run locally, app connects to DB | Week 7 |
| 5 | Launch EC2, SSH in, install Docker — document every command | Week 8 |
| 6 | Deploy containers to EC2. App accessible via public IP on port 5000 | Week 8–9 |
| 7 | Install Jenkins on EC2. Connect to GitHub repo | Week 9 |
| 8 | Write Jenkinsfile — pipeline triggers on push, builds image, deploys | Week 9–10 |
| 9 | Write README with architecture diagram showing full flow | Week 10 |
| 10 | Push to your own GitHub repo (not a fork) | Week 10 |
| 11 | LinkedIn post documenting the build including what broke | Week 10 |

**What makes this portfolio-grade (from Vishaka's video):**
- Your own repo, not a fork
- README with architecture diagram showing end-to-end flow
- Documented what broke and how you fixed it
- Every Jenkins build failure = a LinkedIn post
- Deploy it, destroy it, deploy it again — each cycle deepens understanding

**After this project is done, you have something to talk about in every interview.**
"Walk me through a project" is now answered with a live URL, a GitHub link,
and a story about specific problems you hit and solved.

---

### GAP 2 — NO CERTIFICATION
**Risk level: High. Gets you past the first resume filter.**

Without a cert, a recruiter scanning 200 resumes has no external signal your AWS knowledge is real.
With Cloud Practitioner, you pass the filter. With SAA-C03, you're competitive.

**Cloud Practitioner — Exam Date: July 15, 2026**
- Prep time: 2–3 weeks if you're doing AWS hands-on work concurrently
- Resource: AWS Skill Builder (free) + Tutorials Dojo practice exams
- Cost: $100
- What it proves: You understand AWS fundamentals. Not deep, but verified.
- Action: Schedule the exam at aws.amazon.com/certification TODAY.
  The date creates the pressure. Without the date it doesn't happen.

**SAA-C03 — Exam Date: September 15, 2026**
- Prep time: 6–8 weeks of serious study
- Resource: Stephane Maarek Udemy course + Tutorials Dojo practice exams
- Cost: $300
- What it proves: You can design solutions on AWS. This is what senior engineers have.
  At junior level it makes you stand out significantly.
- Start prep: August 1

**When you pass each cert:**
- Add it to LinkedIn immediately
- Add it to the resume certifications section
- Write a LinkedIn post: "Passed X. Here's what I actually had to understand to pass it."

---

### GAP 3 — COMMIT HISTORY IS INCONSISTENT
**Risk level: Medium-High. First thing a technical recruiter checks.**

Your GitHub contribution graph is public. Recruiters look at it.
A graph with gaps signals inconsistency. A graph that's green every day signals discipline.
You cannot fake this retroactively.

**The standard starting now:**
Every session — every single one — ends with:
```bash
git add .
git commit -m "topic: specific thing you did"
git push origin main
```

If you sat down and worked today, something gets committed.
If nothing got committed, nothing happened professionally.

**Commit message standard:**
```
linux: wrote system_check.sh — disk, memory, top 5 processes
python: api_caller.py v1 — calls GitHub API, parses JSON response
networking: Jeremy's IT Lab DNS video — 4 outputs + cloud connection note
bash: log_searcher.sh — takes word + filename, returns matching lines
aws: IAM lab — created user, role, policy with least privilege
docker: Dockerfile for Flask app — builds and runs locally
project: Jenkinsfile v1 — pipeline triggers on push, runs docker build
```

**Repo organization that recruiters expect:**
```
cloud-engineering-compendium/
├── linux/
│   ├── notes/          ← one .md per topic
│   └── scripts/        ← all .sh files here
├── python/
│   ├── notes/
│   └── scripts/        ← all .py files here
├── networking/
│   └── notes/          ← CCNA video outputs + cloud connections
├── aws/
│   └── notes/          ← hands-on lab notes
├── projects/
│   └── flask-docker-jenkins/   ← the follow-along project
└── README.md           ← updated every week
```

---

### GAP 4 — LINKEDIN IS QUIET
**Risk level: Medium. Recruiters actively search. You need to be findable and active.**

You have the voice established. The problem is volume.
14 days of daily scripting and zero posts about any of it.
That's content sitting unused.

**Profile — fix these right now:**

Headline (change to):
```
Aspiring DevOps Engineer | Linux • Python • AWS • Docker | Building in public
```

Skills section (add all of these):
```
Cloud: AWS, Infrastructure as Code
Systems: Linux, Bash Scripting, Shell Scripting, System Administration
Languages: Python, Git
Containers: Docker (add when project is running)
Networking: TCP/IP, DNS, Subnetting, Routing
CI/CD: Jenkins, GitHub Actions (add when built)
IaC: Terraform (add when learned)
```

GitHub link: In your header. Next to your name. Not in the About section buried at the bottom.

**Posting rhythm:**
One post per week. Sunday. Non-negotiable. Every week.
Not when the project is done. Not when you feel ready. Now.

**The three posts you write this week (content already exists):**

Post 1:
"14 days of writing Python and bash scripts daily. Here's what the actual output looks like."
[terminal screenshot of a script running]

Post 2:
"My biggest knowledge gap was networking. I built a scenario-based trainer to close it.
Here's why building the tool taught me more than any video."
[screenshot of the DevOps Network Trainer]

Post 3:
"Here's the first bash script I wrote that actually does something useful — system_check.sh.
Checks disk space, memory, and top 5 running processes."
[the script as a code screenshot]

**Post formula that always works:**
```
[What I was trying to do] + [what broke or what was hard] + [what I learned] + [screenshot]
```

**Post rules from the LinkedIn Compendium:**
- No external links in the post body — GitHub link goes in FIRST COMMENT after posting
- Always include a visual — terminal screenshot, diagram, code, GitHub graph
- 4–8 sentences only — not shorter, not longer
- Post Sunday, be available 90 minutes after posting to reply to comments
- No day counters ("Day 47 of my journey") — real work with screenshots only
- Replies to comments: acknowledge + add + ask a question. Never just "thanks!"

**Commenting — 2 posts per day, Monday through Friday:**
- Tier 1 people to follow and comment on every post:
  Kelsey Hightower, Danny Thompson, TechWorld with Nana, Leon Noel, Forrest Brazeal
- Comments must be 15+ words to have algorithmic weight
- Formula: Acknowledge + Add + Ask
- First 60 minutes after a post goes live = highest impact window

---

### GAP 5 — RESUME NOT FRAMED FOR DEVOPS
**Risk level: Medium. Vague bullets lose you the screen before a human reads it.**

**Header — must include:**
```
Jamal Muhammad
[City, State] | [email] | github.com/mdmmal | linkedin.com/in/[handle]
```

GitHub link is in the header. Not the footer. Not buried. The header.

**Skills section — must look like this:**
```
Cloud & Infrastructure:  AWS (EC2, S3, VPC, IAM, CloudWatch), Docker
Automation & Scripting:  Python, Bash, Git/GitHub
Networking:              TCP/IP, DNS, DHCP, NAT, Subnetting, Security Groups
Operating Systems:       Linux (Ubuntu), macOS
CI/CD:                   Jenkins, GitHub Actions
IaC:                     Terraform (basics)
```

Only list what you can talk about. Add tools as you build with them.

**Projects section — every bullet follows this format:**
Built [what] using [tools] that [does what / result]

Example bullets for the Flask project:
- Deployed a two-tier Flask + MySQL web application to AWS EC2 using Docker Compose,
  reducing environment setup to a single command
- Built a Jenkins CI/CD pipeline that triggers on GitHub push, builds a Docker image,
  runs integration tests, and deploys to EC2 automatically
- Configured VPC with public and private subnets, Internet Gateway, security groups,
  and NAT Gateway following AWS production architecture patterns

**What NOT to write:**
- "Familiar with Linux" → "Wrote 5 Bash scripts automating disk checks, log searching,
  and file backup; managed services using systemctl on Ubuntu"
- "Learning AWS" → "Built and configured VPC, EC2, S3, IAM, and CloudWatch on AWS
  Free Tier; deployed application to EC2 via Docker"
- "Working on DevOps skills" → list the specific thing you built

**Resume experience section:**
Experience goes at the top. If you have any tech-adjacent work — tutoring, lab assistant,
anything — it goes above projects. If not, projects are your experience section.
Bullet points must show outcome, not just activity.

---

## THE MASTER TIMELINE

This is the backbone. Everything maps to September 1.

### May 2026 — Close The Foundation
**Goal: Every Phase 1 exit criteria checked. Nothing skipped.**

| Week | Linux/Bash | Python | Networking | Career |
|---|---|---|---|---|
| Week 5 (now) | system_check.sh | file_organizer.py | Network Trainer daily + Jeremy's IT Lab | 2 posts this week using existing content |
| Week 6 | log_searcher.sh | json_reader.py | DNS + DHCP videos + 4 outputs | 1 post Sunday |
| Week 7 | backup.sh — all 5 done | api_caller.py | NAT + ACLs videos — draw VPC from memory | Phase 1 exit check |

**End of May checkpoint:**
- 5 bash scripts committed ✓
- 3+ Python scripts committed ✓
- VPC diagram from memory ✓
- 40+ commits ✓
- 4+ LinkedIn posts ✓
- Sadservers attempted weekly ✓

---

### June 2026 — AWS + Docker + Project Starts
**Goal: Hands-on AWS real. Docker fundamentals solid. Project steps 1–4 done.**

| Week | AWS | Docker/Project | Python | Career |
|---|---|---|---|---|
| Week 8 | IAM — users, roles, policies, least privilege | Clone Flask app, understand it, write Dockerfile | log_analyzer.py | Post: "Set up IAM. Here's what least privilege actually means." |
| Week 9 | Build VPC from scratch — public/private subnets, IGW, NAT, route tables, SGs | docker-compose.yml — Flask + MySQL running locally | cli_tool.py — all 5 scripts done | Post: "Built a VPC from scratch. Drew the architecture diagram." |
| Week 10 | Launch EC2, SSH in, install Docker, deploy containers to EC2 | App running on real EC2 server via public IP | First boto3 script — list EC2 instances | Post: "App deployed to EC2. Here's the architecture." |
| Week 11 | S3 bucket, file permissions, CloudWatch alarm on EC2 | Jenkins installed on EC2, connected to GitHub | boto3 script 2 — S3 bucket operations | Post: "CloudWatch alarm set up. Here's why monitoring matters." |

**Cloud Practitioner exam: July 15.**
Prep starts June 15. AWS Skill Builder + Tutorials Dojo.
3 weeks. 1 hour per day. Schedule the exam NOW.

---

### July 2026 — Project Complete + Cert
**Goal: Flask project fully deployed with CI/CD. Cloud Practitioner passed.**

| Week | Project | Cert Prep | Career |
|---|---|---|---|
| Week 12 | Jenkinsfile written — pipeline triggers on push | Cloud Practitioner — 2 practice exams | Post: "Jenkins pipeline running. Here's what happens on every git push." |
| Week 13 | Pipeline fully automated — build, test, deploy | Cloud Practitioner — 2 more practice exams | Post: "First Jenkins build failure. Here's what it taught me." |
| Week 14 | README written with architecture diagram | **July 15 — Cloud Practitioner exam** | Post: "Passed Cloud Practitioner. Here's what I had to actually understand." |
| Week 15 | Project polished. Second project planning begins. | SAA-C03 prep starts — Maarek course | Post: "Project complete. Here's the full architecture with every tool used." |

---

### August 2026 — Terraform + Kubernetes Basics + SAA-C03
**Goal: IaC basics real. Second project deployed. SAA-C03 deep in prep.**

| Focus | What You Build | Why |
|---|---|---|
| Terraform | Write Terraform config that provisions the same VPC + EC2 you built manually in June | Proves you understand IaC — required for most junior DevOps roles |
| GitHub Actions | Build a GitHub Actions pipeline as alternative to Jenkins — add to portfolio | More modern than Jenkins, widely used, shows both CI/CD tools |
| Kubernetes basics | Deploy Flask app to EKS (managed Kubernetes) — document everything | Shows container orchestration awareness |
| SAA-C03 | Maarek Udemy course — 1 hour per day minimum | Exam September 15 |

---

### September 2026 — Applications Open
**Goal: Resume final, portfolio complete, applying to 10+ roles per week.**

**September 1 — Start applying. This date is on your calendar.**

**What must be ready by September 1:**
- Resume with DevOps framing, GitHub in header, outcome-based bullets ✓
- Flask + Docker + Jenkins project live with README and architecture diagram ✓
- Terraform project live ✓
- AWS Cloud Practitioner certification on resume ✓
- LinkedIn active — 20+ posts, 30+ comments, 20+ followers in target field ✓
- 100+ commits in compendium with clear messages ✓
- Sadservers history — documented attempts in networking/notes/ ✓

**September 15 — SAA-C03 exam.**

**Where to apply:**
- LinkedIn Jobs — filter: Junior DevOps, Cloud Engineer, SRE, Infrastructure Engineer
- DFW specifically: search Dallas, Fort Worth, Irving, Plano, Austin (remote also)
- Indeed, Glassdoor, Dice — all three, same search terms
- Company careers pages directly: Oracle, AT&T, USAA, Lockheed Martin, American Airlines
  all have junior cloud/DevOps roles in DFW
- Look for "associate", "junior", "entry-level", "cloud engineer I" — same role, different titles

**Application volume:**
10 applications per week minimum. Not 2. Not 5. 10.
Quality matters but volume is what generates interview opportunities.
Track every application: company, role, date applied, status.

**Resume for each application:**
Same base resume. Adjust the skills section order to match the job posting's language.
If they say "infrastructure as code" — that phrase appears in your skills.
If they say "Terraform" — Terraform is first in your IaC bullet.

---

### October – November 2026 — Interviews
**Goal: Converting applications to offers.**

**The interview prep stack (start September 1, run parallel to applying):**

Linux troubleshooting: sadservers daily. Every problem is a potential interview question.

Networking diagnosis: DevOps Network Trainer daily. Applied difficulty only by now.

System design basics: How would you design a highly available web app on AWS?
Answer: Multi-AZ, ALB in public subnets, EC2 in private subnets, RDS Multi-AZ, S3 for static.
Practice saying this out loud. Draw it on paper. Time yourself.

CI/CD explanation: What happens between git push and production?
Answer: Push triggers webhook → Jenkins/GitHub Actions detects change → pulls code →
runs tests → builds Docker image → pushes to ECR → deploys to EC2/EKS → health check → done.
Know this cold.

Behavioral prep: "Tell me about a time you troubleshot a problem."
Every sadservers problem you solved is an answer. Every project build failure is an answer.
These need to be written down and practiced.

---

## THE DAILY NON-NEGOTIABLES

These five things happen every single day. No exceptions.

```
1. Networking       15–20 min Network Trainer OR 1 Jeremy's IT Lab video + 4 outputs
2. Python/Bash      Write or iterate on a script — something new added
3. Subnetting       5 problems minimum
4. Project work     At least 1 step forward on whatever project is current
5. Git close        git add . && git commit -m "specific message" && git push
```

And every Sunday:
```
6. LinkedIn post    4–8 sentences + screenshot. Be available 90 min after posting.
7. Week plan        Write Monday's first task before you close the laptop.
```

---

## WHAT THE VIDEOS CONFIRM ABOUT THIS PATH

From Vishaka (5 cloud projects):
- Recruiters care about what's on your resume and how it's structured — specifically
  the work experience and project sections. Projects fill the work experience gap.
- The five buckets hiring managers screen for: CI/CD, containerization, infrastructure
  provisioning, observability, AI ops. Your project touches the first three.
- Deploy, destroy, deploy again. Every cycle teaches you why you used that tool.
  That's the interview content.
- Good README with architecture diagram = gold to recruiters who love clicking.
- Troubleshooting teaches more than anything. Failed builds = future interview answers.

From TechWorld with Nana (cloud engineering roadmap):
- Linux and networking fundamentals are prerequisites, not nice-to-haves.
  Without them, cloud is just buttons you click without understanding why.
- Progressive project approach: static site → EC2 app → managed services →
  Terraform IaC → containerize → Kubernetes → CI/CD → monitoring → security.
  Your plan follows this exact sequence.
- CI/CD is the conductor. Everything else is an instrument. You need to understand
  every instrument before you can conduct.
- Certifications validate skills but shouldn't replace them. Pass by understanding,
  not memorization. The job will test the understanding.

From TechWorld with Nana (DevOps roadmap):
- DevOps is not entry-level. It's built on top of existing expertise.
  Your Linux + Python + networking foundation is what makes you legitimate.
- Everything in DevOps is code: infrastructure, config, pipelines, automation.
  Git is central to all of it.
- Kubernetes is predicated on a strong Linux foundation. Get Linux solid first.
  Kubernetes pays dividends but requires patience.
- Security is not a separate track — it's woven into every tool you learn.
  IAM policies, security groups, NACL rules — all of this is security.

From the live stream clips (your notes):
- 90 days to a cloud role is real if you put your head down. You're past day 1.
  The clock is running. Stop asking questions and go.
- Ready, fire, aim — not ready, aim, fire. Analysis paralysis costs more time
  than a wrong decision.
- Resume: experience at the top, outcome-based bullets, not activity descriptions.
  "Worked with Active Directory" means nothing. "Built X that did Y" is the format.
- Skip help desk. Go straight to the junior cloud/DevOps role. The portfolio
  and cert combination is how you do that without the experience years.
- Security+ → associate certs path if you want security-adjacent roles.
  SAA-C03 is the associate cert for your target path.
- Specify your target role and be able to describe DevOps in your own words.
  "I want a junior DevOps role" is not enough. You need to say what you'll do in it.

---

## HOW TO DESCRIBE DEVOPS IN YOUR OWN WORDS

You will be asked this. Practice saying it out loud until it sounds like you.

**The short answer (30 seconds):**
"DevOps is the practice of automating the gap between writing code and running it in production.
Instead of deploying manually, you build pipelines that do it automatically — test it, containerize it,
deploy it, and monitor it. My focus is on the infrastructure side: Linux servers, cloud environments,
and the automation that keeps everything running reliably."

**The answer that shows you understand it:**
"The way I think about it — DevOps is the conductor of an orchestra. Every tool plays a part.
Linux is the foundation everything runs on. Docker packages the application.
Kubernetes orchestrates the containers at scale. Terraform provisions the infrastructure as code.
Jenkins or GitHub Actions is the pipeline that triggers all of it automatically on every code push.
And Prometheus with Grafana watches it all and alerts when something breaks.
I'm building fluency with each instrument so I can understand the full system."

---

## THE INTENTIONALITY STANDARD

You said you want to be intentional. Here's what intentional actually means at this stage:

**Intentional is not:** watching videos, taking notes, feeling like you're learning.

**Intentional is:**
- Every session produces something committed to GitHub
- Every failure gets written down and becomes either a note or a post
- Every concept learned gets connected to a real tool or scenario you've touched
- Every week has a specific named deliverable — a script, a project step, a video output
- The September 1 application date is always visible and every week you ask:
  "what did I do this week that makes September 1 more achievable?"

**The test for any day:**
Open your GitHub. Does today have a commit?
If yes: what was committed? Is the message specific enough to know what you did?
If no: the day didn't count professionally, regardless of what you learned.

That's the standard. Not harsh. Just accurate to how this field works.
The proof is the product. The commit is the proof. Every day.
