# Software Package Management
**Track:** Linux
**Source:** LabEx — Software Package Management
**Date:** 2026-05-16
**Week:** Week 5 | Phase 1

---

## What This Is

A package manager is Linux's system for distributing and managing software. Instead of downloading random installers from the internet, Linux keeps software in curated, verified collections called repositories. The package manager knows where those repositories are, handles dependencies automatically, and tracks everything it installs so it can cleanly remove it later.

---

## The Mental Model

```
Repository = A massive, trusted, curated library of Linux software
                        (maintained by the distro, not random websites)

Package Manager (APT) = The librarian
    → Finds what you want
    → Checks it's the right version
    → Downloads it + everything it depends on
    → Installs it in the right places
    → Keeps a record of everything installed
    → Cleans it up completely when you remove it

/etc/apt/sources.list = The address book of repositories
    (tells APT where to look)
```

**Why this design exists:** Linux was built for servers and multi-user environments before app stores existed. Admins needed a reliable way to install software consistently across many machines and keep dependencies clean. APT solves all of that in one tool.

---

## The DevOps Connection

In a CI/CD pipeline, `apt install` is how you set up the build environment inside a container or VM before running tests or deployments. In a Dockerfile, every `RUN apt-get install` line is this system doing its job. When a pipeline fails because a tool isn't installed, or an upgrade breaks a dependency, this is the layer you go to fix it.

The intentional separation of `apt update` (check what's available) from `apt upgrade` (actually change things) is a pattern that runs through all of DevOps: inspect first, act second. Never upgrade blind on a production server.

---

## Commands / Syntax

```bash
# Refresh the local index of available packages
# (updates the list, does NOT install or upgrade anything)
sudo apt update

# See what's available to upgrade after updating the index
apt list --upgradable

# Upgrade all installed packages to latest versions
sudo apt upgrade

# Install a specific package
sudo apt install package-name

# Remove a package
sudo apt remove package-name

# Remove leftover dependencies no longer needed
sudo apt autoremove

# Search for a package by keyword
apt search keyword

# View detailed info about a package before installing
apt show package-name
```

### Understanding `/etc/apt/sources.list`
This file is the address book — it tells APT where to look for packages.

```bash
# View the repository list
cat /etc/apt/sources.list

# A typical line looks like:
deb http://archive.ubuntu.com/ubuntu/ jammy main restricted
```

Breaking that line down:
| Part | Meaning |
|---|---|
| `deb` | Binary package (pre-compiled, ready to install) |
| `http://...` | URL of the repository server |
| `jammy` | Ubuntu release codename (22.04 = Jammy Jellyfish) |
| `main restricted` | Software categories included from this repo |

---

## What I Got Wrong First

`apt update` sounds like it updates your software. It doesn't — it updates APT's knowledge of what software is available. Your actual software doesn't change until you run `apt upgrade`. Running upgrade without update first means APT is working off a stale list and might miss newer versions.

---

## Quick Recall

- `sudo apt update` = refresh the list (no changes to software)
- `sudo apt upgrade` = apply the upgrades (actual changes)
- `sudo apt install` = install a package + its dependencies automatically
- `sudo apt autoremove` = clean up dependencies no longer needed
- `apt search` = find packages, `apt show` = inspect before installing
- `/etc/apt/sources.list` = where APT looks for packages

---

## Connected To

Before: File system navigation, understanding where Linux installs things  
After: Dockerfile `RUN apt-get install`, Ansible `apt` module, system updates in CI/CD pipelines
