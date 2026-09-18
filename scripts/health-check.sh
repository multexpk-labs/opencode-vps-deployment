#!/usr/bin/env bash
set -euo pipefail
systemctl is-active --quiet opencode && echo "OK: opencode is active" || { echo "FAIL: opencode is not active"; exit 1; }
ss -lnt | grep -q '127.0.0.1:4096' && echo "OK: 127.0.0.1:4096 is listening" || { echo "FAIL: port 4096 is not listening"; exit 1; }
status="$(curl -s -o /dev/null -w '%{http_code}' http://127.0.0.1:4096 || true)"
echo "HTTP status: $status"
case "$status" in 200|401|403) echo "OK: OpenCode responded";; *) echo "FAIL: unexpected response"; exit 1;; esac
