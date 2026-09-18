# systemd

Use `config/opencode.service.example` as the service template.

```bash
systemctl daemon-reload
systemctl enable --now opencode
systemctl status opencode --no-pager
journalctl -u opencode -n 100 --no-pager
ss -lntp | grep ':4096'
```

After reboot, confirm the service starts automatically and listens only on localhost.
