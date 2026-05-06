# Video Notes — Week 5 Synthesis
> Sources: Vishaka (5 cloud projects), TechWorld with Nana (cloud roadmap + DevOps roadmap), live stream clips
> Processed through 4 passes — organized by my context, gaps, and intentions

---

## WHAT THESE VIDEOS CONFIRM ABOUT MY PLAN

All three creators independently land on the same stack order I'm already in:

```
Linux → Python/Bash → Git → Networking → Docker → Kubernetes → CI/CD → Terraform → Observability
```

I didn't guess into the right sequence. The curriculum was built correctly.
The question now is execution depth, not direction.

**The deploy/destroy mental model (Vishaka):** Don't just complete a project — deploy it, destroy it,
deploy it again. Every cycle teaches you *why* you used a specific tool. That's the interview answer
and the LinkedIn post. Breaking things intentionally builds more knowledge than smooth completions.

**90 days is real but conditional (live stream):** Head down. No analysis paralysis.
Ready, fire, aim — not ready, aim, fire. I'm 5 weeks in. The clock is running.

---

## THE NETWORKING GAP — NAMED AND ADDRESSED

### Why it's not optional

Nana's exact scenario: app goes down, you can't debug without knowing DNS, routing,
security groups, and firewalls. Without networking fundamentals, cloud is just clicking
buttons you don't understand.

Subnetting knowledge is real. But subnetting alone is not networking.
The gap is the *movement of packets* — how data actually gets from A to B and what stops it.

### What "enough" looks like for my timeline

I need to be able to explain these without looking:

| Concept | What I need to know |
|---|---|
| Subnet | A range of IPs within a network, isolated segment |
| Route table | Decides where traffic goes based on destination IP |
| Internet Gateway (IGW) | Entry/exit point for a VPC to reach the internet |
| NAT Gateway | Lets private subnet resources reach internet, blocks inbound |
| Security Group | Stateful firewall — controls inbound/outbound at instance level |
| ACL | Stateless firewall — controls inbound/outbound at subnet level |
| DNS | Resolves domain names to IP addresses |
| DHCP | Automatically assigns IPs to devices on a network |

**That is the VPC-ready bar.** Everything above unlocks AWS VPC work in Phase 2.
VLANs, BGP, OSPF — that's depth built over time. Not the immediate target.

### The fix

Resource is already in the plan: Jeremy's IT Lab (CCNA Tier 1).
The fix is not a new resource. It's execution — daily, with the 4-output workflow.
Networking needs a daily slot the same way Python and bash are locked in.

**Daily networking minimum:** One Jeremy's IT Lab video + 4 outputs committed to compendium.
Subnetting drill stays daily. Both committed.

---

## THE 5 PROJECT BUCKETS — WHERE I'M HEADED

These are the architecture patterns recruiters actually screen for (Vishaka).
I'm not building these now — but I need to know what I'm building toward.

| Bucket | What It Is | Tool I'll Use |
|---|---|---|
| CI/CD | Automate code from commit to production | Jenkins → GitHub Actions |
| Containerization | Package and orchestrate apps | Docker → Kubernetes |
| Infrastructure Provisioning | Define infrastructure as code | Terraform |
| Observability | Monitor, alert, trace production systems | Prometheus + Grafana |
| AI Ops | Use AI to assist DevOps workflows | Python + LLM APIs |

**First follow-along project when scripting is stable:**
2-tier web app — Flask + MySQL, Docker + Jenkins, deployed on EC2.
That single project fills the CI/CD bucket and touches containers, Linux, and AWS simultaneously.

**What makes a project portfolio-grade (Vishaka + Nana):**
- Push to your own GitHub repo (not just fork someone else's)
- Write a README with an architecture diagram showing end-to-end flow
- Document what broke and how you fixed it
- Recruiters click — give them something worth clicking

---

## THE DEVOPS ROADMAP AS A LAYERED SYSTEM (Nana)

### The Orchestra Analogy — how to think about CI/CD

The CI/CD pipeline is the conductor. Every other tool (Docker, Kubernetes, Terraform, Prometheus)
is a musician. The conductor tells each one what to do, when, and in what order.

That's why CI/CD integrates with every tool — it's orchestrating all of them.
That's also why you need to understand each tool before building the pipeline.
You can't automate what you don't understand manually first.

### The 4 Stages in Order

**Stage 1 — Prerequisites (where I am now):**
Linux, Git, basic package management. These are non-negotiable foundations.
Git is especially important: in DevOps, everything is code. Infrastructure, pipelines,
config — all of it lives in a repo and gets reviewed like application code.

**Stage 2 — Fundamentals (next):**
Docker first. Then artifact repositories (where built images are stored). Then cloud basics.
Docker solved the "works on my machine" problem — it packages the app AND its entire environment together.

**Stage 3 — Core (Phase 2 start):**
Kubernetes manages containers at scale — it's the automated operations engineer
that restarts crashed services, balances load, and scales up/down automatically.
Then advanced AWS (EKS, VPC depth, IAM). Then CI/CD pipelines.

**Stage 4 — Advanced (Phase 2 depth):**
Terraform/Pulumi (infrastructure as code), Python automation, Ansible (config management),
Prometheus/Grafana (observability). Security woven throughout every layer.

---

## KUBERNETES — WHAT IT ACTUALLY IS

Common confusion: containers vs pods.
- A **container** is the packaged application with its dependencies.
- A **pod** is the smallest deployable unit in Kubernetes. Containers run *inside* pods.
- Think: pod is the wrapper that Kubernetes manages, container is what's inside it.

Kubernetes turns hundreds of Linux servers into one giant machine.
Services deployed on it can talk to each other as if they're on the same machine.
It's also the self-healing layer — if a service dies, Kubernetes restarts it automatically.

Managed Kubernetes services (EKS on AWS, AKS on Azure, GKE on Google Cloud):
The cloud provider manages the control plane. I manage my workloads.
This is how most companies run Kubernetes — not self-hosted from scratch.

---

## TERRAFORM — WHY IT MATTERS

Terraform is cloud-agnostic — the same skill works on AWS, Azure, GCP.
It's declarative: I describe the infrastructure I want, Terraform figures out how to build it.

**The lifecycle I need to know:**
```
terraform init     → initialize the working directory
terraform plan     → preview what will be created/changed/destroyed
terraform apply    → build the infrastructure
terraform destroy  → tear it all down
```

**Key concepts for interviews:**
- **Modules:** reusable, repeatable config blocks (don't rewrite the same infra twice)
- **State management:** Terraform tracks what it built in a state file. Local vs remote state is an interview question.
- **Drift detection:** Terraform can detect when real infrastructure doesn't match the code

Cloud Formation (AWS-only) is similar but locked to AWS.
Terraform works everywhere — learn Terraform first.

---

## OBSERVABILITY — THE PROMETHEUS STACK

When production breaks at 2am and there's no monitoring, you're checking every component manually.
That's the problem observability solves.

**The three layers:**
- **Monitoring** = the alarm system (alerts when something's wrong)
- **Logging** = the cameras (records everything that happened)
- **Observability** = the full system — alarms, cameras, playback, dashboards

**The standard open-source stack:**
- **Prometheus** — scrapes metrics from apps and infrastructure (CPU, RAM, error rates, request rates)
- **Grafana** — visualizes those metrics as dashboards and charts
- **Alert Manager** — sends notifications when thresholds are crossed (part of Prometheus)

**For AWS-native:** CloudWatch (monitoring) + CloudTrail (audit logging)

---

## RESUME + LINKEDIN — DIRECT CALLOUTS

**Resume bullet problem (live stream):**
Bad: "Worked with Active Directory to facilitate user onboarding"
This means nothing. It's vague and shows no outcome.

Good bullets show: what I did + what it affected + what the result was.
Example pattern: "Wrote a bash script that automated X, reducing Y from Z to W"

**Experience goes at the top** — not buried. That's the biggest structural mistake on resumes.

**Portfolio gap filler:** Personal projects are the experience when work experience doesn't exist yet.
The cloud space is one of the few fields where a well-documented project with a clean GitHub repo
and architecture diagram can carry the same weight as a job entry.

**LinkedIn — the intentional play:**
Failures and attempts create more content than smooth wins.
Every bug I hit, every thing I break, every concept that confused me = a post.
Screenshots of terminal output > any caption.

---

## THE ANTI-ANALYSIS PARALYSIS PRINCIPLE

From the live stream, directly: "One of the hardest things has been overcoming analysis paralysis.
You really just got to pick one thing and go. Ready, fire, aim — not ready, aim, fire."

I've already picked. The plan exists. The gap was execution not direction.
14 days of Python and bash daily is proof the execution switch flipped.
Networking is the next switch.

---

## MY DAILY NON-NEGOTIABLES (Updated)

| Track | Daily Action | Output |
|---|---|---|
| Python | CS50P lecture or problem set + practice session | `.py` file committed |
| Bash | Write or iterate on a bash script | script committed |
| Linux | LabEx lab or terminal practice | notes committed |
| Networking | 1 Jeremy's IT Lab video + 4-output notes | notes committed |
| Subnetting | Daily drill — paper or trainer | committed or logged |
| Git | `git add . && git commit -m "..." && git push` | every session |

**Networking gets a daily slot starting now. Not eventually. Now.**

---

## WHAT I'M BUILDING TOWARD (The Follow-Along Project)

When bash and Python scripting are stable (not perfect — stable):

**Project 1: 2-Tier Web App — Docker + Jenkins on EC2**
- Flask app (Python web framework — I don't need to write it from scratch, just read it)
- MySQL database
- Docker + Docker Compose to package and run both containers
- Jenkins for the CI/CD pipeline — triggers on GitHub push, builds image, runs tests, deploys
- AWS EC2 as the deployment environment

Why this project first: it touches everything — Linux (EC2), Python (Flask), Docker, CI/CD, AWS.
One project, four buckets touched. Architecture diagram goes in the README.
Every failed Jenkins build = a LinkedIn post.
