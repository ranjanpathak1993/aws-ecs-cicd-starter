
#!/bin/bash
set -e
cd /opt/my-node-app

echo "[AfterInstall] Installing production dependencies..."
# Prefer npm ci if lockfile present
if [ -f package-lock.json ]; then
  npm ci --omit=dev
else
  npm install --omit=dev
fi

# Example env
# echo "PORT=3000" > .env
