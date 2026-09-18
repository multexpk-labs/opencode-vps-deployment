# Firewall and Network Exposure

## Goal

The firewall should enforce the same principle as the application architecture:

Public services are explicit; internal AI services are private by default.

## Typical layout

    Internet
      |
      +-- 443 -> Nginx
      |
      +-- SSH -> restricted administration
      |
      X-- OpenCode internal port
      X-- Ollama port
      X-- gateway internal port

The exact rules depend on the hosting provider and existing network architecture.

## Audit listening ports

    ss -lntup

For Docker:

    docker ps
    docker port <container>

Pay particular attention to Docker mappings such as 0.0.0.0:20128->20128 when a service was intended to be localhost-only.

## Cloudflare

If Cloudflare is the public edge, ensure the origin configuration matches the intended TLS and proxy mode. Do not assume Cloudflare makes an origin secure if the origin remains directly reachable.

## Verification

From the VPS:

    curl http://127.0.0.1:<PORT>

From an external network, verify that only intended public endpoints are reachable.

Document every intentionally exposed port.
