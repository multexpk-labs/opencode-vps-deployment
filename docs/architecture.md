# Architecture

The recommended deployment keeps OpenCode private on the VPS and exposes it through Nginx.

```text
Browser → HTTPS → Cloudflare → Nginx → 127.0.0.1:4096 → OpenCode Web → Project
```

OpenCode is intentionally not bound to a public interface in this pattern. Basic authentication is provided by OpenCode using its server environment variables.
