# FAQ

## What is this repository?

It is a practical knowledge base for deploying OpenCode and related AI infrastructure on Linux VPS environments.

## Is it only for OpenCode?

No. The repository also covers Linux VPS administration, Nginx, Cloudflare, Docker, Ollama, AI gateways, LLM research, and agent architecture.

## Does a proxy provide free AI access?

No. A proxy changes how requests are routed or exposed. Model access, authorization, quotas, and provider terms still apply.

## Can I run an LLM locally?

Yes, when your hardware and the model's requirements are compatible. Ollama is one example of a local model runtime.

## Should AI agents run as root?

Avoid unnecessary privilege. Use the least privilege that allows the required workflow, and isolate production projects from experimentation.

## Can I use these examples in production?

Treat the examples as templates. Review authentication, TLS, firewall rules, secrets, backups, resource limits, and provider terms before production use.

## Where can I learn about the infrastructure behind this project?

Start with:

- [Installation](installation.md)
- [Reference architecture](reference-architecture.md)
- [Security hardening](security/hardening.md)
- [AI & LLM research](research/ai-llm-research.md)
- [VPS guides](guides/linux-vps.md)

---

**MULTEXPK LTD ®™**  
Secure Cloud • VPS • Hosting • Automation
