# MULTEXPK Reference AI VPS Architecture

## Purpose

A sanitized production pattern for running OpenCode and AI gateways on an isolated VPS. It intentionally excludes real IP addresses, credentials, customer data and private infrastructure identifiers.

## Reference topology

```text
Internet
   |
Cloudflare / DNS / WAF
   |
HTTPS
   |
Nginx
   |
+-------------------------------+
| Private VPS                   |
|                               |
| OpenCode Web       127.0.0.1:4096
| AI Gateway         127.0.0.1:20128
| Ollama             private/local
| Other AI gateways  private/local
+-------------------------------+
```

The public layer should expose only the HTTPS endpoint that users actually need. Internal AI services should normally bind to localhost or a private network.

## Request paths

### Remote OpenCode

```text
Browser -> Cloudflare -> Nginx -> OpenCode -> selected AI provider
```

### Gateway-based OpenCode

```text
OpenCode -> local gateway -> OpenRouter / provider APIs / compatible services
```

### Local model

```text
OpenCode -> Ollama -> local model
```

## Design principles

- Keep OpenCode bound to localhost when Nginx is the public entry point.
- Keep Ollama and gateway ports private unless there is a specific reason to expose them.
- Use HTTPS for remote access.
- Store API keys outside Git.
- Use separate credentials for separate services.
- Monitor CPU, RAM, disk, logs and provider failures.
- Keep project workspaces isolated.
- Record the exact versions used for production deployments.

## Example public/private split

| Service | Example bind | Public? |
|---|---|---|
| Nginx | `0.0.0.0:443` | Yes |
| OpenCode | `127.0.0.1:4096` | No |
| AI Gateway | `127.0.0.1:20128` | No |
| Ollama | localhost/private network | No |
| Database | private network | No |

This is a reference, not a requirement. Adapt ports and isolation to the workload.
