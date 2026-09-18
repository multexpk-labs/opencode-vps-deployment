# Troubleshooting

## Service
```bash
systemctl status opencode --no-pager
journalctl -u opencode -n 100 --no-pager
```

## Port
```bash
ss -lntp | grep ':4096'
```

## Local HTTP
```bash
curl -I http://127.0.0.1:4096
```

A 401 response normally indicates authentication is enabled.

## Password rotation
Generate a new password and restart the service. Never commit it:

```bash
umask 077
printf 'OPENCODE_SERVER_PASSWORD=%s\n' "$(openssl rand -base64 32)" > /etc/opencode/server.env
chmod 600 /etc/opencode/server.env
systemctl restart opencode
```
