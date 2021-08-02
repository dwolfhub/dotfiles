
# Path
export PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$/usr/local/go/bin:/opt/local/bin:/usr/local/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/wolf/Downloads/mongodb-osx-x86_64-2.4.9/bin:/usr/local/share/npm/bin:/Users/wolf/.rbenv/shims:/usr/local/sbin:/bin:/usr/sbin:/sbin:/Users/wolf/pear/bin:/usr/local/mysql-5.6.19-osx10.7-x86/bin:/Users/danielwolf/.composer/vendor/bin:/opt/local/sbin:/usr/bin:/usr/local/mysql-5.7.12-osx10.11-x86_64/bin:/opt/vagrant/embedded/gems/bin/:/Users/danielwolf/bin:/usr/local/share/dotnet:/Users/danielwolf/Downloads/flutter/bin:/Applications/Postgres.app/Contents/Versions/11/bin:$HOME/.dotnet/tools:/usr/local/go/bin:$HOME/go/bin"

# case-insensitive auto-complete with tab
#bind "set completion-ignore-case on"

# if tab auto-complete ambiguous, just show options
#bind "set show-all-if-ambiguous on"

# allows running aliases as sudo
alias sudo='sudo '

# listing directory shortcuts
alias ll="ls -la"

# Docker shortcuts
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dlf="docker-compose logs -f"

# Symfony shortcuts
alias sc='symfony console'
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
export FZF_DEFAULT_COMMAND='ag --hidden --skip-vcs-ignores --ignore "**/__snapshots__/" --ignore .git --ignore node_modules --ignore "*.swp" -l -g ""'
export FZF_CTRL_T_COMMAND="ag --hidden --skip-vcs-ignores --ignore .git --ignore node_modules --ignore \"*.swp\" -l -g \"\""
export FZF_ALT_C_COMMAND="ag --hidden --skip-vcs-ignores --ignore .git --ignore node_modules --ignore \"*.swp\" -l -g \"\" $HOME"
# export FZF_COMPLETION_TRIGGER="'"
#
. /usr/local/opt/fzf/shell/key-bindings.zsh
. /usr/local/opt/fzf/shell/completion.zsh


PROMPT='%B%F{blue}%1~%f%b %(?.%F{green}>.%F{magenta}>)%f '

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT="%F{green}["\$vcs_info_msg_0_"]%f"
#PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'

# basic
#PS1='\[\e[0;36m\]$\[\e[0;39m\] '

autoload -Uz compinit && compinit


# export PATH=$PATH:$(npm config --global get prefix)/bin

# Android Studio Env Vars
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' original true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/Users/danielwolf/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Stop at slashes when jumping around with option+somekey
export WORDCHARS=${WORDCHARS/\/}

_direnv_hook() {
  trap -- '' SIGINT;
  eval "$("/usr/local/bin/direnv" export zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z ${precmd_functions[(r)_direnv_hook]} ]]; then
  precmd_functions=( _direnv_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z ${chpwd_functions[(r)_direnv_hook]} ]]; then
  chpwd_functions=( _direnv_hook ${chpwd_functions[@]} )
fi

# export PATH="/usr/local/opt/php@7.4/bin:$PATH"
# export PATH="/usr/local/opt/php@7.4/sbin:$PATH"

export PATH="/usr/local/opt/python@3.7/bin:/Users/danielwolf/Library/Python/3.7/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/python@3.7/lib"
export PKG_CONFIG_PATH="/usr/local/opt/python@3.7/lib/pkgconfig"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/danielwolf/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/danielwolf/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/danielwolf/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/danielwolf/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export TERM=xterm-256color-italic

. /usr/local/opt/asdf/asdf.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
