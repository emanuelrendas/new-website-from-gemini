---
paths:
  - "**/*.{ts,tsx,js,jsx,css}"
---

# Code style

- TypeScript strict mode. No `any` unless justified in a comment.
- React Server Components by default; add `"use client"` only when state, effects or browser APIs are needed.
- Tailwind for styling, driven by design tokens (see the `design-tokens` skill). No hardcoded hex colors or magic spacing values in components.
- Components: PascalCase files, one component per file, colocate small helpers.
- Use `next/image` for all images (property photography is heavy), with explicit `sizes` and meaningful `alt` text.
- Use `next/font` for fonts, never external font `<link>` tags.
- Accessibility is not optional: semantic HTML, visible focus states, WCAG 2.2 AA contrast.
- Copy is premium and understated. No exclamation marks, no "cheap", "deal", "hurry". See the `ux-writing` skill.
