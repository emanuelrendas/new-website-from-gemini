---
name: deploy
description: Project release workflow for this website. Use when the user asks to deploy, ship, publish, go live, or create a preview of the site. Wraps the generic deploy-to-vercel skill with this project's pre-flight checks and approval gate.
---

# Deploy (project workflow)

Project-specific settings live in [deploy-config.md](deploy-config.md). Read it first.

## 1. Pre-flight (always)

Run and report the real output of each; stop on any failure:

1. `git status` is clean, current branch is not `main`.
2. `npm run lint`
3. `npm run typecheck`
4. `npm test`
5. `npm run build`
6. Every env var the code reads is listed in `.env.example` and set in Vercel for the target environment (check names only, never print values).

## 2. Preview deploy (no approval needed)

- Push the feature branch; Vercel creates the preview automatically once the Git integration is linked.
- If not linked yet, follow the `deploy-to-vercel` skill and deploy as **preview**.
- Share the preview URL with a short checklist of what to look at.

## 3. Production (approval required)

- Never deploy to production, merge to `main`, promote a deployment or run Supabase migrations without an explicit "yes, ship it" from the owner **in this conversation**.
- Before asking, give: what changed, pre-flight results, preview URL, and the rollback plan (Vercel instant rollback to the previous deployment).
- After release: smoke-test the pages listed in `deploy-config.md` and report.
