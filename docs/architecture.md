# Architecture

The recommended deployment keeps OpenCode private on the VPS and exposes it through a reverse proxy. Use Nginx on a conventional Linux setup, or the cPanel-managed Apache guide when the hostname is hosted by cPanel/WHM.

```text
Browser → HTTPS → Cloudflare → Nginx or Apache → 127.0.0.1:4096 → OpenCode Web → Project
```

OpenCode is intentionally not bound to a public interface in this pattern. Basic authentication is provided by OpenCode using its server environment variables.


For server-specific proxy instructions, see [Nginx](nginx.md) or [Apache on cPanel](apache-cpanel.md). Keep port 4096 bound to loopback and do not expose it publicly.
