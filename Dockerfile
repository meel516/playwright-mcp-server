FROM mcr.microsoft.com/playwright:v1.50.0-noble

# Install the official Playwright MCP server globally
RUN npm install -g @playwright/mcp@latest

# Railway automatically injects the PORT environment variable
ENV PORT=8080
EXPOSE 8080

# Start Playwright MCP natively in HTTP/SSE mode
CMD ["sh", "-c", "npx @playwright/mcp@latest --headless --no-sandbox --port ${PORT} --host 0.0.0.0"]
