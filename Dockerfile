
# Official Playwright MCP image with Chromium
FROM mcr.microsoft.com/playwright/mcp:latest

# Railway environment
ENV PORT=8080

# Expose MCP port
EXPOSE 8080

# Preserve process and signal handling
ENTRYPOINT ["/usr/bin/tini", "-s", "--"]

# Start Playwright MCP with explicit allowed hosts
CMD ["sh", "-c", "exec node /app/cli.js \
  --headless \
  --browser chromium \
  --no-sandbox \
  --host 0.0.0.0 \
  --port ${PORT} \
  --allowed-hosts 'playwright-mcp-server-production-345e7a5a.up.railway.app,localhost:8080,127.0.0.1:8080,[::1]:8080'"]
