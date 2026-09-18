# Installation

## 1. Install OpenCode

```bash
curl -fsSL https://opencode.ai/install | bash
opencode --version
```

## 2. Create credentials

Create `/etc/opencode/server.env`:

```env
OPENCODE_SERVER_USERNAME=opencode
OPENCODE_SERVER_PASSWORD=CHANGE_ME_USE_A_LONG_RANDOM_SECRET
```

Then:

```bash
chmod 600 /etc/opencode/server.env
```

## 3. Install systemd

Use `config/opencode.service.example`, set the project path, install it as `/etc/systemd/system/opencode.service`, then run:

```bash
systemctl daemon-reload
systemctl enable --now opencode
systemctl status opencode
```

## 4. Verify

```bash
curl -I http://127.0.0.1:4096
```

Continue with the Nginx and Cloudflare documentation.
