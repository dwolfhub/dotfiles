#!/bin/bash
# Claude Code status line: session name | dir basename | git branch | model
input=$(cat)

# Parse three fields, one per line (jq if present, else python3)
if command -v jq >/dev/null 2>&1; then
  parsed=$(printf '%s' "$input" | jq -r '[(.session_name // ""), (.model.display_name // ""), (.workspace.current_dir // .cwd // "")] | map(gsub("[\\n\\r\\t]"; " ")) | .[]' 2>/dev/null)
else
  parsed=$(printf '%s' "$input" | python3 -I -c '
import sys, json
try:
    d = json.load(sys.stdin)
except Exception:
    d = {}
def clean(v):
    return " ".join(str(v or "").split())
print(clean(d.get("session_name")))
print(clean((d.get("model") or {}).get("display_name")))
print(clean((d.get("workspace") or {}).get("current_dir") or d.get("cwd")))
' 2>/dev/null)
fi

name=$(printf '%s\n' "$parsed" | sed -n 1p)
model=$(printf '%s\n' "$parsed" | sed -n 2p)
cwd=$(printf '%s\n' "$parsed" | sed -n 3p)
[ -z "$cwd" ] && cwd=$PWD

dir=$(basename "$cwd")

# Short model name: "Sonnet 5.5" -> "sonnet"
model=$(printf '%s' "${model%% *}" | tr '[:upper:]' '[:lower:]')

branch=""
if [ -d "$cwd" ]; then
  branch=$(git --no-optional-locks -C "$cwd" symbolic-ref --short HEAD 2>/dev/null)
  [ -z "$branch" ] && branch=$(git --no-optional-locks -C "$cwd" rev-parse --short HEAD 2>/dev/null)
fi

sep=$(printf ' \033[2m|\033[0m ')
out=""
add() { if [ -z "$out" ]; then out="$1"; else out="$out$sep$1"; fi; }

[ -n "$name" ]   && add "$(printf '\033[1;33m%s\033[0m' "$name")"
[ -n "$dir" ]    && add "$(printf '\033[34m%s\033[0m' "$dir")"
[ -n "$branch" ] && add "$(printf '\033[32m%s\033[0m' "$branch")"
[ -n "$model" ]  && add "$(printf '\033[36m%s\033[0m' "$model")"

printf '%s' "$out"
