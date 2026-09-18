# Free and Local LLM Options

This repository separates **free-tier hosted inference** from **local/self-hosted models**. Free availability, quotas, model names, and provider policies can change, so verify the provider's current documentation before production use.

## 1. OpenRouter free models

OpenRouter provides a unified API for many providers and exposes a Free Models Router:

```text
openrouter/free
```

It automatically selects from currently available free models. OpenRouter also lets you select individual models marked `(free)`. Free models can have different rate limits and availability from paid models, so treat them as development/low-volume resources.

Example:

```bash
export OPENROUTER_API_KEY="YOUR_KEY"
curl https://openrouter.ai/api/v1/chat/completions \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "openrouter/free",
    "messages": [{"role":"user","content":"Say hello"}]
  }'
```

Never commit the key.

## 2. Local Ollama

For private/local inference, Ollama can expose an HTTP API from a machine or GPU VPS.

Typical workflow:

```bash
ollama serve
ollama pull llama3.1:8b
ollama run llama3.1:8b
```

For remote use, protect the endpoint with a private network, firewall, reverse proxy, or another authentication layer. Do not expose an unauthenticated Ollama API to the public Internet.

## 3. Example self-hosted coding models

Models used in the MULTEXPK development workflow have included Ollama-hosted coding/reasoning models such as:

- `llama3.1:8b`
- Qwen-family models hosted through Ollama/GGUF

Exact model tags should be checked at deployment time because model repositories and tags change.

## 4. Google Antigravity

Google Antigravity provides a model selector with free-plan availability that can change over time. The official model documentation currently lists several reasoning models for the Free plan, including Gemini, Claude and GPT-OSS variants.

Use the official Antigravity model/plan documentation rather than hard-coding a permanent list into deployment scripts.

## 5. Choosing a model

| Use case | Practical starting point |
|---|---|
| Quick coding task | Small/fast hosted free model |
| Long coding session | Local model or provider with suitable quota |
| Privacy-sensitive code | Local/self-hosted model |
| Multi-provider fallback | OpenRouter or OmniRoute |
| High reliability production work | A provider/model with explicit production SLA or paid quota |

Free does not mean unlimited, private, or guaranteed. Always check the current provider limits and data-handling terms.

## Official references

- OpenRouter: https://openrouter.ai/docs
- OpenRouter free router: https://openrouter.ai/openrouter/free
- OpenCode providers: https://opencode.ai/docs/providers
- Google Antigravity models: https://antigravity.google/docs/models
