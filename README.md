# LinuxDOE25 – Multi-Environment DevOps Repository

A unified workspace for Bash scripting, system monitoring, and DevOps/MLOps automation across macOS, Fedora, and Ubuntu.

---

## ✨ Overview

- **Purpose:** Provide a consistent workflow for cross-platform scripting, monitoring, and automation.
- **Audience:** DevOps-25 cohort (Said Ebadi) and collaborators.
- **Highlights:** Opinionated folder layout, turn-key bootstrap, OS-aware log routing, and comprehensive documentation.

---

## 🧱 Repository Layout

```text
configs/        # OS-specific shell configs (.bashrc variants)
docs/           # Course notes, module summaries, technical references
logs/           # Environment-scoped logs and execution reports
scripts/
  ├─ setup/        # Bootstrap and installation scripts
  ├─ maintenance/  # Cleanup, backup, and versioning routines
  └─ monitor/      # Resource monitoring and automation helpers
misc/           # Experimental utilities or scratch work
```

---

## 🚀 Quick Start

```bash
git clone git@github.com:S-Ebadi/Linux-DevOps25.git
cd LinuxDOE25
bash scripts/setup/install.sh
```

---

## ⚙️ Configuration

1. Copy the example environment file:

   ```bash
   cp .env.example .env
   ```

2. Adjust values as needed (example):

   ```bash
   OS_TYPE=mac
   LOG_PATH=~/Desktop/DevOps/LinuxDOE25/logs/mac
   EDITOR=vim
   ```

3. Load the environment:

   ```bash
   source .env
   ```

---

## 📡 Automatic Log Routing

| OS      | Log directory        |
|---------|----------------------|
| macOS   | `logs/mac/`          |
| Fedora  | `logs/fedora/`       |
| Ubuntu  | `logs/ubuntu/`       |

- Controlled by `scripts/maintenance/auto_route.sh`.
- Ensure `LOG_PATH` aligns with the active environment before running scripts.

---

## 📘 Documentation

- Course notes, module breakdowns, and practical assignments live in `docs/INDEX.md`.
- Follow the index to find theory sections, labs, and reference material.

---

## 🧠 Author

- **Name:** Said Ebadi  
- **Cohort:** DevOps-25  
- **Contact:** Refer to the GitHub profile for current details.

---

🧙‍♂️ One repo to rule them all...

One repo to rule them all,
One pipeline to find them,
One YAML to build them all,
And in production bind them —
In the land of CI/CD where the logs lie deep.

(– S-Ebadi, keeper of the main branch)
