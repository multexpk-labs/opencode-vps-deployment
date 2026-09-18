# AI Agent Architecture

An AI coding agent is a system, not just a model.

## Core components

```text
User
  |
  v
Agent / UI
  |
  +---- Model provider
  |
  +---- Tools
  |       +---- Shell
  |       +---- Files
  |       +---- APIs
  |       +---- MCP
  |
  +---- Context / memory
  |
  +---- Gateway / routing
  |
  v
Project / Infrastructure
```

## Typical layers

### Agent client

Handles prompts, context, tool calls, approvals, and the interaction loop.

Examples include OpenCode and other agent clients.

### Model

Produces text, structured output, tool calls, or code.

The model may be local or hosted.

### Tools

Tools allow the agent to interact with systems.

Examples:

- shell commands;
- filesystem operations;
- Git;
- HTTP APIs;
- databases;
- MCP servers.

### Gateway

A gateway can provide a common API surface, routing, logging, or provider selection.

A gateway does not create model access or bypass provider authorization.

### Infrastructure

The agent needs a controlled environment with CPU, RAM, storage, network access, authentication, and monitoring.

## Security boundaries

Treat agent tools as privileged capabilities.

Use:

- least-privilege accounts;
- isolated projects;
- explicit credentials;
- network controls;
- backups;
- audit logs where appropriate;
- approval for destructive actions.

## Design question

Before deploying an agent, define what it is allowed to read, modify, execute, and access over the network. The model should not be considered a security boundary by itself.

---

**MULTEXPK LTD ®™**  
Secure Cloud • VPS • Hosting • Automation
