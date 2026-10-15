#!/bin/sh
input=$(cat)
cwd=$(echo "$input" | jq -r '.cwd')

# Virtual environment indicator
venv_info=""
if [ -n "$VIRTUAL_ENV" ]; then
    venv_info="(venv) "
fi

# Current directory (basename only, like %1~)
dir=$(basename "$cwd")

# Git branch and status (skip optional locks)
git_info=""
branch=$(git -C "$cwd" -c core.hooksPath=/dev/null symbolic-ref --short HEAD 2>/dev/null)
if [ -n "$branch" ]; then
    dirty=""
    if ! git -C "$cwd" -c core.hooksPath=/dev/null diff --quiet 2>/dev/null || \
       ! git -C "$cwd" -c core.hooksPath=/dev/null diff --cached --quiet 2>/dev/null; then
        dirty="*"
    fi
    git_info=" [$branch$dirty]"
fi

# Context usage
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
ctx_info=""
if [ -n "$used" ]; then
    ctx_info=" ctx:$(printf '%.0f' "$used")%"
fi

printf "%s%s%s%s" "$venv_info" "$dir" "$git_info" "$ctx_info"
