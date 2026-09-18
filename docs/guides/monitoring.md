# VPS and AI Service Monitoring

Monitoring should answer four questions:

1. Is the service running?
2. Is the server healthy?
3. Is the application responding?
4. Is the workload consuming expected resources?

## Linux checks

```bash
uptime
free -h
df -h
top
ss -lntup
systemctl --failed
```

## Service checks

For systemd:

```bash
systemctl status opencode
journalctl -u opencode --since "30 min ago"
```

Replace the service name for your application.

## Docker checks

```bash
docker ps
docker stats
docker compose ps
docker compose logs --tail=100
```

## AI-specific metrics

For inference workloads, consider recording:

- request count;
- error count;
- time to first token;
- tokens per second;
- queue depth;
- GPU utilization;
- VRAM usage;
- context size;
- model load time.

## Disk monitoring

Model files can consume significant storage.

```bash
df -h
du -sh /path/to/models
```

Set alerts before storage reaches a critical level.

---

**MULTEXPK LTD ®™**  
Secure Cloud • VPS • Hosting • Automation
