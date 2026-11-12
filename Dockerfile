
# Official Playwright MCP Docker image
FROM mcr.microsoft.com/playwright/mcp:latest

# Railway port configuration
ENV PORT=8080

# Allow requests from Railway's public domain
ENV PLAYWRIGHT_MCP_ALLOWED_HOSTS="playwright-mcp-server-production-345e7a5a.up.railway.app,localhost:8080,127.0.0.1:8080"

# Expose HTTP port
EXPOSE 8080

# Process management and environment variable expansion
ENTRYPOINT ["/usr/bin/tini", "-s", "--", "sh", "-c"]

# Start Playwright MCP
CMD ["exec node /app/cli.js \
  --headless \
  --browser chromium \
  --no-sandbox \
  --host 0.0.0.0 \
  --port ${PORT}"]
