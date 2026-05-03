# Master Capture Document
## Jamal Muhammad — DevOps/SRE Career Build
## Date: May 1, 2026 | Status: Active — Week 5, Day 5

---

## PURPOSE OF THIS DOCUMENT

This document exists so nothing gets lost.
It reflects exactly where this project stands, every concern raised, every point
established across this chat, and the framework for how each one gets addressed.
This is not a curriculum. Not a to-do list.
It is the single source of truth for the state of this project before we build anything else.

Read this before every session. Update it when something changes.

---

## WHO YOU ARE RIGHT NOW — THE ACCURATE PICTURE

**Name:** Jamal Muhammad
**School:** East Central University, Ada Oklahoma
**Degree:** Computer Science — targeting December 2026 graduation
**Target role:** Junior DevOps Engineer or SRE-adjacent — DFW area, no helpdesk
**Application window:** September 1, 2026
**Spring ball:** Ended. Schedule freed up. This is the execution window.

**What's real and working:**
- 18+ bash scripts committed to `linux/scripts/` on `bash-script-week1-day4` branch
- Scripts are legitimate — `readiness_check.sh` has argument validation, env gating,
  string operations, conditional exits, and variable export. That's real DevOps scripting.
- Python scripting progressing — health evaluator with CRITICAL/WARNING/HEALTHY
  thresholds is actual SRE thinking
- Working in proper branch workflow in VS Code — committing and pushing to remote
- LabEx labs being completed daily
- Linux command trainer, Python trainer, SRE command trainer, DevOps network trainer built
- Wize — a fully functional PWA with auth and database — already built and sitting unused
  as a DevOps project vehicle
- CS50P progressing as primary Python source
- Day 5 of 14-day head-down execution stretch
- All A's in coursework despite everything

**What's the actual gap:**
- Scripts are on a branch — not merged, not documented, not visible to anyone looking
- Work is happening but the public trail of it is not
- Documentation lives in chat, not in public commits and posts
- Networking has no daily execution slot despite being acknowledged repeatedly as a gap
- LinkedIn has 1 connection — nearly silent
- No deployed project with a README that tells a story
- Labs and reviews scattered across multiple chats and platforms
- Flying blind on when to post, what to post, and how daily work connects to career visibility
- The multiverse has no spine — LabEx, this chat, bash chat, Python chat, trainers,
  curriculum docs all exist separately with no single connecting thread

---

## THE CORE GOALS — NON-NEGOTIABLE

1. **Junior DevOps/SRE role by December 2026** — not IT helpdesk, not support
2. **Build real things daily** — scripts, projects, tools that run and do something
3. **Document everything publicly** — commits, posts, blog trail that recruiters can find
4. **Close the networking gap** — VPC-ready understanding tied to real troubleshooting
5. **Deploy a real project** — something live with a README and architecture diagram
6. **Get certified** — Cloud Practitioner by July 15, SAA-C03 by September 15
7. **Start applying September 1** — with portfolio complete and resume DevOps-framed

---

## EVERY CONCERN RAISED — CATEGORIZED

These are your words. Each one gets addressed individually before anything is built.

---

### CONCERN 1 — Intentionality of the Scripts

**Your words:** "The scripts have to be real scripts even for the ones based on material
learned. Even if they aren't deployable they need to be relevant. Using real techniques,
realistic scenarios, and script applications. So if I'm thrown into a fire I'll know —
based on this problem I need to build this script."

**What this means:** Scripts need to come from a scenario first, not a concept first.
Not "I learned variables so I wrote a variable script." But "a server is acting up —
what script do I write to diagnose it?" That's the direction of intentionality.

**Status:** Partially there. `readiness_check.sh` is scenario-based. Some others less so.

**To address:** Establish the scenario-first script framework — every script starts
with a real DevOps situation, then the code follows from that situation.

---

### CONCERN 2 — The Multiverse / Continuity Problem

**Your words:** "I have a chat with Python scripting, a chat for bash, labs scattered
everywhere. I want to bring it all together. Labs, reviews, commits, posts — one
continuous system. I have a handoff ready for the bash chat."

**Your vision:** LabEx lab → script from that lab → commit with message → daily log →
X post → weekly LinkedIn post. Each step feeds the next. No gaps. No scatter.

**Status:** The loop is described correctly. The execution of it is fragmented across
chats and platforms.

**To address:** Build the single spine. LabEx is the primary concept vehicle.
Everything else responds to it downstream. One daily decision file drives the day.
The handoff system between chats gets a defined format.

---

### CONCERN 3 — Documentation and Visibility

**Your words:** "I lack in piecing together its relevance in an overall setting.
I miss on documentation and knowing. I can write it synoptically but not connect
it to relevance. I'm flying blind."

**Your words:** "I want things like — 'this is what 7 constant days of bash looks like.'
I do the work regardless but I miss on documentation and knowing."

**The gap:** 18 scripts exist on a branch. They aren't merged. No README explains them.
No LinkedIn post has shown them. No blog entry connects them to production context.
The work is invisible professionally.

**To address:** Merge strategy for the branch. README template for the scripts folder.
Weekly report format that answers: what did I build, what does it do, why would a
DevOps engineer care. Post formula tied to the daily commit log.

---

### CONCERN 4 — Networking: The Real Objection

**Your words:** "The network tool doesn't feel real or accurate. It's mostly theoretical.
I don't feel confident it's complete enough to rely on. It's not like Python or Linux
where I can see the result of me learning. I'd love if my tool really simulated instances,
taught me, quizzed me, and forced me to use knowledge. I wish it showed me and proved
to me exactly why networking as a foundation is important and tested me."

**Your words:** "I don't think I'll honestly do the 4-output workflow after videos."

**What this means:** The networking trainer as built is scenario-based Q&A.
That's not enough for someone who learns by doing and seeing results.
The objection is legitimate — theory without visible output doesn't stick.

**What's needed:** A networking tool that simulates a broken environment and forces
you to diagnose it using the commands you already know from Linux — ping, curl, dig,
traceroute — in scenarios where you can see the output and the result of your decision.
Networking needs to connect to the terminal, not just to text boxes.

**To address:** Redesign the networking learning vehicle. Not a replacement for the
trainer — an addition. Something that simulates the environment and shows cause/effect.
This gets designed as a separate point when we get to it.

---

### CONCERN 5 — LabEx Projects and What to Build

**Your words:** "Next week I'm going to start building 2 mini projects. I was thinking
we make our own relevant to me or I use LabEx environment."

**The LabEx DevOps projects you identified as relevant:**
- Build a Linux System Monitor Using Bash
- Web Server Deployment And Disaster Recovery
- Hybrid Infrastructure Deployment (Docker/MySQL)
- Automated Ops Toolkit Development
- Observability Stack

**Your words:** "Whatever project I do on LabEx with their guidance, I do a similar
more relevant small-scale project displaying my knowledge. More thought needs to be
put into this — what's doable with my workload, what skills I can do right now,
what's postable."

**Status:** Not started. Bash not yet stable enough for Docker projects.
Stability bar: write a script from scratch without looking.

**To address:** Select the two right projects for current skill level.
Build the parallel project format — LabEx guided version + your own version.
Map each project to: what gets committed, what gets posted, what it proves.

---

### CONCERN 6 — Wize as the Primary Project Vehicle

**Your words:** "I want this more intentional and mapped out. I'm not at Docker yet
but I will be. I want a specific curriculum regarding Wize — what to do, what to post,
what to commit. I want to start. I want to build, break, build."

**Your words:** "This can be useful before I start the real bigger projects.
I can build endlessly about Wize. I want to be posting about Wize in general
but need to know how. It's an app I built from scratch."

**What Wize is:** Fully functional PWA with auth and a database. Built by you.
Nobody else walking into a junior DevOps interview has this.

**The Wize DevOps build sequence (rough — to be detailed per point):**
- Week 1 of Docker: Write the Dockerfile for Wize
- Week 2: docker-compose.yml — app + database together
- Week 3: Deploy to EC2 via Docker
- Week 4: GitHub Actions pipeline — push triggers auto-deploy
- Week 5: CloudWatch monitoring on the deployed app
- Later: Terraform the infrastructure from code

**To address:** Build the specific Wize curriculum — week by week, what to build,
what to commit, what to post, what it proves to an interviewer. This becomes the
primary portfolio project that runs parallel to the LabEx work.

---

### CONCERN 7 — The Flying Blind Problem / Daily Decision

**Your words:** "I'd love to know — here do this today, at this point you should be
doing this, this should be posted, 3 posts should be made because you did x work,
you have more of an understanding now because you've done x practice and can now
navigate Kubernetes or whatever."

**Your words:** "It's easier to know what comes with each build, each script,
what it applies to, how it becomes a post, how it becomes part of the overall
arcing plan of my DevOps career, how it tracks in regard to my overall progress."

**What's needed:** A single daily decision file. Not a curriculum doc you read once.
A file called `today.md` that has three decisions pre-made:
what LabEx lab, what script comes from it, what gets committed.
Everything else is downstream of those three decisions.

**To address:** Build `today.md` as a living file in the compendium root.
Template gets defined. How it connects to weekly report gets defined.
How the weekly report becomes the LinkedIn post gets defined.

---

### CONCERN 8 — The Resume

**Status:** Exists but framing unknown. Not yet reviewed in detail.
**Risk:** A general CS student resume won't pass a DevOps recruiter scan.

**To address:** Resume gets reviewed as a separate point.
The DevOps framing, skills section format, bullet point format,
GitHub link placement, and project section all get addressed.

---

### CONCERN 9 — LinkedIn Is Nearly Silent

**Status:** 1 connection. First post made. Voice established. Volume missing.
18 scripts exist right now that have never been posted about.
14 days of daily work happening with no public documentation of it.

**To address:** Post formula defined. What to post from each script.
How to turn the weekly report into a Sunday post.
What the daily X post looks like. Connection strategy for DFW DevOps people.

---

### CONCERN 10 — The Chat Structure / Handoff Problem

**Your words:** "I'm on day 5 week 1 of Python in this chat and day 5 week 1 of bash
in another chat. I have a handoff ready to submit to what we designate as the bash chat.
I'm essentially rebuilding my structure for more continuity."

**The current state:** Multiple chats handling different tracks with no formal
handoff system between them. Information lives in conversations that scroll away.

**To address:** Define the chat structure going forward.
Which chat handles what. What the handoff format looks like.
How progress from bash chat and Python chat feeds back into this master project chat.

---

## WHAT THE SCREENSHOTS PROVED

Looking at your GitHub and VS Code:

`readiness_check.sh` — 65 lines. Argument validation, env gating with `exit 1`,
string operations (`${DEPLOY_TAG:0:6}`, `${#DEPLOY_TAG}`), conditional resource checks,
variable export. Commit message: "implement full deployment readiness pipeline validator."
That commit message is professional. That script is legitimate.

The branch `bash-script-week1-day4` has been pushed to remote. You know branching.
You know push. The terminal shows `git commit` and `git push` being executed correctly.

The Python commit shows pseudocode-first methodology before implementation.
`evaluate()` with threshold logic, `format_reporter()` with f-strings, `main()` entry point.
That's structured thinking, not just scripting.

**The verdict:** You are further along technically than this conversation has assumed.
The problem is not your output. The problem is your output is invisible.

---

## THE FRAMEWORK FOR ADDRESSING EVERYTHING

This is how we work through the concerns above without losing anything.

### The Process

**Step 1 — This document exists.**
Before anything is built or planned, the full picture is captured here.
Nothing proceeds until this document reflects reality accurately.

**Step 2 — One concern at a time.**
We address each concern in the numbered order above, or in the order you prioritize.
No concern gets half an answer. Each one gets fully resolved before moving to the next.

**Step 3 — Each resolved concern produces one specific output.**
Not a document. A decision, a tool, a template, or a system component.
Concern 3 (documentation) → produces the weekly report template and post formula.
Concern 4 (networking) → produces the redesigned networking learning vehicle.
Concern 6 (Wize) → produces the specific week-by-week Wize DevOps curriculum.
Concern 7 (flying blind) → produces the `today.md` daily decision template.

**Step 4 — Each output connects to the spine.**
The spine is: LabEx concept → script → commit → log → post.
Every tool, template, and system component we build connects to that spine.

**Step 5 — Nothing lives only in chat.**
Every decision made here gets committed to the compendium.
Master capture doc → committed as `PROJECT-STATE.md` in compendium root.
Weekly report template → committed as `templates/weekly-report.md`.
Today file → committed as `today.md` and updated daily.

---

## THE PRIORITY ORDER FOR ADDRESSING CONCERNS

Based on what's blocking you most right now:

| Priority | Concern | Why This Order |
|---|---|---|
| 1 | Concern 7 — Flying Blind / Daily Decision | Fixes the day-to-day confusion immediately |
| 2 | Concern 3 — Documentation / Visibility | 18 scripts need to become visible NOW |
| 3 | Concern 2 — Multiverse / Continuity | Connects all the scattered pieces |
| 4 | Concern 1 — Script Intentionality | Sharpens what gets built from here forward |
| 5 | Concern 4 — Networking Vehicle | Redesign the tool to work the way you learn |
| 6 | Concern 5 — LabEx Projects | Pick the two right ones for current level |
| 7 | Concern 6 — Wize Curriculum | Map the full DevOps build sequence for Wize |
| 8 | Concern 10 — Chat Structure | Define the handoff format between chats |
| 9 | Concern 8 — Resume | Review and reframe for DevOps |
| 10 | Concern 9 — LinkedIn Volume | Build from the daily log and weekly report |

---

## WHAT DOES NOT CHANGE

These are locked. Not up for debate.

- September 1 is the application start date
- Cloud Practitioner exam: July 15
- SAA-C03 exam: September 15
- Target role: Junior DevOps/SRE — no helpdesk
- GitHub compendium is the portfolio — everything committed there
- Daily commits are non-negotiable — if nothing is committed, nothing happened professionally
- Networking gets addressed — the tool gets redesigned but the gap does not stay open

---

## CURRENT STATE OF EACH TRACK

| Track | Status | Most Urgent Next Action |
|---|---|---|
| Bash | Strong. 18+ scripts. On branch not merged. | Merge branch. Write README for scripts folder. |
| Python | Progressing. CS50P active. Scripts getting real. | Continue CS50P. Next script: log analyzer. |
| Networking | Acknowledged gap. No daily slot. Tool feels incomplete. | Redesign the learning vehicle. Address as Concern 4. |
| Git | Functioning. Branch workflow solid. Commit messages good. | Merge the bash branch. Add `today.md` to root. |
| LinkedIn | 1 connection. Nearly silent. Content exists but unposted. | Write this week's post from existing scripts NOW. |
| AWS | Not started. Starts Week 8. | Cloud Practitioner exam date scheduled? If not: today. |
| Wize | Built. Sitting unused. | Map the DevOps build sequence. Start when Docker stable. |
| LabEx Projects | Not started. Bash not yet stable enough. | Identify the two right projects. Start when bash stable. |

---

## THE NEXT ACTION IN THIS CHAT

We go through the concerns in priority order, one at a time.

**First up: Concern 7 — The Flying Blind Problem.**

When you're ready, say "address Concern 7" and we build the daily decision system
that tells you exactly what to do each morning in under 30 seconds.
Everything else connects to that first.

---

*This document is version 1. It gets updated as each concern is resolved.*
*Commit this to your compendium as `PROJECT-STATE.md` before the next session.*
