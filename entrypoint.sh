#!/bin/bash
set -e

# Start VNC and desktop
/usr/local/bin/start-vnc.sh &

# Give the virtual display some time to start
sleep 2

npx -y playwright install chrome && npx -y @playwright/mcp@latest  --viewport-size "1280, 720" --no-sandbox --port $PORT --host 0.0.0.0 "$@" &

# Simple heartbeat so container logs show three processes running
(echo "i am running" && tail -f /dev/null) &

# Wait for any process to exit
wait -n

