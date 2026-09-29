# Deploy configuration

Fill in as the project takes shape. No secrets in this file.

| Setting | Value |
|---|---|
| Hosting | Vercel |
| Vercel team / project | _TBD_ |
| Production branch | `main` |
| Production domain | _TBD_ |
| Preview deploys | every pushed branch |
| Supabase project (prod) | _TBD, project ref only_ |
| Supabase project (staging) | _TBD_ |

## Required environment variables (names only)

- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_ROLE_KEY` (server only)
- _add more here as they appear_

## Post-deploy smoke test

- Home page loads, hero image renders, no console errors
- Listings / projects page
- Lead form: submit with fake data on preview only, confirm it reaches the staging database
- Contact page, WhatsApp / phone links
- Lighthouse on home: LCP < 2.5s, CLS < 0.1
