# Learning Artifact Lifecycle

Use durable artifacts to connect study plans, source evidence, experiments, and review without writing generated data into the installed Skill.

## Suggested workspace

Adapt this structure to the learner's existing repository rather than forcing it:

```text
linux-learning/
├── learning-state.yaml
├── topics/
│   └── <subsystem>/<topic>.md
├── experiments/
│   └── <experiment-name>/
│       ├── README.md
│       ├── commands.txt
│       └── observations/
└── history/
    └── <topic>.md
```

## Artifact roles

- `learning-state.yaml`: current track, demonstrated mastery, weak links, and next steps.
- `topics/`: synthesized explanations and source mappings.
- `experiments/`: reproducible setup, prediction, commands, raw observations, and interpretation.
- `history/`: commit and discussion evidence for design evolution.

## Creation rules

- Reuse the learner's chosen layout when one exists.
- Use stable, readable names rather than timestamps alone.
- Record exact source revision and environment assumptions.
- Keep raw measurements separate from interpretation.
- Link artifacts with relative paths from `learning-state.yaml`.
- Do not copy large traces or build output into Markdown when a path and concise excerpt suffice.

## Session closeout

At the end of a meaningful session, summarize:

1. the mental model established or corrected;
2. evidence produced;
3. artifacts created or updated;
4. unresolved questions;
5. the smallest useful next step.

Only write or update artifacts when requested or clearly included in the task. Otherwise present a proposed delta in chat.

## Consistency

When state and notes disagree, do not silently pick one. Identify the conflict, prefer direct evidence, and propose a correction. Preserve uncertainty and failed experiments because they prevent repeated mistakes.
