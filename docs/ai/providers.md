# OpenCode Providers

OpenCode supports many LLM providers, local models and custom OpenAI-compatible endpoints.

## Basic workflow

1. Connect provider credentials.
2. Configure the provider if it is custom or needs a proxy.
3. List models.
4. Select the model.
5. Test a small request before production use.

Typical commands:

    /connect
    /models

OpenCode stores credentials added through /connect in its local authentication store. Do not copy that file into Git.

## Custom OpenAI-compatible provider

A generic pattern is:

    {
      "$schema": "https://opencode.ai/config.json",
      "provider": {
        "myprovider": {
          "npm": "@ai-sdk/openai-compatible",
          "name": "My Provider",
          "options": {
            "baseURL": "https://llm.example.com/v1"
          },
          "models": {
            "my-model": {
              "name": "My Model"
            }
          }
        }
      }
    }

The exact configuration syntax can change between OpenCode generations. Check the current official provider documentation before copying a production configuration.

## Proxying a provider

A compatible proxy can be placed between OpenCode and the upstream provider:

    OpenCode
       |
    baseURL
       |
    AI gateway / proxy
       |
    Provider API

## Provider troubleshooting

Check:

    opencode auth list
    opencode models

Then verify:

- provider ID matches configuration
- endpoint includes the correct API path
- model ID exists
- credentials are valid
- the selected runtime/package matches the API format
- network/DNS/TLS access works

Never paste an API key into a public issue or repository.

## Official reference

See the current OpenCode provider documentation for supported providers, credentials, custom endpoints and model configuration.
