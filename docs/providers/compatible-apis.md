# OpenAI-Compatible APIs

Many AI applications can connect to an HTTP API that follows an OpenAI-compatible request format.

This can simplify switching between providers, local runtimes, and gateways, but compatibility is not necessarily complete.

## Common concepts

A compatible endpoint may expose:

- chat or response generation;
- model listing;
- streaming;
- tool/function calling;
- embeddings;
- authentication.

## Configuration pattern

Use placeholders rather than real credentials:

```text
Base URL: https://api.example.com/v1
API key: CHANGE_ME
Model: CHANGE_ME
```

The exact environment variables depend on the client.

## Compatibility checklist

Test:

- authentication;
- model discovery;
- normal requests;
- streaming;
- tool calls;
- structured output;
- error responses;
- context limits.

Do not assume that an API is fully compatible because a provider advertises an OpenAI-compatible endpoint.

## Security

API keys are credentials. Keep them out of:

- Git;
- Docker images;
- shell history where practical;
- public logs;
- screenshots.

Use environment files or a secrets manager appropriate to the deployment.

---

**MULTEXPK LTD ®™**  
Secure Cloud • VPS • Hosting • Automation
