# AI Gateway and Runtime Roles

Different tools solve different layers of an AI infrastructure stack. They should be compared by role rather than treated as interchangeable products.

| Component | Primary role |
|---|---|
| OpenCode | AI coding agent / interaction layer |
| Ollama | Local model runtime |
| OpenRouter | Hosted model API and routing |
| OmniRoute | AI provider gateway/routing layer |
| 9router-style proxy | Compatibility/proxy layer |

The exact features of each project can change. Check upstream documentation before production deployment.

## Example architectures

### Local

```text
OpenCode
   |
Ollama
   |
Local model
```

### Hosted

```text
OpenCode
   |
Hosted API
   |
Model provider
```

### Gateway

```text
OpenCode
   |
AI gateway
   +---- Provider A
   +---- Provider B
   +---- Local Ollama
```

## Selection questions

Ask:

1. Where should inference happen?
2. Which models are required?
3. Does the client need OpenAI-compatible APIs?
4. Is routing required?
5. What data may leave the server?
6. What authentication is required?
7. What failure and retry behavior is acceptable?

A proxy or gateway does not itself create authorization, free model access, or unlimited inference.

---

**MULTEXPK LTD ®™**  
Secure Cloud • VPS • Hosting • Automation  
[AI/VPS infrastructure](../multexpk/ai-vps.md)
