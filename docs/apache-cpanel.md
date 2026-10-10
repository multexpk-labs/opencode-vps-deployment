# Apache reverse proxy on cPanel

This guide documents the cPanel/WHM Apache deployment pattern for OpenCode Web. It complements the [Nginx guide](nginx.md); choose the guide that matches the web server already managing your hostname.

## Architecture

```text
Browser → HTTPS → cPanel Apache → 127.0.0.1:4096 → OpenCode Web
```

OpenCode listens on loopback only. Apache handles public HTTPS and proxies requests, including WebSocket upgrades. Do not expose port 4096 to the internet.

> **Scope:** The userdata paths and WHM scripts below are specific to cPanel on supported Linux systems. They are not a generic Apache installation procedure. Confirm your cPanel version and Apache module availability before applying them.

## 1. Pre-checks

Run as `root`. Replace the example hostname and cPanel username with your own values.

```bash
export PATH="$PATH:/usr/local/bin"

HOST=agent.example.com
CPUSER=examplecpuser

dig +short "$HOST"
ss -tlnp | grep -E ':4096\\b' || echo "Port 4096 is not listening"
httpd -M 2>/dev/null | grep -E 'proxy_module|proxy_http_module|proxy_wstunnel_module|rewrite_module|ssl_module|headers_module'
grep -F "$HOST" /etc/userdomains
```

The hostname must already exist under the expected cPanel account. Required Apache modules include proxy, proxy_http, rewrite, SSL, and headers. Depending on Apache version and WebSocket handling, proxy_wstunnel may also be needed. If modules are missing, enable them using WHM/EasyApache or your host's supported process; do not blindly edit generated Apache configuration.

## 2. Install OpenCode

```bash
curl -fsSL https://opencode.ai/install | bash
ln -sf /root/.opencode/bin/opencode /usr/local/bin/opencode
opencode --version
```

Check the official [OpenCode documentation](https://opencode.ai/docs) for current installation details.

## 3. Create a password and systemd service

This example follows a root-owned installation. Review the security implications before using root for a multi-user or untrusted environment.

```bash
mkdir -p /opt/opencode-agent /etc/opencode
umask 077
openssl rand -base64 24 > /tmp/opencode-pw
cat /tmp/opencode-pw
printf 'OPENCODE_SERVER_PASSWORD=%s\\n' "$(cat /tmp/opencode-pw)" > /etc/opencode/server.env
chmod 600 /etc/opencode/server.env
rm -f /tmp/opencode-pw

cat > /etc/systemd/system/opencode.service <<'EOF'
[Unit]
Description=OpenCode Web Server
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/opt/opencode-agent
EnvironmentFile=/etc/opencode/server.env
ExecStart=/usr/local/bin/opencode web --hostname 127.0.0.1 --port 4096
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now opencode
systemctl status opencode --no-pager
ss -tlnp | grep ':4096'
curl -sS -o /dev/null -w 'local HTTP: %{http_code}\\n' http://127.0.0.1:4096/
```

Save the generated password securely for the web login. The temporary password file is deleted, but the password remains in `/etc/opencode/server.env`.

## 4. Add the cPanel Apache proxy userdata include

Set `CPUSER` to the actual cPanel account username and use the exact hostname assigned to that account. For an SSL virtual host, create the include under `ssl/2_4`:

```bash
CPUSER=examplecpuser
HOST=agent.example.com
CONF_DIR="/etc/apache2/conf.d/userdata/ssl/2_4/$CPUSER/$HOST"

mkdir -p "$CONF_DIR"
cat > "$CONF_DIR/opencode-proxy.conf" <<'EOF'
ProxyPreserveHost On
ProxyTimeout 600
RewriteEngine On

# Route WebSocket upgrade requests to OpenCode.
RewriteCond %{HTTP:Upgrade} websocket [NC]
RewriteRule /(.*) ws://127.0.0.1:4096/$1 [P,L]

ProxyPass / http://127.0.0.1:4096/
ProxyPassReverse / http://127.0.0.1:4096/
RequestHeader set X-Forwarded-Proto "https"
EOF

/scripts/rebuildhttpdconf
/scripts/restartsrv_httpd
```

The proxy target is deliberately `127.0.0.1:4096`. Since the backend uses plain HTTP, `SSLProxyEngine on` is not required for this configuration. The include is for the SSL virtual host; HTTP-to-HTTPS redirection should be managed by your existing cPanel/AutoSSL setup.

## 5. Issue or verify the SSL certificate

If AutoSSL is configured for the cPanel account:

```bash
/usr/local/cpanel/bin/autossl_check --user="$CPUSER"
```

Test the endpoint after confirming the certificate has been issued:

```bash
curl -sS -o /dev/null -w 'public HTTPS: %{http_code}\\n' "https://$HOST/"
journalctl -u opencode -n 50 --no-pager
```

An HTTP response such as 200, 302, or an authentication response can show that the request reached the application; interpret the status in the context of your OpenCode version and authentication settings.

## 6. Troubleshooting

- **502 Bad Gateway:** check `systemctl status opencode`, `journalctl -u opencode`, and `curl -v http://127.0.0.1:4096/`.
- **Apache configuration error:** inspect the rebuild/restart output and run `httpd -t`. Check that required modules are enabled and that the userdata include is valid.
- **WebSocket connection fails:** verify the Upgrade rewrite, proxy modules, and Apache error logs. Confirm the installed Apache version supports the directives used.
- **SSL/certificate error:** verify DNS points to this server and AutoSSL has completed for the correct hostname.
- **Wrong cPanel account or vhost:** check `grep -F "$HOST" /etc/userdomains` and confirm the userdata directory uses that account's exact username.

Useful commands:

```bash
httpd -t
/scripts/rebuildhttpdconf
/scripts/restartsrv_httpd
tail -n 100 /usr/local/apache/logs/error_log
systemctl status opencode --no-pager
```

## 7. Updates

Update OpenCode using the official installer, then restart the service:

```bash
curl -fsSL https://opencode.ai/install | bash
systemctl restart opencode
opencode --version
```

Review upstream release notes before production upgrades. Keep port 4096 private, protect `/etc/opencode/server.env`, and never commit real passwords or server-specific secrets to Git.
