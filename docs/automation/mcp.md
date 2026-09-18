# MCP with OpenCode

Model Context Protocol (MCP) allows OpenCode to connect external tools, prompts and resources.

## Local MCP

A local MCP server can run as a child process on the VPS.

    OpenCode
      -> MCP server process
      -> external tool/resource

## Remote MCP

A remote MCP server can use an HTTP endpoint.

Keep credentials in environment variables or another secret store rather than placing secrets directly in the repository.

## Context considerations

Every MCP server can add tools and descriptions to the model context. Too many tools can increase context usage and reduce clarity.

Enable only the MCP servers needed for the project.

## Production checklist

- [ ] MCP source is trusted.
- [ ] Credentials use least privilege.
- [ ] Network access is restricted.
- [ ] Unneeded servers are disabled.
- [ ] Tool permissions are understood.
- [ ] Remote endpoints use HTTPS.
- [ ] Secrets are not committed.

Use the current OpenCode MCP documentation for the exact configuration syntax because MCP configuration evolves with OpenCode releases.
