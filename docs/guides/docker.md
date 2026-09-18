# Docker on a VPS

Docker provides a repeatable way to package and run services.

## Basic workflow

1. Install Docker from the official documentation.
2. Verify the daemon.
3. Run a small test container.
4. Define production services with Compose where appropriate.
5. Keep persistent data outside ephemeral containers.
6. Monitor storage, memory, and logs.

## Useful commands

```bash
docker version
docker ps
docker images
docker logs <container>
docker stats
docker compose ps
docker compose logs -f
```

## Production considerations

- Do not expose every container port to the Internet.
- Prefer binding internal services to localhost or a private network.
- Store secrets outside images and source control.
- Pin important image versions when reproducibility matters.
- Back up persistent application data.
- Remove unused images and volumes deliberately.

## Port exposure

Review published ports:

```bash
docker ps --format 'table {{.Names}}\t{{.Ports}}'
```

Only publish a port when an external client actually needs it.

---

**MULTEXPK LTD ®™**  
Secure Cloud • VPS • Hosting • Automation  
[Website](https://multexpk.com)
