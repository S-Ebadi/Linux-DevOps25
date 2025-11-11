#!/bin/bash
set -e

# --- Auto Bootstrap for LinuxDOE25 ---
REPO_DIR="$HOME/Desktop/DevOps/LinuxDOE25"
SETUP_SCRIPT="$REPO_DIR/scripts/setup/install.sh"
LOG_SCRIPT="$REPO_DIR/scripts/maintenance/auto_route.sh"

echo "🔁 Bootstrapping LinuxDOE25..."

# Ensure repo exists
if [ ! -d "$REPO_DIR" ]; then
  echo "❌ Repo not found at $REPO_DIR"
  exit 1
fi

# Pull latest changes
cd "$REPO_DIR"
git pull --rebase || echo "⚠️  Skipping pull (no remote changes)"

# Run install and log routing automatically
if [ -f "$SETUP_SCRIPT" ]; then
  bash "$SETUP_SCRIPT"
else
  echo "⚠️  Setup script missing"
fi

if [ -f "$LOG_SCRIPT" ]; then
  bash "$LOG_SCRIPT"
fi

echo "✅ Environment initialized for $(uname -s)"

