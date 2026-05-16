# Service Management with systemd
**Track:** Linux
**Source:** LabEx — Service Management with systemd
**Date:** 2026-05-13
**Week:** Week 5 | Phase 1

---

## What This Is

`systemd` is the init system that manages every service running on a modern Linux machine. A service is a long-running background process — a web server, SSH daemon, database, anything that needs to start automatically and keep running. `systemctl` is the command you use to control them.

---

## The Mental Model

```
Service = A worker with a specific job
systemd = The manager who controls all the workers
systemctl = Your radio to talk to the manager

States a service can be in:
┌─────────────────────────────────────────────┐
│  active (running)  → doing its job right now │
│  inactive          → not running             │
│  failed            → crashed                 │
└─────────────────────────────────────────────┘

Boot policy (separate from current state):
┌──────────────────────────────────────────────────┐
│  enabled   → starts automatically on every boot  │
│  disabled  → only starts if you start it manually│
└──────────────────────────────────────────────────┘
```

**Key distinction:** A service can be running right now but disabled (won't survive a reboot). Or it can be enabled but currently stopped (will start on next boot, not running now). These are two separate settings.

---

## The DevOps Connection

When a server reboots after a patch and your web server doesn't come back up — that's a service that was running but not enabled. When Nginx goes down at 2am and the on-call alert fires — `systemctl status nginx` is the first command you run. Understanding restart vs reload is critical: restarting a production web server under load drops active connections. Reloading just re-reads the config without interrupting anything.

---

## Commands / Syntax

```bash
# Check the current status of a service
systemctl status nginx
systemctl status ssh

# Start a service (right now)
sudo systemctl start nginx

# Stop a service (right now)
sudo systemctl stop nginx

# Restart — stop and start fresh (PID changes, connections drop)
sudo systemctl restart nginx

# Reload — re-read config without stopping (PID stays same, zero downtime)
sudo systemctl reload nginx

# Enable — set service to start automatically at boot
sudo systemctl enable nginx

# Disable — remove from boot startup (won't start automatically)
sudo systemctl disable nginx

# Check if a service is set to start at boot (not the same as current state)
systemctl is-enabled nginx

# Verify a port is closed after stopping a service
sudo netstat -tuln | grep :80
```

### Reading `systemctl status` output

```
● nginx.service - A high performance web server
   Loaded: loaded (/lib/systemd/system/nginx.service)   ← service file exists
   Active: active (running) since ...                   ← currently running
```

| Field | Means |
|---|---|
| `Loaded` | The service definition file exists on disk |
| `Active: active (running)` | Service is currently working |
| `Active: inactive (dead)` | Service is stopped |
| `Active: failed` | Service crashed |

---

## Restart vs Reload — The Critical Difference

```
RESTART:
  Stop the service → Start fresh
  PID changes
  Any active connections are dropped
  Use when: major config changes, service is broken, new version installed

RELOAD:
  Service keeps running → Re-reads its configuration file
  PID stays the same
  Active connections are not interrupted
  Use when: minor config update, can't afford downtime
```

In production, always ask: can I reload instead of restart? The answer is often yes.

---

## What I Got Wrong First

`enabled` and `active` sound like the same thing but they're completely separate. Enabled means it auto-starts on boot. Active means it's running right now. You can have a service that's active (running) but disabled (won't survive a reboot). Both need to be set correctly for a service to behave reliably on a server.

---

## Quick Recall

- `systemctl status` = check current state + recent logs
- `start`/`stop`/`restart` = control right now
- `enable`/`disable` = control what happens at boot
- `reload` = re-read config, no downtime (PID stays same)
- `restart` = full stop and start (PID changes, connections drop)
- `is-enabled` = check boot policy, not current state
- Running ≠ enabled. Both matter.

---

## Connected To

Before: Process and job control, understanding PIDs  
After: `journalctl` for service logs, Nginx/Apache configuration, Docker service patterns, CI/CD deployment verification
