
#!/bin/bash
set -e

echo "[ApplicationStop] Stopping Node.js app..."
pkill -f "node" || true
