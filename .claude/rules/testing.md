---
paths:
  - "**/*.test.{ts,tsx}"
  - "**/*.spec.{ts,tsx}"
  - "tests/**"
  - "e2e/**"
---

# Testing

- Unit/component tests: Vitest + Testing Library. End-to-end: Playwright (Chromium is preinstalled in cloud sessions, never run `playwright install`).
- Every lead-capture form needs tests for: validation, success, server error, and spam/honeypot handling.
- Test behavior, not implementation. Query by role and label, not by class names.
- Fixtures use obviously fake people and properties (e.g. "Jane Test", "Villa Example 01"). Never real client data.
- Never skip, disable or delete a failing test to get green. Fix the cause or flag it.
- Before saying a change is done: lint, typecheck, and the relevant tests must pass. Report failures honestly with the output.
