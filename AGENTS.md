# AGENTS.md

## Repository purpose
This repository documents a generic production deployment pattern for OpenCode Web on a VPS using systemd, Nginx, HTTPS, and Cloudflare.

## Change rules
- Inspect the existing repository before changing files.
- Prefer small, targeted changes.
- Preserve existing APIs, routes, databases, and production behavior unless explicitly requested.
- Do not perform destructive production-data operations.
- Do not make server-wide changes without an explicit request.
- Do not change DNS, Cloudflare, Nginx, PHP, Node.js, systemd, Docker, or firewall configuration unless explicitly requested.
- Back up important files before major changes.
- Never expose passwords, API keys, SSH keys, Cloudflare tokens, cookies, private IPs, or customer data.
- Avoid new dependencies unless necessary.
- Test or validate changes after making them.
- Inspect git status before committing. Do not reset, force-push, or discard unrelated changes.
- Ask before destructive changes.

## Documentation rules
- Use generic/public examples such as agent.example.com.
- Do not publish real infrastructure credentials or private deployment details.
- This repository is an independent deployment project, not a fork of OpenCode.
- Reference official OpenCode documentation for upstream behavior.
- Do not claim commands were tested unless they were actually tested.
- Keep OpenCode bound to localhost in the documented production pattern.
- Docker is not required by this deployment pattern.

## Security
Never commit credentials, local state, databases, logs, certificates, or private keys.
