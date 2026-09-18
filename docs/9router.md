# 9router / Proxy Guide

9router and related proxy projects use a gateway/proxy layer between coding clients and AI providers. This can be useful when a client needs an OpenAI-compatible endpoint, request transformation, routing, or controlled network egress.

## Important distinction

A proxy does not create free model access by itself.

It can route requests to:

- provider APIs
- OpenRouter
- local Ollama
- other OpenAI-compatible gateways
- compatible subscription/provider integrations

The provider still determines authentication, quotas, pricing and acceptable use.

## Generic architecture

```text
Coding client
     |
     v
9router / compatible proxy
     |
     +--> OpenRouter
     +--> Provider API
     +--> Local Ollama
     +--> Another gateway
```

## Security

Keep proxy administration and provider credentials private.

Do not publish:

- API keys
- OAuth tokens
- cookies
- subscription session data
- proxy credentials
- private provider endpoints

If a proxy supports request rewriting, test each model/API carefully. Some providers use different request formats, streaming behavior, tool schemas and authentication.

## Current upstream

Because several projects use names such as 9router or 9router-proxy, identify the exact repository/version before applying commands. Do not blindly copy a configuration intended for a different fork.

A related open-source proxy implementation is:

https://github.com/eikarna/9router_proxy

Use the upstream project's README/configuration for its exact setup.
