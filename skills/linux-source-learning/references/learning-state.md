# Learning State

Use a small explicit artifact to resume long-running study without reteaching known material.

## Storage

Use `learning-state.yaml` in the learner's chosen study workspace. If no workspace is specified, propose a location and wait for a clear creation request before writing. Never store personal learning state inside the installed Skill directory.

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
artifacts:
  notes: []
  experiments: []
  history: []
sessions:
  last_updated: <ISO-8601 date or datetime>
  summary: <short evidence-based summary>
next:
  - <one to three concrete steps>
```

## Lifecycle

### Initialize

Confirm the primary kernel version, source-tree location if known, current track, prior knowledge, and first concrete question. Create only the minimum state needed to resume later.

### Resume

Read the state before planning. Check whether the referenced source revision and artifacts still exist. Start from the current question and only recap missing or weak prerequisites.

### Update

Propose a concise delta before changing an existing state file unless the user has already requested the exact update. Move a concept to `mastered` only when evidence shows the learner can explain, trace, predict, debug, modify, or experimentally verify it.

### Archive

When a topic is complete, preserve its evidence and artifact links, summarize the stable mental model, record remaining uncertainty, and choose the next topic by causal dependency rather than convenience.

## Resume behavior

Start from the current question and only recap prerequisites that are missing or weak. Explain why the proposed next step follows from the state.

## Update behavior

After a meaningful session, propose a concise delta: concepts moved between stages, evidence added, weak links revised, experiment results recorded, and next steps changed. Preserve unresolved uncertainty.

Avoid rewriting the whole state file when a narrow update is sufficient. Never infer that a concept is mastered merely because it appeared in a conversation.
