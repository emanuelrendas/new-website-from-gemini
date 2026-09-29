---
description: Investigate and fix a GitHub issue end to end on a feature branch
argument-hint: "<issue number>"
---

Fix GitHub issue #$ARGUMENTS in this repository.

1. Read the issue (use the GitHub MCP tools) and restate the problem and acceptance criteria in one short list.
2. Locate the relevant code. Reproduce the problem first (failing test or clear repro steps).
3. Implement the smallest fix that solves it. Follow `.claude/rules/`.
4. Add or update a test that would have caught it.
5. Run lint, typecheck and tests. Paste the real results.
6. Commit on a feature branch with a message referencing the issue (`Fix #$ARGUMENTS: ...`).

Stop before opening a PR or pushing to `main`: summarise the change and ask for approval.
