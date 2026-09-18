# Linux VPS Baseline

A VPS is a general-purpose server environment for applications, development tools, AI services, APIs, and automation.

## Baseline checklist

- Update the operating system.
- Create or verify a non-root administrative account.
- Configure SSH keys.
- Use a firewall.
- Disable unnecessary services.
- Configure time synchronization.
- Monitor disk usage.
- Configure backups for important data.
- Keep application secrets outside Git.

## Inspect the system

```bash
uname -a
cat /etc/os-release
free -h
df -h
lsblk
ss -lntup
systemctl --failed
```

## Resource planning

Check four resources separately:

- CPU
- RAM
- storage
- network

AI workloads may have an additional requirement for GPU/VRAM.

Do not select a server only from CPU count. Match resources to the actual workload.

## Production rule

Keep development and production environments separated where practical. A failed experiment should not be able to overwrite an unrelated production service.

---

**MULTEXPK LTD ®™**  
Secure Cloud • VPS • Hosting • Automation  
[Cloud and VPS services](https://multexpk.com)
