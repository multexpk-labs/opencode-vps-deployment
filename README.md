# OpenCode Remote VPS Deployment

**MULTEXPK LTD ®™**  
Secure Cloud • VPS • Hosting • Automation

A generic, production-oriented knowledge base for running OpenCode Web on Linux VPS infrastructure with systemd, Nginx, HTTPS, Cloudflare, Docker, AI gateways, and local LLM runtimes.

> This repository is an independent deployment and infrastructure project. It is not a fork of OpenCode.

## What this repository is for

This project has four goals:

- **Education** — practical guides for developers learning Linux, VPS, Docker, reverse proxies, AI infrastructure, and coding agents.
- **Research** — documented experiments around LLMs, inference, model evaluation, gateways, local runtimes, and AI agents.
- **Community** — reusable deployment patterns, troubleshooting knowledge, research notes, and contribution opportunities.
- **Infrastructure** — reference architectures for hosting persistent AI development environments on VPS/cloud infrastructure.

The documentation is designed to be useful independently of MULTEXPK services. Service information is kept in a separate section so technical guidance remains reusable.

## Quick architecture

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

Never commit real credentials.

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

The application should normally remain bound to localhost while Nginx is the public entry point.

## Cloudflare

Create an A record for the hostname pointing to your VPS. Do not expose port 4096 publicly. OpenCode should remain bound to `127.0.0.1` and Nginx should be the public entry point.

See the [Cloudflare guide](docs/guides/cloudflare.md).

# Learn

## VPS and Linux

- [Linux VPS baseline](docs/guides/linux-vps.md)
- [Docker](docs/guides/docker.md)
- [Nginx reverse proxy](docs/guides/nginx-reverse-proxy.md)
- [Cloudflare](docs/guides/cloudflare.md)
- [Monitoring](docs/guides/monitoring.md)
- [Performance tuning](docs/guides/performance-tuning.md)

## OpenCode deployment

- [Architecture](docs/architecture.md)
- [Installation](docs/installation.md)
- [systemd](docs/systemd.md)
- [Nginx](docs/nginx.md)
- [Troubleshooting](docs/troubleshooting.md)
- [Production projects](docs/production-projects.md)

## AI / LLM

This repository documents practical ways to connect OpenCode and other coding agents to local runtimes, hosted models, gateways, and compatible APIs.

- [Free and local LLMs](docs/llm-free-and-local.md)
- [OpenRouter](docs/openrouter.md)
- [OmniRoute](docs/omniroute.md)
- [9router / proxy](docs/9router.md)
- [Google Antigravity](docs/google-antigravity.md)
- [Ollama](docs/ai/ollama.md)
- [OpenCode providers](docs/ai/providers.md)
- [OpenAI-compatible APIs](docs/providers/compatible-apis.md)
- [Gateway and runtime roles](docs/providers/gateway-comparison.md)

Free model availability, quotas, provider policies, and model catalogs change. Verify current upstream documentation before production use.

## AI / LLM research

The research section focuses on reproducible infrastructure experiments rather than one-off claims.

- [AI & LLM research](docs/research/ai-llm-research.md)
- [Local vs cloud LLMs](docs/research/local-vs-cloud-llm.md)
- [Model evaluation](docs/research/model-evaluation.md)
- [Inference costs](docs/research/inference-costs.md)
- [AI agent architecture](docs/research/ai-agent-architecture.md)
- [Glossary](docs/glossary.md)

When publishing research results, record the model, version, runtime, hardware, configuration, date, workload, measurements, and limitations.

# Reference Architecture

The expanded documentation includes a sanitized architecture for a VPS running OpenCode, an AI gateway, and a local model runtime behind Nginx and HTTPS.

- [Reference architecture](docs/reference-architecture.md)
- [MULTEXPK reference architecture](docs/multexpk/reference-architecture.md)
- [VPS security hardening](docs/security/hardening.md)
- [Secrets management](docs/security/secrets.md)
- [Firewall and network exposure](docs/security/firewall.md)
- [Backup and recovery](docs/security/backup-and-recovery.md)

## Automation

OpenCode can be used as a programmable development service and can connect external tools through MCP.

- [OpenCode SDK](docs/automation/sdk.md)
- [MCP](docs/automation/mcp.md)

## FAQ

See the [FAQ](docs/faq.md) for common questions about OpenCode, AI gateways, local models, VPS deployment, and production use.

## Community

Contributions are welcome when they improve technical accuracy, reproducibility, security, or educational value.

- [Contributing](CONTRIBUTING.md)
- [Code of Conduct](CODE_OF_CONDUCT.md)
- [Security policy](SECURITY.md)
- [Roadmap](docs/roadmap.md)

Please report outdated provider information, incorrect commands, deployment issues, and useful research findings through GitHub Issues or pull requests.

## Connect with the AI infrastructure community

This repository is intended to be a shared learning space for developers working with:

- AI coding agents
- LLMs and inference
- Ollama and local models
- OpenAI-compatible APIs
- MCP
- Docker
- Linux VPS infrastructure
- automation
- cloud deployment

If you publish a reproducible experiment or deployment pattern, consider contributing it to the repository so others can test and improve it.

---

# MULTEXPK LTD ®™ — AI & Cloud Infrastructure

**Secure Cloud • VPS • Hosting • Automation**

The technical material above is designed to be useful on any compatible infrastructure. If you need infrastructure for the workloads documented here, MULTEXPK provides VPS, cloud, hosting, automation, and deployment services.

Typical workloads include:

- OpenCode and AI coding agents
- Ollama and self-hosted LLM runtimes
- AI gateways and API proxies
- Docker development environments
- n8n and automation
- web applications and APIs
- private development servers
- AI/LLM research environments

### Explore MULTEXPK

- **Website:** https://multexpk.com
- **Software & services:** https://multex.pk
- **Email:** support@multexpk.com
- **WhatsApp:** +92 312 6565434
- **International:** +44 7480 676374

For current VPS specifications, locations, pricing, availability, and service terms, use the official MULTEXPK websites or contact the team directly.

See the dedicated [MULTEXPK AI VPS page](docs/multexpk/ai-vps.md) and [service overview](docs/multexpk/cloud-services.md).

> For secure AI development, keep private services private, expose only the required HTTPS endpoint, use strong authentication, back up important data, and never put API keys or server credentials in Git.

## Upstream

Follow the official OpenCode documentation for current application behavior: https://opencode.ai/docs

## License

MIT — see [LICENSE](LICENSE).
