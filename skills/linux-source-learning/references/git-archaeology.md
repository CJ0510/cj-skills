# Git Archaeology

Use history to answer a specific question, not as a ritual for every symbol.

## Start with a hypothesis

State what is unexplained: a special case, changed API, surprising lock, workaround, performance tradeoff, or version difference. Define what historical evidence would answer it.

## Tool sequence

Use the narrowest useful operation:

```bash
git blame -L <start>,<end> <file>
git show <commit>
git log -p -- <file>
git log -L <start>,<end>:<file>
```

Search commit messages or mailing-list archives by stable identifiers, error text, symbol names, or patch subjects when the local history is insufficient.

## Interpret evidence

Read the commit message before focusing on the diff. Extract:

- the reported problem and reproducer;
- the old behavior and its failure;
- the constraints and alternatives mentioned;
- correctness or performance effects;
- review discussion that qualifies the claim;
- follow-up fixes or reverts.

Do not treat the introducing commit as the final design if later fixes changed its semantics. Distinguish author motivation from present-day inference.

## Output

Summarize the original problem, change, motivation, tradeoff, later evolution, and what the history changes about the learner's mental model. Include commit identifiers or primary-source links when available.
