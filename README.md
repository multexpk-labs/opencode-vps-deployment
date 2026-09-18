# OpenCode Remote VPS Deployment

**MULTEXPK LTD ®™**  
Secure Cloud • VPS • Hosting • Automation

A generic production deployment pattern for running OpenCode Web remotely on a VPS with systemd, Nginx, HTTPS, and Cloudflare.

> This repository is an independent deployment/infrastructure project. It is not a fork of OpenCode.

## Architecture

```text
Internet
  ↓
Cloudflare / HTTPS
  ↓
agent.example.com
  ↓
Nginx
  ↓
127.0.0.1:4096
  ↓
OpenCode Web
  ↓
Project(s)
```

## Requirements

- Linux VPS
- sudo/root access
- Nginx
- DNS managed by Cloudflare (optional)
- A project directory for OpenCode

## Install OpenCode

Use the official installer:

```bash
curl -fsSL https://opencode.ai/install | bash
opencode --version
```

Official documentation: https://opencode.ai/docs

## Credentials

Create `/etc/opencode/server.env`:

```env
OPENCODE_SERVER_USERNAME=opencode
OPENCODE_SERVER_PASSWORD=CHANGE_ME_TO_A_LONG_RANDOM_SECRET
```

Protect it:

```bash
chmod 600 /etc/opencode/server.env
```

## systemd

Copy `config/opencode.service.example`, replace `YOUR_PROJECT_PATH`, and install it as `/etc/systemd/system/opencode.service`.

```bash
systemctl daemon-reload
systemctl enable --now opencode
systemctl status opencode
curl -I http://127.0.0.1:4096
```

## Nginx

Use `config/nginx.conf.example` as the reverse-proxy template. Set your hostname, such as `agent.example.com`.

```bash
nginx -t
systemctl reload nginx
```

## Cloudflare

Create an A record for the hostname pointing to your VPS. Do not expose port 4096 publicly. OpenCode should remain bound to 127.0.0.1 and Nginx should be the public entry point.

## AI / LLM Guides

This repository documents practical ways to connect OpenCode and other coding agents to free or low-cost hosted models, local Ollama models, OpenRouter, OmniRoute, compatible 9router-style proxies, and Google Antigravity.

- [Free and local LLMs](docs/llm-free-and-local.md)
- [OpenRouter](docs/openrouter.md)
- [OmniRoute](docs/omniroute.md)
- [9router / proxy](docs/9router.md)
- [Google Antigravity](docs/google-antigravity.md)
- [Ollama](docs/ai/ollama.md)
- [OpenCode providers](docs/ai/providers.md)
- [MULTEXPK VPS for AI development](docs/multexpk-vps.md)
- [MULTEXPK reference architecture](docs/multexpk/reference-architecture.md)

Free model availability, quotas and provider policies change. Verify current upstream documentation before production use.

## Reference Architecture

The expanded documentation includes a sanitized architecture for a VPS running OpenCode, an AI gateway and local model runtime behind Nginx and HTTPS.

- [Reference architecture](docs/reference-architecture.md)
- [VPS security hardening](docs/security/hardening.md)
- [Secrets management](docs/security/secrets.md)
- [Firewall and network exposure](docs/security/firewall.md)
- [Backup and recovery](docs/security/backup-and-recovery.md)

## Automation

OpenCode can be used as a programmable development service and can connect external tools through MCP.

- [OpenCode SDK](docs/automation/sdk.md)
- [MCP](docs/automation/mcp.md)

## Production projects

Before an agent modifies a production project: inspect git status, read project instructions, back up important data, review the intended scope, test safely, review the diff, and deploy explicitly. Keep credentials outside the repository.

See [docs/production-projects.md](docs/production-projects.md).

## Documentation

- [Architecture](docs/architecture.md)
- [Installation](docs/installation.md)
- [systemd](docs/systemd.md)
- [Nginx](docs/nginx.md)
- [Cloudflare](docs/cloudflare.md)
- [Production projects](docs/production-projects.md)
- [Troubleshooting](docs/troubleshooting.md)

## Upstream

Follow the official OpenCode documentation for current application behavior: https://opencode.ai/docs

---

## MULTEXPK LTD ®™ — VPS & AI Infrastructure

**Secure Cloud • VPS • Hosting • Automation**

Use a properly isolated VPS for persistent OpenCode sessions, AI gateways, private Ollama endpoints and development automation. MULTEXPK can provide VPS infrastructure, configuration and technical support for AI development workloads.

**Websites:**  
- https://multexpk.com — MULTEXPK LTD
- https://multex.pk — Multex.PK Software House

**Phone:** +44 7480 676374  
**WhatsApp:** +92 312 6565434

**Email:** support@multexpk.com

> For secure AI development, keep private services private, expose only the required HTTPS endpoint, use strong authentication, and never put API keys or server credentials in Git.

## License

MIT — see [LICENSE](LICENSE).
