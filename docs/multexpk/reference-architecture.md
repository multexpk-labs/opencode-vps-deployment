# MULTEXPK AI VPS Reference Architecture

**MULTEXPK LTD ®™**  
**Secure Cloud • VPS • Hosting • Automation**

This is a sanitized reference architecture for AI development infrastructure offered or maintained by MULTEXPK. It intentionally does not publish customer data, private IP addresses or credentials.

## Stack

    Cloudflare
        |
      HTTPS
        |
      Nginx
        |
    +-----------------------------+
    | MULTEXPK AI VPS             |
    |                             |
    | OpenCode      :4096 local   |
    | AI Gateway    :private      |
    | Ollama        :private      |
    | Docker        :private      |
    | Projects      :isolated     |
    +-----------------------------+

## Suitable workloads

- OpenCode remote development
- AI coding agents
- private model gateways
- Ollama/local inference
- automation services
- Git-based development
- API integrations
- development and staging environments

## Security model

1. Public HTTPS only where required.
2. Internal AI services stay private.
3. Authentication is enabled on remote development interfaces.
4. Provider keys stay outside Git.
5. Projects are separated where practical.
6. Backups and recovery procedures are documented.
7. Resource usage is monitored.

## Why a VPS

A dedicated or isolated VPS can provide a persistent environment for tools that are inconvenient to run only on a workstation. CPU, RAM, storage and GPU requirements should be selected according to the workload and model.

## MULTEXPK

For VPS infrastructure, AI development environments, automation and technical support:

- https://multexpk.com
- https://multex.pk
- support@multexpk.com
- +44 7480 676374
- WhatsApp: +92 312 6565434

Do not treat this document as a guarantee of a particular hardware configuration or service level. Confirm the current product specification before deployment.
