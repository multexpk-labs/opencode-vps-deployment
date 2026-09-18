# OmniRoute Guide

[OmniRoute](https://github.com/diegosouzapw/OmniRoute) is an OpenAI-compatible gateway/router designed to put multiple AI providers behind a common endpoint. It can provide routing, fallback, provider management and related gateway features.

## Why use it

A local gateway can give coding tools one endpoint while the gateway handles provider/model selection.

Typical architecture:

```text
OpenCode / Claude Code / Codex / IDE
              |
              v
        OmniRoute :20128
              |
      +-------+-------+
      |       |       |
 OpenRouter  Ollama  Other providers
```

## Local installation

Follow the upstream project's current installation instructions. A common Docker deployment uses:

```bash
docker run -d --name omniroute \
  -p 127.0.0.1:20128:20128 \
  diegosouzapw/omniroute:latest
```

For a production VPS, binding to `127.0.0.1` is preferable when only local services need access.

## Verify

```bash
curl http://127.0.0.1:20128/v1/models
```

The exact endpoint and authentication requirements depend on the OmniRoute version/configuration.

## Connect OpenCode

OpenCode supports provider base URLs. A gateway can therefore be used as an OpenAI-compatible or provider-specific endpoint when the gateway and OpenCode configuration are compatible.

Do not assume that every upstream provider feature is preserved through a generic proxy. Test tool calling, streaming, vision, structured output and model-specific features separately.

## Security

- Do not expose an unauthenticated gateway publicly.
- Keep provider API keys inside the gateway's protected credential store.
- Use firewall rules and/or reverse-proxy authentication.
- Use separate keys with limited spending where supported.
- Monitor logs and provider usage.
- Keep gateway administration interfaces private.

## Upstream

Always check the current OmniRoute documentation/repository before installing or upgrading because provider integrations and configuration options change.

Upstream project: https://github.com/diegosouzapw/OmniRoute
