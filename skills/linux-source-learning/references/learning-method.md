# Learning Method

## Goal

Optimize for mastery of a coherent mechanism:

`mental model -> source -> rationale -> evidence -> review`

One well-understood execution path is more valuable than many disconnected functions.

## New-subsystem workflow

1. Define what is inside and outside the subsystem.
2. State the problem it solves and its external contracts.
3. Draw a compact architecture map.
4. Select only the core data structures needed for the first path.
5. Choose one to three representative execution paths.
6. Order reading from model to data to path to implementation.
7. Attach a prediction-based experiment to each major concept.
8. Define observable mastery criteria.

Avoid turning the plan into a list of every source file.

## Active-learning moves

Use these selectively:

- Ask the learner to predict a branch outcome or runtime behavior before revealing it.
- Ask for a compact call graph or object relationship in their own words.
- Compare the prediction with code or trace evidence.
- Offer a hint before a complete explanation when the learner is exploring.
- Give the full answer immediately if requested or if withholding it would obstruct progress.

## Mastery criteria

A learner should be able to:

1. explain why the mechanism exists;
2. place it in the subsystem;
3. relate its core objects and ownership;
4. trace the primary execution path;
5. explain key invariants and design choices;
6. predict representative runtime behavior;
7. choose evidence that would validate the prediction;
8. localize a related failure or performance problem;
9. propose a small source or workload change that tests understanding.

For review, prefer scenario questions over recall questions. If an answer is weak, identify the missing link and propose the smallest corrective exercise.
