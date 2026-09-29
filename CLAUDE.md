# CLAUDE.md

Primary instructions for Claude Code in this repository. Loaded at every session start.

## Project

- New marketing website for a luxury real estate practice in Dubai: off-market and pre-launch properties for HNWIs and investors.
- Audience: discreet, high-net-worth buyers and investors. Tone: confident, understated, premium. Never loud, never "salesy".
- Status: greenfield. No app code yet; design and testing skills are installed under `.agents/skills/` (symlinked into `.claude/skills/`).

## Stack (default until decided otherwise)

- Next.js (App Router) + TypeScript + Tailwind CSS
- Hosting: Vercel (preview deploys per branch, production only on explicit approval)
- Data / leads: Supabase
- Update this section the moment the stack is confirmed or changes.

## Commands

Fill in once `package.json` exists:

- `npm run dev`, local dev server
- `npm run lint`, lint
- `npm run typecheck`, `tsc --noEmit`
- `npm test`, unit tests
- `npm run build`, production build

## Hard rules

1. **Approval gate.** Anything that touches external state needs explicit approval from the owner first: merging to `main`, production deploys, Supabase writes or migrations, sending email, any message to an investor or lead. Preview deploys and pushes to feature branches are fine.
2. **Never commit secrets.** `.env*`, API keys, Supabase service keys stay out of git. Use `.env.local` (gitignored) and Vercel env vars.
3. **Client data is confidential.** No real names, phone numbers, emails or property addresses of clients/investors in code, fixtures, commits or logs. Use obviously fake data.
4. **Off-market means off-market.** Never publish listing details that are marked private or pre-launch without explicit sign-off.
5. Work on feature branches, small commits, clear messages.

## Where things live

- `.claude/rules/`, modular rules (code style, testing, API conventions), some scoped to file paths
- `.claude/commands/`, slash commands: `/review`, `/fix-issue`
- `.claude/skills/`, auto-loaded skills (design, Vercel, and the project `deploy` skill)
- `.claude/agents/`, subagents: `code-reviewer`, `security-auditor`
- `.claude/hooks/`, event scripts (`validate-bash.sh` guards risky shell commands)
- `.mcp.json`, shared MCP servers (Vercel, Supabase read-only)
- Personal overrides: `CLAUDE.local.md` and `.claude/settings.local.json` (both gitignored)
