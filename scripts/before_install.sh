
#!/bin/bash
set -e

echo "[BeforeInstall] Prepping target directory..."
# Stop any running node app (basic kill, PM2 not required)
pkill -f "node" || true

# Prepare directory
mkdir -p /opt/my-node-app
# Clean previous contents
rm -rf /opt/my-node-app/*
