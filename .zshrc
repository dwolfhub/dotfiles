export PATH="/opt/local/bin:/opt/local/sbin:$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:$HOME/.composer/vendor/bin:/usr/bin:$HOME/.symfony/bin:$HOME/.ebcli-virtual-env/executables"

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
alias ll="ls -lah"

# jump to path and open vim
jv() {
    j $1
    vi .
}

# Git aliases
alias gs="git status"
alias gsh="git show"
alias gb="git branch"
alias gcb="git checkout -b"
alias gco='git checkout $(git branch | fzf)'
alias gcom="git checkout main"
alias gr="git remote -v"
alias grpo="git remote prune origin"
alias grao="git remote add origin"
alias grh="git reset head"
alias gst="git stash"
alias gsa="git stash apply"
alias ga="git add"
alias gap="git add -p"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gdn="git diff --name-only"
alias gdm="git diff origin/main"
alias gdmn="git diff origin/main --name-only"
alias gdc="git diff --cached"
alias gp="git push -u origin HEAD"
alias gps="git push -u origin HEAD"
alias gpf="git push -u origin HEAD -f"
alias gpl="git pull"
alias gf="git fetch"
alias gpll="git pull --ff"
alias gbd="git branch -d"
alias gpo="git push origin"
alias gcl="git checkout -- "
alias gc="git commit -m"
alias grb="git rebase -i"
alias grbc="git rebase --continue"
alias grbm="git rebase -i origin/main"
alias grbma="git rebase -i origin/master"
alias grbp="git rebase -i origin/primary"
alias gm="git merge"
alias gl="git log --pretty=format:\"%h%x09%an%x09%ar%x09%s\" -n 1000"
alias gw="git wip"

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

# Random Helpers
portsearch() {
    lsof -nP -i4TCP:$1 | grep LISTEN
}
parseurl() {
    python ~/dotfiles/url-parser.py $1
}

# what is my IP?
alias my-ips="ifconfig | grep \"inet \" | cut -f2 | cut -d\" \" -f 2"

# clear git branches that are already merged
alias git-branch-clear='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# hub aliased to git
eval "$(hub alias -s)"

export FZF_DEFAULT_OPTS='--height 30%'
export FZF_DEFAULT_COMMAND='ag --hidden --skip-vcs-ignores --ignore vendor --ignore "**/__snapshots__/" --ignore .git --ignore node_modules --ignore "*.swp" -l -g ""'
export FZF_CTRL_T_COMMAND="ag --hidden --skip-vcs-ignores --ignore .git --ignore node_modules --ignore \"*.swp\" -l -g \"\""
export FZF_ALT_C_COMMAND="ag --hidden --skip-vcs-ignores --ignore .git --ignore node_modules --ignore \"*.swp\" -l -g \"\" $HOME"
export FZF_COMPLETION_TRIGGER=","


 . /usr/local/opt/fzf/shell/key-bindings.zsh
 . /usr/local/opt/fzf/shell/completion.zsh

_fzf_complete_yarn() {
  _fzf_complete --multi --reverse --prompt="yarn> " -- "$@" < <(
    jq ".scripts|keys|.[]" package.json | gsed 's/.$//; s/^.//'
  )
}


PROMPT='%B%F{blue}%1~%f%b %(?.%F{green}>.%F{magenta}>)%f '

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

# export PATH=$PATH:$(npm config --global get prefix)/bin

# Android Studio Env Vars
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools

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

export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

#[ -f '~/.zshenv' ] && . ~/.zshenv

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '~/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '~/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '~/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '~/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export TERM=xterm-256color-italic

#if [ -f '/usr/local/opt/asdf/asdf.sh' ]; then . /usr/local/opt/asdf/asdf.sh; fi
#if [ -f '/usr/local/opt/asdf/asdf.sh' ]; then . /usr/local/opt/asdf/asdf.sh; fi

source ~/.zsh-nvm/zsh-nvm.plugin.zsh

 # if [ -s "$HOME/.nvm/nvm.sh" ]; then
 #   export NVM_DIR="$HOME/.nvm"
 #   source $HOME/.nvm/nvm.sh 
 # fi

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

setopt share_history

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
