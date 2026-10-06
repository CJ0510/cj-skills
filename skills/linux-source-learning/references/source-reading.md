# Source Reading Workflow

Use this workflow for a function, structure, macro, field, or execution path.

## 1. Establish coordinates

Identify the kernel version, subsystem, source file, abstraction layer, and whether the code belongs to initialization, steady-state runtime, teardown, error handling, or an architecture-specific path.

## 2. Build a What Card

Capture only facts relevant to the question:

```yaml
symbol: <name>
subsystem: <area>
role: <one-sentence responsibility>
called_by: [<important callers>]
calls: [<important callees>]
inputs: [<semantic inputs>]
outputs: [<return/output effects>]
state_changed: [<objects or fields>]
not_responsible_for: [<important boundaries>]
```

Verify call relationships when source access is available. Distinguish direct calls, callbacks, function pointers, inlining, and inferred runtime paths.

## 3. Select the data model

Explain only necessary structures. For each, cover semantic meaning, ownership, lifetime, important fields, and relationships. Use an object diagram when relationships are otherwise hard to see.

## 4. Trace the main path

Present a compact path before detailed code:

```text
entry
  -> validation or selection
  -> core state transition
  -> invariant restoration
  -> result or handoff
```

Label optional branches and stop recursive expansion once helpers cease to change the model.

## 5. Analyze important implementation

Prioritize state changes, calculations, locking and ordering, reference/lifetime rules, boundary cases, error recovery, architecture constraints, and performance-sensitive branches. Deprioritize trivial wrappers, unrelated debug paths, and obvious accessors.

For a difficult line, explain:

- the local precondition;
- the invariant or race involved;
- the effect of the operation;
- what would break if it were removed or reordered;
- whether the explanation is confirmed or inferred.

## 6. Connect upward and downward

Upward: why does the subsystem need this operation?

Downward: which lower-level primitive realizes it?

Expand only the direction needed to answer the learner's question.
