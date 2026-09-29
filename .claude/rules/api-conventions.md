---
paths:
  - "app/api/**"
  - "src/app/api/**"
  - "**/actions.ts"
  - "lib/supabase/**"
  - "supabase/**"
---

# API and data conventions

- Prefer Server Actions for form submissions; Route Handlers for webhooks and third-party callbacks.
- Validate every input on the server with Zod. Never trust client-side validation alone.
- Responses: `{ ok: true, data }` or `{ ok: false, error: { code, message } }`. Never leak stack traces or internal errors to the client.
- Supabase: Row Level Security on every table, no exceptions. The service-role key is server-only and never imported into client components.
- Schema changes go through migration files in `supabase/migrations/`, reviewed and approved before being applied to any remote project.
- Lead forms: rate limiting plus honeypot, store consent timestamp, log minimal PII.
- Secrets only through environment variables. Document every new variable in `.env.example` (names only, no values).
