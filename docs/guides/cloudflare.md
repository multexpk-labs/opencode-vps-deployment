# Cloudflare for VPS Applications

Cloudflare can provide DNS, TLS, proxying, and additional edge controls for a VPS-hosted application.

## Generic flow

```text
Visitor
  |
  v
Cloudflare
  |
HTTPS
  |
VPS / Nginx
  |
Application
```

## DNS

Create a DNS record for the application hostname and point it to the server's public IP.

Use placeholders in documentation:

- Hostname: `agent.example.com`
- Origin: `YOUR_VPS_IP`

Never commit a real infrastructure address when the repository is intended to be a public template.

## TLS

Choose a TLS mode that matches the certificate configuration at the origin.

For production, use HTTPS between Cloudflare and the origin.

## Security

- Keep origin services on private/local ports where possible.
- Do not publish database ports unnecessarily.
- Use authentication at the application layer.
- Protect Cloudflare API tokens.
- Review firewall rules.
- Consider origin protection appropriate to your deployment.

## Troubleshooting

Check each layer separately:

1. DNS resolution
2. Cloudflare response
3. Nginx configuration
4. Origin application
5. Application authentication

This avoids treating every HTTP error as an application problem.

---

**MULTEXPK LTD ®™**  
Secure Cloud • VPS • Hosting • Automation  
[VPS infrastructure](https://multexpk.com)
