# Git Command Reference
> Drop this in your compendium under `git/notes/git-commands-reference.md`

---

## Daily Workflow (Run Every Session)

```bash
git add .
git commit -m "topic: what you did"
git push origin main
```

---

## Commit Message Formula

```
[topic]: [what you did]
```

**Examples:**
```bash
git commit -m "linux: file permissions lab completed"
git commit -m "python: functions and loops CS50P week 1"
git commit -m "bash: disk check script v1"
git commit -m "networking: subnetting VLSM drill notes"
```

---

## Checking Status

```bash
git status                        # what changed, what's staged
git log --oneline                 # clean commit history
git log --oneline --graph         # visualize branch history
git diff                          # see exact changes before staging
git diff --staged                 # see what's already staged
```

---

## Branching

```bash
# Create and switch to a new branch
git checkout -b feature/bash-disk-check

# List all branches
git branch

# Switch between branches
git checkout main
git checkout feature/bash-disk-check

# Merge branch into main
git checkout main
git merge feature/bash-disk-check

# Delete branch after merge
git branch -d feature/bash-disk-check
```

---

## Staging Options

```bash
git add .                         # stage everything
git add filename.py               # stage one file
git add linux/                    # stage entire folder
git add -p                        # stage changes chunk by chunk (interactive)
```

---

## Undoing Things

```bash
git restore filename.py           # discard changes to a file (not staged)
git restore --staged filename.py  # unstage a file (keep changes)
git reset HEAD~1                  # undo last commit, keep your changes
git reset --hard HEAD~1           # undo last commit, DELETE your changes (careful)
```

---

## Fixing Mistakes

```bash
git commit --amend                # fix last commit message (before pushing)
git stash                         # temporarily save work without committing
git stash pop                     # bring stashed work back
```

---

## Remote & Sync

```bash
git remote -v                     # check what remote repo you're connected to
git pull origin main              # pull latest changes from GitHub
git push origin main              # push your commits to GitHub
git push origin feature/branch    # push a branch to GitHub
```

---

## Useful Flags

| Command | What It Does |
|---|---|
| `git log --oneline` | Short one-line history |
| `git log --oneline --graph` | Branch history visual |
| `git diff HEAD` | All changes since last commit |
| `git status -s` | Short status output |
| `git add -p` | Interactive staging |

---

## Compendium Session Closer (Memorize This)

```bash
git add .
git commit -m "topic: what you did today"
git push origin main
```

**Every. Single. Session. No exceptions.**
