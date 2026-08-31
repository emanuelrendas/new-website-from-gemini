---
name: awesome-design-md
description: Real design-system references (typography, spacing, color, buttons) reverse-engineered from top companies — Stripe, Vercel, Linear, Apple, and 70+ more. Use when the user wants Claude to build or restyle a UI "like <brand>", or needs concrete design tokens instead of generic AI defaults.
---

# Awesome Design — brand design-system references

This skill bundles `DESIGN.md` files for 70+ companies (Stripe, Vercel, Linear, Apple, Airbnb, Figma, Notion, and more), each documenting that brand's real typography scale, spacing system, color tokens, and button/component conventions.

Source: https://github.com/VoltAgent/awesome-design-md (MIT)

## How to use it

1. When the user names a brand or aesthetic ("build this like Stripe", "make it feel like Linear"), look for a matching folder under `design-md/<brand>/` (lowercase, hyphenated — e.g. `design-md/linear.app/`, `design-md/stripe/`).
2. Read the `DESIGN.md` file(s) in that folder and use the documented tokens (fonts, spacing scale, color palette, radii, shadows, button states) as the concrete source of truth instead of guessing.
3. If no exact brand match exists, pick the closest aesthetic neighbor (e.g. a fintech brand for another fintech brand) or fall back to a general design-taste skill.
4. Never claim the output *is* the referenced brand's product — use it only as a style reference for tokens and structure.

## Available references

Run `ls design-md/` (relative to this skill's folder) to see the current list of brands.
