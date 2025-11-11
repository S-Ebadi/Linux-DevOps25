# 📘 LinuxDOE25 – Environment Setup Guide
**Author:** Said Ebadi  
**Cohort:** DevOps-25 (Chas Academy)  
**Repository:** [Linux-DevOps25](https://github.com/S-Ebadi/Linux-DevOps25)

---

## 🧭 Overview
`LinuxDOE25` is a cross-platform DevOps environment that standardizes scripting, configuration management, and logging across **macOS**, **Fedora**, and **Ubuntu**.  
It provides a fully automated bootstrap workflow for developing and testing infrastructure automation.

**Key goals:**
- Unified environment across multiple Linux distributions  
- Automatic OS detection and configuration  
- SSH-secured GitHub integration  
- Environment bootstrap and log routing automation  
- Reproducible setup for DevOps coursework and production training  

---

## 🧱 Repository Structure
```text
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

---

⚙️ Automated Setup Flow
Each environment automatically runs the following sequence at terminal startup:

Bootstrap initialization
Runs bootstrap.sh silently on every terminal launch via .bashrc.

bash
Kopiera kod
bash ~/Desktop/DevOps/LinuxDOE25/bootstrap.sh >/dev/null 2>&1
OS detection and configuration
install.sh determines whether the host is macOS, Fedora, or Ubuntu, then generates a .env with:

bash
Kopiera kod
OS_TYPE=
REPO_PATH=
LOG_PATH=
EDITOR=vim
SSH agent caching
Automatically loads the private key to memory using system-specific agent configuration:

macOS: via ssh-add --apple-use-keychain

Fedora/Ubuntu: via .bashrc initialization

Log routing
auto_route.sh writes session metadata to the correct log folder for that OS:

csharp
Kopiera kod
[2025-11-11_03-32-44] Log routed from fedora

---

🧩 Installation Instructions
macOS
bash
Kopiera kod
cd ~/Desktop/DevOps/LinuxDOE25
bash scripts/setup/install.sh
Add to .bashrc:

bash
Kopiera kod
bash ~/Desktop/DevOps/LinuxDOE25/bootstrap.sh >/dev/null 2>&1
Fedora
bash
Kopiera kod
cd ~/DevOps/LinuxDOE25
bash scripts/setup/install.sh
Add to .bashrc:

bash
Kopiera kod
bash ~/DevOps/LinuxDOE25/bootstrap.sh >/dev/null 2>&1
Ubuntu
bash
Kopiera kod
cd ~/DevOps/LinuxDOE25
bash scripts/setup/install.sh
Add to .bashrc:

bash
Kopiera kod
bash ~/DevOps/LinuxDOE25/bootstrap.sh >/dev/null 2>&1

---

🔐 SSH Configuration
macOS
bash
Kopiera kod
eval "$(ssh-agent -s)"
mkdir -p ~/.ssh
nano ~/.ssh/config
Insert:

bash
Kopiera kod
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
Then add key to macOS keychain:

bash
Kopiera kod
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
Fedora / Ubuntu
In ~/.bashrc:

bash
Kopiera kod
eval "$(ssh-agent -s)" >/dev/null 2>&1
ssh-add ~/.ssh/id_ed25519 >/dev/null 2>&1
Add key once manually:

bash
Kopiera kod
ssh-add ~/.ssh/id_ed25519

--- 

🚀 Bootstrap Script Summary
File: bootstrap.sh

bash
Kopiera kod
# Ensures environment syncs with GitHub and routes logs automatically
git pull --rebase
bash scripts/setup/install.sh
bash scripts/maintenance/auto_route.sh
Executed automatically at every terminal startup.

---

🧠 Knowledge Outcomes
Domain	Skills Demonstrated
Linux CLI	Navigation, file ops, permissions, process mgmt
Bash scripting	Conditional logic, environment detection, I/O handling
SSH & Security	Key pairs, agent handling, secure Git auth
Git & Version Control	Repo structure, pull/rebase, commit workflows
Automation	Bootstrapping, logging, self-healing environment
DevOps Principles	Reproducibility, consistency, IaC fundamentals

---

🧾 Testing Verification
Run:

bash
Kopiera kod
tail -n 3 ~/DevOps/LinuxDOE25/logs/$(uname | tr '[:upper:]' '[:lower:]')/session.log
Expected output:

csharp
Kopiera kod
[2025-11-11_03-32-44] Log routed from ubuntu

---

🧙‍♂️ Final Words
One repo to rule them all,
One bootstrap to bind them,
One script to route them all,
And in the terminal find them.
In the land of DevOps where the logs lie deep.

(– S. Ebadi, keeper of the main branch)
