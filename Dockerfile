
# Official Playwright MCP image
# Includes Chromium and required browser dependencies
FROM mcr.microsoft.com/playwright/mcp:latest

# Railway port configuration
ENV PORT=8080

# Expose MCP HTTP port
EXPOSE 8080

# Override the image's default entrypoint
# so Railway's dynamic PORT variable can expand
ENTRYPOINT ["/usr/bin/tini", "-s", "--", "sh", "-c"]

# Start Playwright MCP
# Listen on all network interfaces
# Run Chromium in headless mode
CMD ["exec node /app/cli.js --headless --browser chromium --no-sandbox --host 0.0.0.0 --port ${PORT}"]
