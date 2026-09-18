# Ollama

Ollama provides a local model runtime that can be used when inference should remain on the VPS or private network.

## Architecture

    OpenCode
       |
    localhost/private network
       |
    Ollama
       |
    Local model

## Basic checks

After installing Ollama, verify the service and model list using the commands appropriate to the installed version.

Typical API discovery:

    curl http://127.0.0.1:11434/api/tags

Do not expose the Ollama API directly to the public Internet unless the deployment has an explicit authentication and network-security layer.

## Model storage

Large local models consume substantial disk space. Before downloading a model, check:

    df -h
    free -h

For GPU workloads also monitor available GPU memory.

## OpenCode integration

OpenCode supports local models and OpenAI-compatible endpoints. Configure the endpoint according to the current OpenCode provider documentation and the Ollama API mode being used.

## Production checklist

- [ ] Ollama is not unintentionally Internet-exposed.
- [ ] Disk space is monitored.
- [ ] GPU/CPU/RAM capacity is known.
- [ ] Models are documented by exact tag/version.
- [ ] Model downloads are backed up or reproducible.
- [ ] Logs are monitored.
- [ ] API access is restricted to trusted clients.

## Important

Local does not automatically mean secure. A compromised VPS can expose local services, model data and credentials. Treat the entire host as a security boundary.
