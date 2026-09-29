---
description: Review the current branch diff for bugs, security, accessibility and brand fit
argument-hint: "[optional base branch, default main]"
---

Base branch: `$ARGUMENTS` (if empty, use `main`).

Review the changes on the current branch against that base.

1. Run `git diff <base>...HEAD --stat`, then read the full diff.
2. Delegate a correctness pass to the `code-reviewer` subagent and, if the diff touches forms, API routes, Supabase, auth or env vars, a parallel pass to the `security-auditor` subagent.
3. Check against `.claude/rules/` (code style, testing, API conventions) and the hard rules in `CLAUDE.md`.
4. Run the fast checks that exist (`npm run lint`, `npm run typecheck`, `npm test`) and report the real output.

Output a list ranked by severity: `file:line`, the problem, why it matters, the concrete fix. End with a clear verdict: ready, ready with nits, or not ready.

Do not push, merge or comment on GitHub. Report only.
