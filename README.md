# Playwright MCP Docker

This repository provides a Dockerfile for running the [Playwright MCP](https://github.com/microsoft/playwright-mcp) server in a container. The container also exposes a browser view over VNC using noVNC.

## Building the image

```bash
docker build -t playwright-mcp .
```

## Running

```bash
docker run --rm -p 3333:3333 -p 6080:6080 playwright-mcp
```

- The MCP server will listen on `0.0.0.0:3333` inside the container.
- Connect to `http://localhost:6080` to see the browser via noVNC.

## Environment variables

- `PORT` – MCP server port (default: `3333`).
- `NOVNC_PORT` – noVNC port (default: `6080`).
- `RESOLUTION` – screen resolution for VNC (default: `1280x720`).

