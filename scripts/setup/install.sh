#!/bin/bash
set -e

echo "🚀 Initializing LinuxDOE25 Environment..."

# Load environment variables
if [ -f "configs/.env" ]; then
  source configs/.env
  echo "✅ Environment loaded for: $OS_TYPE"
else
  echo "⚠️  No .env found. Copying from example..."
  cp configs/.env.example configs/.env
  source configs/.env
fi

# Create log directories
mkdir -p logs/mac logs/fedora logs/ubuntu
echo "📁 Log directories verified."

# Make sure scripts are executable
chmod +x scripts/setup/install.sh
chmod +x scripts/maintenance/auto_route.sh || true

echo "🧩 Bootstrapping environment..."
echo "Repo Path: $(pwd)"
echo "Log Path:  $LOG_PATH"
echo "Editor:    $EDITOR"

echo "✅ Setup complete. You're live on $OS_TYPE!"

