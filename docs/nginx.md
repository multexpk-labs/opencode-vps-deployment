# Nginx

Use `config/nginx.conf.example` as the reverse-proxy template. The target is:

```nginx
proxy_pass http://127.0.0.1:4096;
```

Validate and reload:

```bash
nginx -t
systemctl reload nginx
```

The example forwards WebSocket upgrade headers and uses long proxy timeouts. For a 502, verify the OpenCode service and localhost response first.
