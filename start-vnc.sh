#!/bin/bash
set -e

# Launch a virtual display
Xvfb "$DISPLAY" -screen 0 ${RESOLUTION}x24 &

# Start x11vnc server
x11vnc -display "$DISPLAY" -forever -nopw -shared -rfbport 5900 &

# Start noVNC
websockify --web=/usr/share/novnc/ "$NOVNC_PORT" localhost:5900 &

# Wait for all background VNC processes
wait

