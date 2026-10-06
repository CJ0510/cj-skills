# Verification Workflow

Connect a source-level claim to observable evidence.

## Core loop

`question -> prediction -> measurement -> observation -> explanation -> source mapping`

Record the kernel version, relevant configuration, architecture, workload, CPU topology, and environmental assumptions that could change the result.

## Choose the lightest adequate evidence

- Static relationship: `rg`, `git grep`, clangd, cscope, build artifacts.
- Function execution path: ftrace function/function_graph or trace-cmd.
- Scheduler behavior: scheduler tracepoints, perf sched, trace-cmd.
- Hotspots and counters: perf stat/record/report, `/proc`, `/sys`, vmstat, pidstat.
- Custom values not otherwise exposed: eBPF, kprobe, or fentry only when needed.

Do not use a more invasive mechanism merely because it is more advanced. Check tool availability, kernel configuration, permissions, tracing overhead, and probe safety before prescribing commands.

## Experiment card

```markdown
### Question
What source-level claim is being tested?

### Prediction
What observable pattern follows from the current model?

### Setup
Version, configuration, workload, topology, and controls.

### Measurement
Commands or instrumentation and why they are sufficient.

### Expected evidence
What would support or contradict the prediction?

### Interpretation
How does the observation map back to functions, structures, and state changes?

### Failure analysis
Which assumptions, dropped events, filters, build options, or competing mechanisms should be checked?
```

Separate actual observations from expected results. Never claim an experiment ran unless it did.
