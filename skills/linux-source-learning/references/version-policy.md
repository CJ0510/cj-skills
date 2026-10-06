# Kernel Version Policy

## Default baseline

Use Linux v6.1 for source paths, structures, APIs, and behavior unless the learner requests another version or the available source tree clearly targets another release.

Before making detailed claims, identify the version from reliable repository evidence such as a tag, commit, `Makefile`, or user-provided context. If the version cannot be established, state the assumption.

## Separation rule

Never blend implementations from different releases into one path. Use explicit sections:

- **v6.1 baseline** — the primary explanation.
- **Later kernels** — what changed and in which known version range.
- **Motivation** — evidence for why it changed.
- **Learning implication** — which concepts remain stable.

For example, explain the v6.1 CFS selection path as the baseline and discuss EEVDF as later evolution. Do not insert later functions into a v6.1 call path.

## When comparison is useful

Compare versions when an algorithm, semantic contract, field, function, synchronization method, or public API materially changed, or when the learner's source differs from the baseline.

Prefer a focused diff of the relevant concept over a release-by-release catalog.
