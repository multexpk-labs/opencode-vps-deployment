#!/usr/bin/env bash
set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then echo "Run as root."; exit 1; fi
PROJECT_PATH="${PROJECT_PATH:-/YOUR_PROJECT_PATH}"
OPENCODE_PORT="${OPENCODE_PORT:-4096}"
OPENCODE_BIN="${OPENCODE_BIN:-/usr/local/bin/opencode}"
command -v systemctl >/dev/null || { echo "systemd is required."; exit 1; }
[ -x "$OPENCODE_BIN" ] || { echo "OpenCode binary not found at $OPENCODE_BIN"; exit 1; }
mkdir -p /etc/opencode
chmod 700 /etc/opencode
if [ ! -f /etc/opencode/server.env ]; then
cat > /etc/opencode/server.env <<'EOF'
OPENCODE_SERVER_USERNAME=opencode
OPENCODE_SERVER_PASSWORD=CHANGE_ME_USE_A_LONG_RANDOM_SECRET
EOF
chmod 600 /etc/opencode/server.env
fi
cat > /etc/systemd/system/opencode.service <<EOF
[Unit]
Description=OpenCode Web Server
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=$PROJECT_PATH
EnvironmentFile=/etc/opencode/server.env
ExecStart=$OPENCODE_BIN web --hostname 127.0.0.1 --port $OPENCODE_PORT
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable opencode
systemctl restart opencode
systemctl --no-pager --full status opencode
