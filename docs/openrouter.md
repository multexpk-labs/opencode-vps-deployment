# OpenRouter Guide

OpenRouter provides an OpenAI-compatible API endpoint and access to many model providers through one API.

## Create a key

Create an API key from the OpenRouter dashboard.

Store it outside source control:

Linux/macOS:

```bash
export OPENROUTER_API_KEY="sk-or-v1-YOUR-KEY"
```

PowerShell:

```powershell
$env:OPENROUTER_API_KEY="sk-or-v1-YOUR-KEY"
```

For a server, prefer a protected environment file or secret manager.

## Test the API

```bash
curl https://openrouter.ai/api/v1/chat/completions \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "openrouter/free",
    "messages": [
      {"role":"user","content":"Reply only with: OPENROUTER_OK"}
    ]
  }'
```

## OpenCode

OpenCode supports multiple LLM providers and can store provider credentials through its `/connect` workflow. Provider configuration can also use a custom base URL, which is useful when a gateway or proxy is in front of the provider.

For OpenRouter, keep the API key on the server and select the desired OpenRouter model through OpenCode.

Do not place keys in `opencode.json`, README files, Git commits, screenshots, or shell history where avoidable.

## Free models

The `openrouter/free` router automatically chooses from available free models. Individual free models can also be selected by their model ID.

Free model availability and rate limits can change.

## Key security

If a key is exposed:

1. Disable/delete the compromised key.
2. Create a replacement key.
3. Update the server secret.
4. Restart affected services.
5. Check Git history and logs for exposure.

OpenRouter recommends protecting keys and keeping them out of source control.

## References

- Quickstart: https://openrouter.ai/docs/quickstart
- API keys: https://openrouter.ai/docs/api/api-reference/api-keys/create-keys
- Models: https://openrouter.ai/docs/api/api-reference/models/get-models
- Free Models Router: https://openrouter.ai/openrouter/free
