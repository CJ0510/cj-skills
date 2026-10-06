# Why Analysis

Explain rationale without inventing it.

## Classify the question

### Problem rationale

Why does the mechanism exist? Identify the requirement, previous failure mode, or missing capability.

### Design rationale

Why this architecture or data structure? Compare plausible alternatives against the properties that matter.

### Code rationale

Why this condition, ordering, lock, barrier, counter, or special case? Look for invariants, races, overflow, lifetime, compatibility, and architecture constraints.

### Tradeoff rationale

What was exchanged among latency, throughput, fairness, scalability, memory, determinism, power, portability, and complexity?

## Evidence order

Prefer:

1. current source and tests;
2. kernel documentation;
3. commit messages and patch discussion;
4. mailing-list or maintainer discussion;
5. high-quality secondary analysis.

Primary sources can still be incomplete. Label conclusions as confirmed, strongly supported, or inferred.

## Response shape

1. State the problem being solved.
2. Identify the relevant invariant or design property.
3. Explain how the implementation preserves it.
4. Compare one or two realistic alternatives.
5. State the chosen tradeoff.
6. Cite or describe the evidence.
7. If unresolved, name the next evidence to inspect.

Trigger Git archaeology when the current code explains how but not why, when a special case looks historical, when versions diverge materially, or when the learner asks what changed.
