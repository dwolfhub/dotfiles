
# Path 
export PATH="/usr/local/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/wolf/Downloads/mongodb-osx-x86_64-2.4.9/bin:/usr/local/share/npm/bin:/Applications/MAMP/bin/php/php5.4.4/bin:/Users/wolf/.rbenv/shims:/usr/local/sbin:/bin:/usr/sbin:/sbin:/Users/wolf/pear/bin:/Applications/MAMP/Library/bin:/opt/local/bin:/usr/local/mysql-5.6.19-osx10.7-x86/bin:/Users/danielwolf/.composer/vendor/bin:/opt/local/sbin:/usr/bin:/usr/local/mysql-5.7.12-osx10.11-x86_64/bin:/opt/vagrant/embedded/gems/bin/:/Users/danielwolf/bin"

# command prompt
prompt_command() {
    _VC_PROMPT=$(~/dotfiles/bin/vcprompt --format="%b%m%a")
    if [ -z "$_VC_PROMPT" ]
    then
        if [ -z "$VIRTUAL_ENV" ]
        then
            export PS1="\[\033[0;97m\]\W 💣 \[\033[0;37m\] "
        else
            export PS1="\[\033[0;97m\]\W  \[\033[1;32m\]v 💣 \[\033[0;37m\] "
        fi
    else
        if [ -z "$VIRTUAL_ENV" ]
        then
            export PS1="\[\033[0;97m\]\W \[\033[0;91m\]$_VC_PROMPT 💣  \[\033[0;37m\]"
        else
            export PS1="\[\033[0;97m\]\W \[\033[0;91m\]$_VC_PROMPT \[\033[1;32m\]v 💣  \[\033[0;37m\]"
        fi
    fi
}
PROMPT_COMMAND=prompt_command

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

# php should use newest macport php7 version
alias php="/opt/local/bin/php70"

# NVM
if [ -s ~/.nvm/nvm.sh ]; then
    NVM_DIR=~/.nvm
    source ~/.nvm/nvm.sh
fi
