# case-insensitive auto-complete with tab
#bind "set completion-ignore-case on"

# if tab auto-complete ambiguous, just show options
#bind "set show-all-if-ambiguous on"
#
alias pmu='python -m unittest'

# allows running aliases as sudo
alias sudo='sudo '

alias connmouse='blueutil --pair 04-f1-3e-f0-49-df'

# listing directory shortcuts
alias ll="ls -lahF --color=auto"

# jump to path and open vim
jv() {
    j $1
    vi .
}

alias vi="nvim"
alias vim="nvim"

# Git aliases
alias ga="git add"
alias gap="git add -p"
alias gb="git branch"
alias gbd="git branch -d"
alias gc="git commit -m"
alias gclo="git clone"
alias gca="git commit --amend"
alias gcb="git checkout -b"
alias gcl="git checkout -- "
alias gco='git checkout $(git branch | fzf)'
alias gcom="git checkout main"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdm="git diff origin/main"
alias gdmn="git diff origin/main --name-only"
alias gdn="git diff --name-only"
alias gf="git fetch"
alias gl="git log --pretty=format:\"%h%x09%an%x09%ar%x09%s\" -n 1000"
alias gm="git merge"
alias gp="git push -u origin HEAD"
alias gpf="git push -u origin HEAD -f"
alias gpl="git pull"
alias gpll="git pull --ff"
alias gpo="git push origin"
alias gpr="gh pr create -f"
alias gprm="gh pr merge --squash --delete-branch"
alias gps="git push -u origin HEAD"
alias gr="git remote -v"
alias grao="git remote add origin"
alias grb="git rebase -i"
alias grbc="git rebase --continue"
alias grbm="git rebase -i origin/main"
alias grbma="git rebase -i origin/master"
alias grbp="git rebase -i origin/primary"
alias grh="git reset head"
alias grpo="git remote prune origin"
alias grro="git remote remove origin"
alias gs="git status"
alias gsa="git stash apply"
alias gsh="git show"
alias gst="git stash"
alias gw="git wip"
# clear git branches that are already merged
alias git-branch-clear='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Docker aliases
alias dcu="docker-compose up -d"
alias dcud="docker-compose up -d"
alias dcd="docker-compose down"
alias dclf="docker-compose logs -f"
alias dcl="docker-compose logs"

# Yarn aliases
alias y="yarn"
alias ya="yarn add"
alias yr="yarn remove"
alias ys="yarn start"
alias yb="yarn build"
alias yd="yarn dev"

# npm aliases
alias ni="npm install"
alias ns="npm start"
alias nt="npm test"

# nvm aliases
alias nu="nvm use"

# zsh shortcuts
alias src="source ~/.zshrc"
alias rmf="rm -rf"

# Symfony shortcuts
alias sc='symfony console'
alias scomp='symfony composer'
alias stest='symfony php ./vendor/bin/phpunit'
alias sstart='symfony local:server:start -d'
alias slist='symfony local:server:list'
alias sstat="symfony server:status"
alias sstop="symfony server:stop"
alias srun="symfony run -d"
alias sdoc="symfony run -d docker compose up"
alias slog="symfony local:server:log"
alias sprox="symfony local:proxy:start"

alias k="kubectl"
alias kn="kubens"

# Pyton VENV
alias sv="source venv/bin/activate"
alias nv="python3.12 -m venv venv && sv"
alias dv="deactivate"

# Random Helpers
portsearch() {
    lsof -nP -i4TCP:$1 | grep LISTEN
}
parseurl() {
    python ~/dotfiles/url-parser.py $1
}

# what is my IP?
alias my-ips="ifconfig | grep \"inet \" | cut -f2 | cut -d\" \" -f 2"

# hub aliased to git
# eval "$(hub alias -s)"

FZF_DEFAULT_OPTS='--layout reverse --bind ctrl-n:down,ctrl-p:up' \
FZF_DEFAULT_COMMAND='ag --hidden --skip-vcs-ignores --ignore venv --ignore ios --ignore vendor --ignore "**/__snapshots__/" --ignore .git --ignore node_modules --ignore out --ignore dist --ignore "*.swp" -l' \
FZF_CTRL_T_COMMAND="ag --hidden --skip-vcs-ignores --ignore .git --ignore node_modules --ignore \"*.swp\" -l -g \"\"" \
FZF_ALT_C_COMMAND="ag --hidden --skip-vcs-ignores --ignore .git --ignore node_modules --ignore \"*.swp\" -l -g \"\" $HOME" \
FZF_COMPLETION_TRIGGER="," \
FZF_CTRL_R_OPTS="
  --bind 'ctrl-r:up'
  --bind 'ctrl-s:down'
" \

_fzf_complete_yarn() {
  _fzf_complete --multi --reverse --prompt="yarn> " -- "$@" < <(
    jq ".scripts|keys|.[]" package.json | gsed 's/.$//; s/^.//'
  )
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
#RPROMPT="%F{green}["\$vcs_info_msg_0_"]%f"
# RPROMPT=""
#RPROMPT=\$vcs_info_msg_0_'%# '
# zstyle ':vcs_info:git:*' formats '%b'

# basic
#PS1='\[\e[0;36m\]$\[\e[0;39m\] '

# autoload -Uz compinit && compinit

export PATH="$HOME/dev/homebrew/bin:/opt/homebrew/bin:/opt/local/bin:/opt/local/sbin:$HOME/.gem/ruby/2.6.0/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:$HOME/.composer/vendor/bin:/usr/bin:$HOME/.symfony/bin:$HOME/.ebcli-virtual-env/executables:/Users/wolfdx3/.local/bin"
export PATH="/Users/wolfdx3/aws-cli:$PATH"

# export PATH=$PATH:$(npm config --global get prefix)/bin

# Android Studio Env Vars
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# The following lines were added by compinstall
# zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
# zstyle ':completion:*' original true
# zstyle ':completion:*' verbose true
# zstyle :compinstall filename '~/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall

# Stop at slashes when jumping around with option+somekey
export WORDCHARS=${WORDCHARS/\/}

# export PATH="/usr/local/opt/php@7.4/bin:$PATH"
# export PATH="/usr/local/opt/php@7.4/sbin:$PATH"

# export PATH="/usr/local/opt/python@3.7/bin:~/Library/Python/3.7/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/python@3.7/lib"
# export PKG_CONFIG_PATH="/usr/local/opt/python@3.7/lib/pkgconfig"

# export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@3/include"

# export PATH="/Users/wolfdx3/dev/homebrew/opt/openssl@1.1/bin:$PATH"
# export LDFLAGS="-L/Users/wolfdx3/dev/homebrew/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/Users/wolfdx3/dev/homebrew/opt/openssl@1.1/include"
export LDFLAGS="-L/Users/wolfdx3/dev/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/Users/wolfdx3/dev/homebrew/opt/openssl@3/include"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

#[ -f '~/.zshenv' ] && . ~/.zshenv

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '~/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '~/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '~/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '~/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# export TERM=xterm-256color-italic

#if [ -f '/usr/local/opt/asdf/asdf.sh' ]; then . /usr/local/opt/asdf/asdf.sh; fi

[ -f /Users/wolfdx3/dev/homebrew/etc/profile.d/autojump.sh ] && . /Users/wolfdx3/dev/homebrew/etc/profile.d/autojump.sh

setopt share_history

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
#
export NVM_DIR="$HOME/.nvm"
# Sourcing nvm.sh costs ~2s per shell. Instead, put the newest installed node
# matching the default alias on PATH directly, and only load nvm itself the
# first time `nvm` is actually called.
_nvm_default_bin=($NVM_DIR/versions/node/v$(<$NVM_DIR/alias/default)*(N/nOn[1]))
[[ -n $_nvm_default_bin ]] && export PATH="$_nvm_default_bin/bin:$PATH"
unset _nvm_default_bin
nvm() {
  unfunction nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}

# export PATH="/opt/homebrew/opt/php@8.1/sbin:$PATH"
# export PATH="/opt/homebrew/opt/php@9.3/bin:$PATH"
# export PATH="/Users/wolfdx3/.pyenv/bin:$PATH"
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
export PATH="/Users/wolfdx3/.bin:$PATH"
export HOMEBREW_PREFIX="$HOME/dev/homebrew"
export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
export DYLD_FALLBACK_LIBRARY_PATH="$HOMEBREW_CELLAR/openssl@3/3.4.1/lib:$DYLD_FALLBACK_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="$HOMEBREW_CELLAR/openssl@3/3.4.1/lib:$DYLD_LIBRARY_PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/wolfdx3/.docker/completions $fpath)
# Full compinit security audit costs ~1.5s; only do it once a day and use
# the cached dump otherwise.
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# End of Docker CLI completions

source "$HOMEBREW_PREFIX/opt/gitstatus/gitstatus.prompt.zsh"

# Disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Function to display virtual environment info
virtualenv_info() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo "🐍 "
    fi
}

PROMPT='$(virtualenv_info)$GITSTATUS_PROMPT %B%F{blue}%1~%f%b %(?.%F{green}>.%F{red}>)%f '

RPROMPT=''  # right prompt: git status

export DISABLE_TELEMETRY=1
#export NODE_TLS_REJECT_UNAUTHORIZED=0

# Secrets and machine-local overrides (untracked)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
