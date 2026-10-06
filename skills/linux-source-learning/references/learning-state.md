# Learning State

Use a small explicit artifact to resume long-running study without reteaching known material.

## Rules

- Treat state as the learner's record, not as an unquestionable truth.
- Preserve the selected kernel version and evidence for mastery.
- Distinguish `introduced`, `practicing`, and `mastered`; do not mark mastery from exposure alone.
- Record weak links as actionable questions, not vague labels.
- Keep the next step small and causally connected to the current track.
- If no state artifact is available, say so and offer a proposed initial state.

## Suggested schema

```yaml
version: 1
kernel:
  primary: v6.1
  comparisons: []
track:
  subsystem: <name>
  topic: <name>
  current_question: <question>
concepts:
  introduced: []
  practicing: []
  mastered: []
evidence:
  - concept: <name>
    demonstrated_by: <explanation, trace, prediction, debug, or modification>
weak_links:
  - question: <specific unresolved link>
    corrective_action: <small exercise>
experiments:
  completed: []
  planned: []
next:
  - <one to three concrete steps>
```

## Resume behavior

Start from the current question and only recap prerequisites that are missing or weak. Explain why the proposed next step follows from the state.

## Update behavior

After a meaningful session, propose a concise delta: concepts moved between stages, evidence added, weak links revised, experiment results recorded, and next steps changed. Preserve unresolved uncertainty.
