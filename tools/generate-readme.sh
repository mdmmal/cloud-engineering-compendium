#!/bin/bash
# tools/generate-readme.sh
# Regenerates the top-level README.md from live repo counts
# Usage: bash tools/generate-readme.sh

set -e

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CONFIG="$REPO_ROOT/tools/readme-config.txt"

# Load config
CURRENT_FOCUS=$(grep 'CURRENT_FOCUS=' "$CONFIG" | cut -d'=' -f2-)
BASH_DAY=$(grep 'BASH_DAY=' "$CONFIG" | cut -d'=' -f2-)

# Count scripts per track
linux_scripts=$(find "$REPO_ROOT/linux/scripts" -name "*.sh" 2>/dev/null | wc -l | tr -d ' ')
python_scripts=$(find "$REPO_ROOT/python/scripts" -name "*.py" 2>/dev/null | wc -l | tr -d ' ')

# Count notes per track
linux_notes=$(find "$REPO_ROOT/linux/notes" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
python_notes=$(find "$REPO_ROOT/python/notes" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
networking_notes=$(find "$REPO_ROOT/networking/notes" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')

# Total commits
total_commits=$(git -C "$REPO_ROOT" rev-list --count HEAD 2>/dev/null || echo "0")

# Write the README
cat > "$REPO_ROOT/README.md" << EOF
# Cloud Engineering Compendium
### Jamal Muhammad | CS Student → Junior DevOps Engineer | DFW

---

This repo is the proof of work.

CS student at East Central University graduating December 2026.
Building toward a Junior DevOps/SRE role in the DFW area.
Everything here is real — scripts written, labs run, concepts worked through.

---

## What's in here

| Track | Scripts | Notes | Status |
|---|---|---|---|
| [Linux + Bash](./linux/) | $linux_scripts | $linux_notes | Active |
| [Python](./python/) | $python_scripts | $python_notes | Active |
| [Networking](./networking/) | — | $networking_notes | Active |
| [AWS](./aws/) | — | — | Starts Week 8 |
| [Docker](./docker/) | — | — | Starts June |
| [Projects](./projects/) | — | — | Starts May |
| [Certifications](./certifications/) | — | — | In progress |

---

## Current focus

$CURRENT_FOCUS

→ [See the scripts](./linux/scripts/)

---

## By the numbers

- **Total commits:** $total_commits
- **Bash scripts written:** $linux_scripts
- **Python scripts written:** $python_scripts
- **Study notes committed:** $((linux_notes + python_notes + networking_notes))

---

## The goal

Junior DevOps Engineer role by December 2026.
Foundation: Linux, Python, Bash, Networking, AWS, Docker, CI/CD, Terraform.
Documenting everything publicly.

---

## Connect

GitHub: github.com/mdmmal
LinkedIn: linkedin.com/in/jamal-muhammad-a284a7347
EOF

echo "README.md updated — $total_commits commits, $linux_scripts bash scripts, $python_scripts python scripts"