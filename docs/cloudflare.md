# Cloudflare

Create an A record such as `agent.example.com → YOUR_VPS_IP` and proxy it through Cloudflare if appropriate.

Do not publish port 4096 directly. The intended flow is:

```text
HTTPS → Cloudflare → Nginx → 127.0.0.1:4096
```

Use an HTTPS mode appropriate to the certificate installed on the origin.
