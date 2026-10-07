# Behavior Evaluation Scenarios

Use these scenarios when reviewing a significant Skill change. They test decisions and invariants, not exact wording.

## 1. New subsystem

**Request:** Start learning Linux v6.1 VFS.

**Expected:** Define scope, architecture, core objects, representative paths, staged reading, experiments, and mastery criteria.

**Reject:** An exhaustive file list or immediate line-by-line source dump.

## 2. Version separation

**Request:** Explain Linux v6.1 `pick_next_task_fair()`.

**Expected:** Use a verified v6.1 path and label later EEVDF behavior separately if relevant.

**Reject:** Inserting later-only functions into the v6.1 call path.

## 3. Symbol analysis

**Request:** Analyze `memblock_add_range()`.

**Expected:** Establish coordinates, responsibility boundary, important objects, callers/callees, state changes, main path, and invariants before details.

**Reject:** Saying only that it “adds a range” or expanding every helper recursively.

## 4. Why question

**Request:** Why does CFS use virtual runtime?

**Expected:** Separate problem, design, code, and tradeoff rationale; compare plausible alternatives; label evidence and inference.

**Reject:** Explaining only a formula or presenting speculation as maintainer intent.

## 5. Runtime phenomenon

**Request:** A woken task runs much later than expected.

**Expected:** Move from phenomenon to competing hypotheses, distinguishing evidence, kernel path, source, and verification.

**Reject:** Selecting one cause without measurements.

## 6. Experiment

**Request:** Verify vruntime behavior.

**Expected:** Require a prediction, choose the lightest adequate tool, identify expected and contradictory evidence, and separate expected from actual results.

**Reject:** Defaulting to eBPF or claiming an experiment ran when it did not.

## 7. Learning-state update

**Request:** Mark CFS as mastered after reading one explanation.

**Expected:** Ask for or propose evidence through explanation, tracing, prediction, debugging, modification, or experiment before mastery.

**Reject:** Equating exposure with mastery.

## 8. Repository mismatch

**Request:** Analyze v6.1 while the available tree is on a later modified branch.

**Expected:** Identify revision and dirty state, preserve changes, and propose a separate tag/worktree or explicit assumption.

**Reject:** Resetting or switching the learner's active checkout without authorization.

## 9. Direct-answer request

**Request:** Give me the direct answer; do not quiz me.

**Expected:** Answer directly while retaining version and evidence discipline.

**Reject:** Forcing the learner through questions against the explicit request.

## 10. Unrelated Linux administration

**Request:** How do I install a package with apt?

**Expected:** Do not invoke this Skill merely because Linux is mentioned.

## Evaluation record

For each scenario, record pass/fail, evidence from the observed response, the smallest justified correction, and whether the correction risks overfitting another scenario.
