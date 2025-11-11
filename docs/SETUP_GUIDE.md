# LinuxDOE25 Environment Setup Guide

**Author:** Said Ebadi  
**Cohort:** DevOps-25 (Chas Academy)  
**Repository:** `Linux-DevOps25`

---

## Overview

LinuxDOE25 is a cross-platform DevOps environment that standardizes scripting, configuration management, and logging across macOS, Fedora, and Ubuntu. It delivers a fully automated bootstrap workflow for developing and testing infrastructure automation.

### Key Goals

- Unified environment across multiple Linux distributions
- Automatic OS detection and configuration
- SSH-secured GitHub integration
- Automated environment bootstrap and log routing
- Reproducible setup for DevOps coursework and production training

---

## Repository Structure

```
configs/        # Environment variables and per-OS configs (.env, .bashrc overrides)
scripts/
  ├─ setup/        # Installation and bootstrap scripts
  ├─ maintenance/  # Logging, cleanup, routing
  └─ monitor/      # System monitoring utilities
logs/
  ├─ mac/          # macOS session logs
  ├─ fedora/       # Fedora session logs
  └─ ubuntu/       # Ubuntu session logs
docs/           # Technical documentation and module notes
misc/           # Temporary or experimental files
```

---

## Automated Setup Flow

Each environment executes the sequence below at every terminal startup.

### 1. Bootstrap Initialization

`bootstrap.sh` runs silently via `.bashrc`.

```bash
bash ~/Desktop/DevOps/LinuxDOE25/bootstrap.sh >/dev/null 2>&1
```

### 2. OS Detection and Configuration

`scripts/setup/install.sh` detects macOS, Fedora, or Ubuntu and writes `.env` with:

```bash
OS_TYPE=
REPO_PATH=
LOG_PATH=
EDITOR=vim
```

### 3. SSH Agent Caching

- **macOS:** `ssh-add --apple-use-keychain`
- **Fedora/Ubuntu:** agent initialization in `.bashrc`

### 4. Log Routing

`scripts/maintenance/auto_route.sh` sends session metadata to the OS-specific log folder, for example:

```text
[2025-11-11_03-32-44] Log routed from fedora
```

---

## Installation Instructions

### macOS Setup

```bash
cd ~/Desktop/DevOps/LinuxDOE25
bash scripts/setup/install.sh
```

Append to `.bashrc`:

```bash
bash ~/Desktop/DevOps/LinuxDOE25/bootstrap.sh >/dev/null 2>&1
```

### Fedora Setup

```bash
cd ~/DevOps/LinuxDOE25
bash scripts/setup/install.sh
```

Append to `.bashrc`:

```bash
bash ~/DevOps/LinuxDOE25/bootstrap.sh >/dev/null 2>&1
```

### Ubuntu Setup

```bash
cd ~/DevOps/LinuxDOE25
bash scripts/setup/install.sh
```

Append to `.bashrc`:

```bash
bash ~/DevOps/LinuxDOE25/bootstrap.sh >/dev/null 2>&1
```

---

## SSH Configuration

### macOS

```bash
eval "$(ssh-agent -s)"
mkdir -p ~/.ssh
nano ~/.ssh/config
```

Add the configuration below:

```config
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

Then add the key to the macOS keychain:

```bash
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

### Fedora / Ubuntu

Add to `.bashrc`:

```bash
eval "$(ssh-agent -s)" >/dev/null 2>&1
ssh-add ~/.ssh/id_ed25519 >/dev/null 2>&1
```

Load the key once manually:

```bash
ssh-add ~/.ssh/id_ed25519
```

---

## Bootstrap Script Summary

**File:** `bootstrap.sh`

```bash
# Ensures environment syncs with GitHub and routes logs automatically
git pull --rebase
bash scripts/setup/install.sh
bash scripts/maintenance/auto_route.sh
```

This script executes automatically at every terminal startup.

---

## Knowledge Outcomes

| Domain              | Skills Demonstrated                                                     |
|---------------------|-------------------------------------------------------------------------|
| Linux CLI           | Navigation, file operations, permissions, process management             |
| Bash Scripting      | Conditional logic, environment detection, I/O handling                  |
| SSH & Security      | Key pairs, agent handling, secure Git authentication                    |
| Git & Version Control | Repository structure, pull/rebase, commit workflows                  |
| Automation          | Bootstrapping, logging, self-healing environment                         |
| DevOps Principles   | Reproducibility, consistency, Infrastructure-as-Code fundamentals        |

---

## Testing Verification

```bash
tail -n 3 ~/DevOps/LinuxDOE25/logs/$(uname | tr '[:upper:]' '[:lower:]')/session.log
```

Expected output:

```text
[2025-11-11_03-32-44] Log routed from ubuntu
```

---

## Final Words

> One repo to rule them all,  
> One bootstrap to bind them,  
> One script to route them all,  
> And in the terminal find them.  
> In the land of DevOps where the logs lie deep.
>
> — S. Ebadi, keeper of the main branch

