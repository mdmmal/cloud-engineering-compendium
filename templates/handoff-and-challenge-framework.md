# Handoff Format + Challenge Framework
## The system that connects every chat, every track, every post

---

## THE HANDOFF FORMAT

Use this every time you switch from another chat into this one.
Paste it at the top of your message. I immediately know where you are.
No context lost. No repeating yourself.

```markdown
# HANDOFF — [Track Name] | [Date] | Day [X] of [Challenge]

## What was covered today
- [concept 1]
- [concept 2]
- [concept 3]

## Scripts / files committed
- [filename]: [one sentence — what it does]
- [filename]: [one sentence — what it does]

## Commit messages used
- "[track]: [message]"
- "[track]: [message]"

## DevOps connection
[One paragraph — what real situation these scripts map to.
What would a junior DevOps engineer use this for.]

## Open questions from this session
[Anything that came up and wasn't resolved]

## What's next in this track
[The next concept or script based on where the session ended]

## Post seed
[The one thing from today that could become a post.
What was built + what it does + why it matters in DevOps.]
```

---

## THE CHALLENGE FRAMEWORK

Every challenge you run follows this structure.
The rule: a challenge only counts if it produces something visible.

### The Challenge Card Format

```
Challenge:      [name]
Duration:       [X days]
Track:          [bash / python / networking / wize / sadservers]
Visible proof:  [what the screenshot shows]
Daily post:     X — one sentence + screenshot
Capstone post:  LinkedIn — end of challenge summary
```

---

### Current and Upcoming Challenges

| # | Challenge | Duration | Status | Visible Proof |
|---|---|---|---|---|
| 1 | 14 Days of Bash | 14 days | Day 5 — IN PROGRESS | Script output screenshot |
| 2 | Wize Week 1 — Dockerize | 7 days | Starts Day 15 | Container running screenshot |
| 3 | 7 Days of Python Scripts | 7 days | Starts after CS50P Wk 2 | Script terminal output |
| 4 | 7 Days of Networking | 7 days | Starts when trainer rebuilt | Trainer score + VPC diagram |
| 5 | Wize Week 2 — Deploy to EC2 | 7 days | Starts after Docker stable | App running on real server |
| 6 | Sadservers Week | 7 days | Starts after bash complete | Problem solved or notes |
| 7 | 30 Days of Commits | 30 days | Ongoing from now | GitHub graph screenshot |
| 8 | Wize Week 3 — CI/CD Pipeline | 7 days | Starts after EC2 deploy | GitHub Actions running |

---

### The Capstone Post Formula

Every challenge ends with this LinkedIn post structure:

```
Line 1: "[X] days of [Y]. Here's what I built."

Line 2-4: "Day 1: [what you could do / what the first thing was]
           Day [X]: [what you can do now / what the last thing was]"

Line 5: "The [script/project/diagram] that proved it: [name]"
         + screenshot

Line 6: "What changed: [3 bullet points — honest, specific]"

Line 7: "What's next: [the next challenge or project]"

Line 8: "GitHub: [first comment]"

Tags: #DevOps #CloudEngineering #BuildingInPublic + relevant tech tags
```

---

### The Daily X Post Formula

One sentence. One screenshot. Every day.

```
"Day [X]. [What you built in one sentence].
[Why it matters in one sentence]. #DevOps #[tech]"
```

Examples:
- "Day 7. Wrote a filesystem explorer script — tells you total files, dirs, largest file, most recent change. The kind of thing you run first when you SSH into an unfamiliar server. #DevOps #Bash"
- "Day 11. Simulated a full deployment pipeline in bash. Pre-flight → build → test → deploy → verify. Each stage exits on failure. This is the manual version of CI/CD. #DevOps"
- "Day 13. Alert manager in bash. Monitors a file metric, fires when threshold crossed, logs with timestamp. The manual version of what Prometheus AlertManager does. #SRE"

---

### The Weekly LinkedIn Post Formula

Built from 3–5 daily post seeds collected in `today.md`.

```
Line 1: Hook — the most interesting thing that happened this week
Line 2-3: What you built — specific, named, with context
Line 4: The output screenshot or diagram
Line 5: Why it matters — one sentence connecting to real DevOps
Line 6: What's next
Tags + GitHub link in first comment
```

Post on Sunday. Be available for 90 minutes after posting to reply.

---

## HOW IT ALL CONNECTS

```
Morning:
  Open today.md for today's date
  → Read "what yesterday produced" (one line — continuity)
  → See the task already decided
  → See the commit message already written
  → Start immediately

During session:
  Do the work
  Screenshot the output — save it
  Commit with the exact message from today.md

End of session:
  Paste one line into tomorrow's "what yesterday produced"
  Paste the post seed into the weekly collection
  If this was a bash/python session → generate handoff using the format above
  → paste handoff into the project chat

End of week (Sunday):
  3–5 post seeds → 1 LinkedIn post
  Challenge progress → capstone if at end of challenge
  Update PROJECT-STATE.md with where each track stands

End of challenge:
  Write the README for that track's scripts/notes folder
  Write and post the capstone LinkedIn post
  Start the next challenge immediately
```

---

## THE 30-DAY COMMIT CHALLENGE — ONGOING

This runs underneath everything else. Silent challenge. No daily post.
One commit every single day. No exceptions.

At 30 days: screenshot the GitHub contribution graph.
Post it on LinkedIn.

```
"30 days of daily commits.
Here's the graph.
Here's what's in the repo."
+ screenshot of green squares
+ link to compendium in first comment
```

That post alone — a green graph with 30 consecutive days —
is one of the most credible things a self-taught engineer can show a recruiter.
It cannot be faked retroactively.
