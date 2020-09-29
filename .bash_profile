
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

alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dlf="docker-compose logs -f"

# Symfony shortcuts
alias sc='symfony console'
alias sstart='symfony local:server:start'

# what is listening on port?
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

# xdebug remote start/stop
alias xdebug-start='sed -i "" "s/xdebug.remote_autostart=0/xdebug.remote_autostart=1/g" $(php --ini | sed -n "2p" | cut -d" " -f 12)'
alias xdebug-stop='sed -i "" "s/xdebug.remote_autostart=1/xdebug.remote_autostart=0/g" $(php --ini | sed -n "2p" | cut -d" " -f 12)'

# ctags using macports version
#alias ctags="/opt/local/bin/ctags"

# vagrant
alias vu="vagrant up --provision"
alias vd="vagrant suspend"
alias vdf="vagrant destroy -f"
alias vs="vagrant ssh"
alias vgs="vagrant global-status"

PROMPT='%(?.%F{green}☀️.%F{red}⛈)%f  %B%F{blue}%1~%f%b %# '

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

# NVM
if [ -s ~/.nvm/nvm.sh ]; then
    NVM_DIR=~/.nvm
    source ~/.nvm/nvm.sh
fi

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
# export PATH="/usr/local/opt/php@7.3/bin:$PATH"
# export PATH="/usr/local/opt/php@7.3/sbin:$PATH"


export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/readline/include"
export CFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/readline/include"


export PATH=/Users/danielwolf/.pyenv/versions/3.7.2/bin:$PATH
export PATH="/Users/danielwolf/.ebcli-virtual-env/executables:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/danielwolf/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/danielwolf/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/danielwolf/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/danielwolf/google-cloud-sdk/completion.zsh.inc'; fi

hash -d projects=~/Projects
setopt auto_cd


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
