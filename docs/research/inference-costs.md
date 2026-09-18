# Inference Cost Research

Inference cost is more than an API price. A useful estimate includes the complete operating model.

## Hosted inference

A simple usage model is:

**Total API cost = input tokens × input rate + output tokens × output rate**

Actual provider billing may include additional dimensions, so use the provider's current pricing documentation for production calculations.

Record:

- model;
- provider;
- input/output pricing;
- cached-token pricing if applicable;
- expected token volume;
- date checked.

## Self-hosted inference

A practical monthly model is:

**Infrastructure cost + storage + bandwidth + electricity + operations**

For a VPS or dedicated server, include the monthly server allocation even if the machine also runs other workloads.

## Break-even thinking

Instead of asking whether local or hosted inference is universally cheaper, estimate both for your workload:

1. Monthly requests
2. Average input tokens
3. Average output tokens
4. Required concurrency
5. Hardware requirement
6. Monthly infrastructure cost
7. Engineering/maintenance time

Then document the assumptions.

## Important caveat

Provider prices, free tiers, quotas, models, and hardware costs change. Never hard-code a current price into research without recording the source and date.

---

**MULTEXPK LTD ®™**  
Secure Cloud • VPS • Hosting • Automation  
For VPS and AI infrastructure options: [multexpk.com](https://multexpk.com)
