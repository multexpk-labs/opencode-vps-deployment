# Security

Do not publish credentials or sensitive deployment details in public issues.

## Deployment security
- Keep OpenCode bound to 127.0.0.1.
- Put Nginx in front of OpenCode.
- Use HTTPS.
- Do not expose port 4096 directly to the Internet.
- Use a strong OpenCode password.
- Keep /etc/opencode/server.env readable only by the service administrator.
- Never commit secrets, private keys, certificates, tokens, cookies, or customer data.
