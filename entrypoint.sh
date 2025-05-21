#!/bin/bash
set -e

# Start VNC and desktop
/usr/local/bin/start-vnc.sh &

# Give the virtual display some time to start
sleep 2

# Start the MCP server
npx playwright-mcp --host 0.0.0.0 --port "$PORT" "$@" &

# Simple heartbeat so container logs show three processes running
(echo "i am running" && tail -f /dev/null) &

# Wait for any process to exit
wait -n

