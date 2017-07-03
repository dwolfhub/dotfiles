
# Path 
export PATH="/usr/local/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/wolf/Downloads/mongodb-osx-x86_64-2.4.9/bin:/usr/local/share/npm/bin:/Applications/MAMP/bin/php/php5.4.4/bin:/Users/wolf/.rbenv/shims:/usr/local/sbin:/bin:/usr/sbin:/sbin:/Users/wolf/pear/bin:/Applications/MAMP/Library/bin:/opt/local/bin:/usr/local/mysql-5.6.19-osx10.7-x86/bin:/Users/danielwolf/.composer/vendor/bin:/opt/local/sbin:/usr/bin:/usr/local/mysql-5.7.12-osx10.11-x86_64/bin:/opt/vagrant/embedded/gems/bin/:/Users/danielwolf/bin"

# command prompt
prompt_command() {
    _VC_PROMPT=$(~/dotfiles/bin/vcprompt --format="%b%m%a")
    _PS1_PREFIX="\[\033[0;36m\]\h: \[\033[0;97m\]\W/ "
    if [ -z "$_VC_PROMPT" ]
    then
        if [ -z "$VIRTUAL_ENV" ]
        then
            export PS1=$_PS1_PREFIX"\[\033[0;37m\]$ "
        else
            export PS1=$_PS1_PREFIX"\[\033[1;32m\]v \[\033[0;37m\]$ "
        fi
    else
        if [ -z "$VIRTUAL_ENV" ]
        then
            export PS1=$_PS1_PREFIX"\[\033[0;91m\]($_VC_PROMPT) \[\033[0;37m\]$ "
        else
            export PS1=$_PS1_PREFIX"\[\033[0;91m\]($_VC_PROMPT) \[\033[1;32m\]v \[\033[0;37m\]$ "
        fi
    fi
}
PROMPT_COMMAND="prompt_command; $PROMPT_COMMAND"

# case-insensitive auto-complete with tab
bind "set completion-ignore-case on"
# if tab auto-complete ambiguous, just show options
bind "set show-all-if-ambiguous on"

# don't capture ctrl-s so we can use it to save in vim
vim()
{
    local STTYOPTS="$(stty -g)"
    stty stop '' -ixoff
    command /opt/local/bin/vim "$@"
    stty "$STTYOPTS"
}

# listing directory shortcuts
alias ll="ls -la"

# clear git branches that are already merged
alias git-branch-clear='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# ctags using macports version
alias ctags="/opt/local/bin/ctags"

# vagrant
alias vu="vagrant up --provision"
alias vd="vagrant suspend"
alias vdf="vagrant destroy -f"
alias vs="vagrant ssh"
alias vgs="vagrant global-status"

# git autocomplete
source ~/dotfiles/git-completion.bash

# NVM
if [ -s ~/.nvm/nvm.sh ]; then
    NVM_DIR=~/.nvm
    source ~/.nvm/nvm.sh
fi

# MongoDB Start/Stop
alias mongostart="sudo mongod -f /opt/local/etc/mongodb/mongod.conf --httpinterface --rest"

mongostop_func () {
    local mongopid=`less /opt/local/var/db/mongodb_data/mongod.lock`;
    if [[ $mongopid =~ [[:digit:]] ]]; then
        sudo kill -15 $mongopid;
        echo mongod process $mongopid terminated;
    else
        echo mongo process $mongopid not exist;
    fi
}

alias mongostop="mongostop_func"

# Android Studio Env Vars
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
