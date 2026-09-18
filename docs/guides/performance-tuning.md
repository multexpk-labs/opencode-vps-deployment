# VPS Performance Tuning

Performance tuning should start with measurement.

## Baseline first

Record:

- CPU utilization;
- RAM and swap;
- disk latency;
- network latency;
- application latency;
- inference throughput.

Then change one variable at a time.

## Common areas

### CPU

Check process utilization and CPU saturation before adding workers.

### Memory

Avoid uncontrolled concurrency. Monitor swap and application memory.

### Storage

Keep model and application data on storage appropriate for the workload. Watch disk space and I/O wait.

### Network

Measure latency to external APIs and clients. A fast local application can still feel slow when an upstream API is distant.

### Application workers

More workers do not automatically mean more throughput. Match concurrency to available CPU, RAM, and downstream capacity.

## AI inference

For self-hosted models, test:

- quantization;
- context length;
- batch/concurrency settings;
- CPU/GPU placement;
- model loading behavior.

Record the configuration with each benchmark.

---

**MULTEXPK LTD ®™**  
Secure Cloud • VPS • Hosting • Automation
