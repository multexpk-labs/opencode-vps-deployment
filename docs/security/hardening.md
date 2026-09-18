# VPS Security Hardening

This is a baseline checklist for an AI development VPS.

## Network

- Expose only required ports.
- Prefer Nginx/HTTPS as the public entry point.
- Bind internal services to 127.0.0.1 or a private network.
- Use Cloudflare or another trusted edge layer where appropriate.
- Restrict administrative access by firewall policy.

## Authentication

Use strong, unique credentials for OpenCode, SSH, Cloudflare, AI providers, GitHub and monitoring systems.

Rotate credentials immediately if they are exposed.

## Secrets

Never commit API keys, SSH private keys, passwords, cookies, OAuth tokens, production environment files or database credentials.

Use environment files with restrictive permissions or a dedicated secrets manager.

Example:

    umask 077
    chmod 600 /etc/opencode/server.env

## Services

Check listening services:

    ss -lntup

Check failed services:

    systemctl --failed

Review OpenCode logs:

    journalctl -u opencode --no-pager -n 100

## Updates

1. Back up configuration.
2. Record the current version.
3. Update.
4. Run health checks.
5. Test the public endpoint.
6. Roll back if necessary.

## AI-specific risks

AI gateways can expose powerful upstream credentials. A compromised gateway can become an API-spending or data-exfiltration path. Keep administrative interfaces private and use least-privilege credentials.
