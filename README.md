# dotfiles

Managed with [chezmoi](https://chezmoi.io) in symlink mode, shared between a work and a personal Mac.

## New machine

```sh
brew install chezmoi jq 1password-cli
git clone git@github.com:dwolfhub/dotfiles.git ~/dev/dotfiles
chezmoi init --source ~/dev/dotfiles   # asks once: personal or work
chezmoi diff                            # review
chezmoi apply
```

## Day to day

- Plain files (tmux, kitty, nvim, ...) are symlinks into this repo. Edit them in place.
- Templates (`*.tmpl`: zshrc, gitconfig) render to real files. Edit the source (`chezmoi edit ~/.zshrc`), then `chezmoi apply`.
- `dot` (alias for `chezmoi cd`) drops you into the repo to commit and push.
- On the other machine: `chezmoi update` (git pull + apply).

## What goes where

| Kind of config | Where it lives |
|---|---|
| Same on both machines | This repo |
| Personal-only | This repo, behind `{{ if eq .machine "personal" }}` |
| Secrets (personal) | 1Password, via `{{ onepasswordRead "op://..." }}` in templates |
| Anything work-specific | **Never in this repo.** Untracked overlay files on the work Mac |

Overlay files are optional, untracked, and loaded last so they win:

| Config | Overlay |
|---|---|
| zsh | `~/.zshrc.local` |
| git | `~/.gitconfig.local` (e.g. work `user.email`) |
| tmux | `~/.tmux.local.conf` |
| kitty | `~/.config/kitty/local.conf` |
| nvim | `~/.config/nvim/lua/local.lua` |
| Claude Code | `~/.claude/settings.local-overlay.json` |

## Claude Code settings

Claude Code rewrites `~/.claude/settings.json` itself, so it isn't symlinked. `dot_claude/modify_settings.json.tmpl` merges three layers on each apply:
1. The live file.
2. `claude-settings.json` from this repo.
3. The local overlay.

Permission lists are unioned. To share a new setting, add it to `claude-settings.json`. Keys Claude adds at runtime are left alone.

`misc/` holds reference files that chezmoi doesn't install.
