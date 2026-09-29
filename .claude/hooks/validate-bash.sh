#!/usr/bin/env bash
# PreToolUse hook for Bash. Blocks destructive commands and forces a confirmation
# prompt for anything that changes external state (production, main, database).
# Exit 2 = block (stderr goes back to Claude). JSON "ask" = prompt the user.

input="$(cat)"
cmd="$(printf '%s' "$input" | jq -r '.tool_input.command // empty' 2>/dev/null)"
[ -z "$cmd" ] && exit 0

block() { echo "Blocked by .claude/hooks/validate-bash.sh: $1" >&2; exit 2; }
ask() {
  jq -n --arg r "$1" '{hookSpecificOutput:{hookEventName:"PreToolUse",permissionDecision:"ask",permissionDecisionReason:$r}}'
  exit 0
}

# Hard blocks
echo "$cmd" | grep -Eq 'rm -rf (/|~|\$HOME|\.)( |$)'                       && block "recursive delete of a root/home/project directory"
echo "$cmd" | grep -Eq 'git push.*(--force|-f( |$)|--force-with-lease)'  && echo "$cmd" | grep -Eq '(main|master)' && block "force push to main"
echo "$cmd" | grep -Eq 'git reset --hard origin/(main|master)'           && block "hard reset onto main, discard risk"
echo "$cmd" | grep -Eq '(cat|less|head|tail|echo).*\.env($|\.| )' && ! echo "$cmd" | grep -q '\.env\.example' && block "printing .env secrets"
echo "$cmd" | grep -Eq 'git add .*\.env($|\.local| )'                    && block "staging a .env file"

# Approval gate: external state changes
echo "$cmd" | grep -Eq 'git push.*(origin )?(main|master)( |$)'          && ask "Push to main needs owner approval"
echo "$cmd" | grep -Eq 'git merge'                                       && ask "Merge needs owner approval"
echo "$cmd" | grep -Eq 'vercel .*(--prod|promote|rollback)'              && ask "Production deploy/promote needs owner approval"
echo "$cmd" | grep -Eq 'supabase (db push|db reset|migration up|functions deploy)' && ask "Supabase remote change needs owner approval"
echo "$cmd" | grep -Eq 'npm publish'                                     && ask "Publishing a package needs owner approval"

exit 0
