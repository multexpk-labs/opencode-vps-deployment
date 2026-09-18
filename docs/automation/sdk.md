# OpenCode SDK and Automation

OpenCode exposes a server API and provides a JavaScript/TypeScript SDK for programmatic integrations.

## Use cases

The SDK can be used for internal developer tools, automation dashboards, controlled job runners, custom interfaces, CI/CD integrations and workflow orchestration.

## Client example

A simplified client-only pattern is:

    import { createOpencodeClient } from "@opencode-ai/sdk"

    const client = createOpencodeClient({
      baseUrl: "http://127.0.0.1:4096",
    })

Keep automated clients on the private network where possible.

## Security

Do not expose an unauthenticated automation endpoint. Treat an OpenCode server as a privileged development service because it may be able to read project files and invoke tools.

## Versioning

Pin or record the SDK/OpenCode versions used by production automation. Re-test after upgrades because API and configuration details can evolve.
