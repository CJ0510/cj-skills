# Kernel Source Repository Workflow

Use this workflow when an answer depends on a real Linux source tree or when the learner asks to prepare one.

## 1. Establish repository identity

Prefer a user-provided or already available local repository. Determine:

- absolute repository path;
- whether it is a Git worktree;
- current commit and nearest relevant tag;
- clean, modified, or untracked working-tree state;
- configured remotes when version history is needed;
- target architecture and important kernel configuration when behavior depends on them.

Do not assume a directory named `linux` contains the intended version.

## 2. Protect existing work

Treat modifications and untracked files as learner-owned. Do not reset, clean, switch branches, overwrite configuration, or rebuild in place unless requested. If the desired revision conflicts with current work, offer a separate clone or Git worktree instead of altering the active checkout.

## 3. Select the source mode

### Read-only local analysis

Use the current tree when its revision matches the question. Record the commit used for evidence.

### Version comparison

Use tags or separate worktrees so each path is inspected at an explicit revision. Do not construct one synthetic call path from multiple versions.

### Missing source

Explain what repository and history depth are required. A shallow source archive may answer current-code questions but not Git archaeology. Fetch or clone only with user authorization, and prefer the smallest history that still supports the question.

## 4. Verify source claims

Use static evidence appropriate to the claim:

- definition and declaration: `rg`, `git grep`, tags, or language tooling;
- direct caller/callee: source search plus control-flow inspection;
- callback or function pointer: registration site and dispatch path;
- generated or configuration-dependent code: build configuration and generated artifacts;
- historical rationale: commit and mailing-list evidence.

Distinguish a textual match from a proven runtime call path. Label architecture-specific and configuration-gated branches.

## 5. Record provenance

For substantial notes, capture:

```yaml
source:
  repository: <path or canonical URL>
  commit: <full commit id>
  tag: <tag when applicable>
  architecture: <architecture>
  config: <config path or important options>
```

If any field is unknown, state the assumption rather than inventing it.

## 6. Build and runtime boundary

Source reading does not imply permission to configure, compile, install, boot, or instrument a kernel. Treat those as separate actions. Before proposing runtime verification, confirm that the running kernel corresponds closely enough to the analyzed source and configuration.
