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

## License

MIT — see [LICENSE](LICENSE).
