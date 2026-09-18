# Backup and Recovery

AI development hosts contain more than source code. They may contain OpenCode state, provider configuration, project repositories, local model metadata and operational configuration.

## What to back up

Depending on the deployment:

- project repositories
- deployment configuration
- Nginx configuration
- systemd unit files
- sanitized OpenCode configuration
- database files used by applications
- Docker Compose files
- monitoring configuration
- recovery documentation

Do not blindly back up secrets to an insecure location.

## Recovery sequence

1. Provision a clean host.
2. Apply OS updates.
3. Configure firewall and SSH.
4. Install runtime dependencies.
5. Restore application configuration.
6. Restore projects.
7. Restore secrets through a secure channel.
8. Start internal services.
9. Start Nginx.
10. Verify health checks.
11. Verify HTTPS and authentication.
12. Test an AI request.

## Test backups

A backup that has never been restored is only an assumption.

Periodically perform a restore test and record the restore date, source backup, restored services, failures, recovery time and corrective actions.

## Model files

Large model files may not belong in normal application backups. Document exact model tags and provide a reproducible download procedure instead when practical.
