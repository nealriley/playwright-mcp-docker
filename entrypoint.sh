#!/bin/bash
set -e

# Start VNC and desktop
/usr/local/bin/start-vnc.sh &

# Give the virtual display some time to start
sleep 2

exec npx playwright-mcp --host 0.0.0.0 --port "$PORT" "$@"

