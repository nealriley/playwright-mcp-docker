FROM mcr.microsoft.com/playwright:v1.42.1-jammy

ENV DEBIAN_FRONTEND noninteractive

# Install packages for VNC and desktop environment
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        xvfb x11vnc novnc websockify xfce4 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install playwright-mcp
RUN npm install -g playwright-mcp

COPY start-vnc.sh /usr/local/bin/start-vnc.sh
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/start-vnc.sh /usr/local/bin/entrypoint.sh

ENV DISPLAY=:0
ENV PORT=3333
ENV NOVNC_PORT=6080
ENV RESOLUTION=1280x720

EXPOSE 3333 6080

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
