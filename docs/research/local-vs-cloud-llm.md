# Local vs Cloud LLMs

Choosing between local inference and hosted inference is an infrastructure decision. There is no universal deployment model.

## Local inference

A local model runs on hardware you control, commonly through a runtime such as Ollama.

Typical advantages:

- Data can remain inside your infrastructure.
- No per-request API charge from an inference provider.
- Model and runtime configuration can be controlled.
- Useful for experimentation and private development.

Typical constraints:

- Hardware and electricity have a cost.
- GPU/VRAM requirements can be significant.
- Model downloads consume storage and bandwidth.
- Operations, updates, monitoring, and backups become your responsibility.

## Cloud or hosted inference

A hosted API moves inference to an external provider.

Typical advantages:

- No GPU management for the application operator.
- Capacity can be obtained without purchasing hardware.
- Many models can be tested through one API integration.
- Infrastructure maintenance is handled by the provider.

Typical constraints:

- Requests and data leave your infrastructure.
- Provider pricing and quotas can change.
- Network latency affects interactive applications.
- Provider availability and model access can change.

## Comparison framework

| Factor | Local | Hosted |
|---|---|---|
| Hardware ownership | Required | Not required |
| Data location | Your infrastructure | Provider infrastructure |
| Scaling | Your responsibility | Provider-dependent |
| Model choice | Hardware-dependent | Provider catalog |
| API dependency | Optional | Required |
| Operations | Higher | Lower |
| Cost model | Infrastructure | Usage/subscription |

The correct choice depends on privacy requirements, workload, latency, model requirements, budget, and operational capacity.

## Hybrid architecture

A hybrid system can use:

- local Ollama for private or development workloads;
- hosted APIs for models that require more compute;
- an AI gateway for routing;
- OpenCode or another agent client as the application layer.

This allows workloads to be separated instead of forcing every task through one inference path.

---

**MULTEXPK LTD ®™**  
Secure Cloud • VPS • Hosting • Automation  
[Website](https://multexpk.com) · [AI/VPS infrastructure](../multexpk/ai-vps.md)
