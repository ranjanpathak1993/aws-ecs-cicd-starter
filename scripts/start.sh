
#!/bin/bash
set -e
cd /opt/my-node-app

echo "[ApplicationStart] Starting Node.js app..."
# Start in background, logs to app.log
nohup npm start > app.log 2>&1 &

sleep 2
curl -s http://localhost:${PORT:-3000}/health || echo "Health endpoint not ready yet."
