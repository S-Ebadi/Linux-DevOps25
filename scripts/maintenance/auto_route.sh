#!/bin/bash
# Auto log routing based on detected OS

set -e

# Load .env
if [ -f "configs/.env" ]; then
  source configs/.env
else
  echo "⚠️  .env file not found. Please run scripts/setup/install.sh first."
  exit 1
fi

# Detect OS automatically if not specified
if [ -z "$OS_TYPE" ]; then
  case "$(uname -s)" in
    Darwin)  OS_TYPE="mac" ;;
    Linux)
      if [ -f /etc/fedora-release ]; then
        OS_TYPE="fedora"
      elif [ -f /etc/lsb-release ] || [ -f /etc/issue ]; then
        OS_TYPE="ubuntu"
      else
        OS_TYPE="linux"
      fi
      ;;
    *) OS_TYPE="unknown" ;;
  esac
fi

# Log routing
TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")
MESSAGE="[$TIMESTAMP] Log routed from $OS_TYPE"

LOG_FILE="logs/$OS_TYPE/session.log"
mkdir -p "logs/$OS_TYPE"
echo "$MESSAGE" >> "$LOG_FILE"

echo "📡 Log saved to: $LOG_FILE"

