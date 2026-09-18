# Nginx Reverse Proxy

Nginx can terminate HTTPS and forward requests to an application listening on a private address.

## Architecture

```text
Internet
   |
HTTPS
   |
Nginx
   |
127.0.0.1:<APP_PORT>
   |
Application
```

## Example

```nginx
server {
    listen 443 ssl;
    server_name agent.example.com;

    location / {
        proxy_pass http://127.0.0.1:4096;
        proxy_http_version 1.1;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

Use your distribution's standard TLS configuration or a trusted certificate automation method.

## WebSocket applications

Some interactive applications require WebSocket support. Add the appropriate upgrade headers when the application requires them.

## Validation

```bash
nginx -t
systemctl reload nginx
curl -I http://127.0.0.1:4096
ss -lntup
```

Keep the application bound to localhost when Nginx is intended to be the only public entry point.

---

**MULTEXPK LTD ®™**  
Secure Cloud • VPS • Hosting • Automation
