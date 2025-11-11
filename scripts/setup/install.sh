#!/bin/bash
set -e

echo "🚀 Initializing LinuxDOE25 Environment..."

# Detect OS automatically
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

# Create .env if missing
if [ ! -f "configs/.env" ]; then
  echo "⚙️  No .env found. Creating one..."
  mkdir -p configs
  cat > configs/.env <<EOF
OS_TYPE=$OS_TYPE
REPO_PATH=$(pwd)
LOG_PATH=$(pwd)/logs/$OS_TYPE
EDITOR=vim
EOF
  echo "✅  .env created for $OS_TYPE"
else
  source configs/.env
  echo "✅  Loaded existing .env for: $OS_TYPE"
fi

# Create log directories
mkdir -p logs/mac logs/fedora logs/ubuntu
echo "📁 Log directories verified."

# Make scripts executable
chmod +x scripts/setup/install.sh
chmod +x scripts/maintenance/auto_route.sh || true

echo "🧩 Bootstrapping environment..."
echo "Repo Path: $(pwd)"
echo "Log Path:  $(pwd)/logs/$OS_TYPE"
echo "Editor:    $EDITOR"
echo "✅ Setup complete. You're live on $OS_TYPE!"

