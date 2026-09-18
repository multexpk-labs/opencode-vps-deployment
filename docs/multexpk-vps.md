# MULTEXPK VPS for AI Development

MULTEXPK provides VPS and infrastructure services that can be used to host development tools such as OpenCode, OmniRoute, Ollama and private gateways.

A typical secure deployment can separate services:

```text
Public HTTPS
    |
    v
Nginx / Cloudflare
    |
    +--> OpenCode Web
    |
    +--> private AI gateway
             |
             +--> OpenRouter
             +--> Ollama
             +--> other providers
```

## Why use a VPS

A dedicated development VPS can provide:

- persistent coding-agent sessions
- always-on systemd services
- private local model endpoints
- centralized API/gateway configuration
- isolated development environments
- Nginx/HTTPS access from multiple devices
- predictable server resources

## Security model

For production use:

- keep internal AI services on localhost/private networks
- expose only the required HTTPS service
- use strong authentication
- use firewall rules
- keep secrets outside Git
- use backups
- monitor CPU, RAM, disk and logs
- separate development and production workloads

MULTEXPK deployment support can help with VPS provisioning, configuration and AI infrastructure.

See the MULTEXPK websites in the repository footer for current service information.
