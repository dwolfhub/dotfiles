
# Path 
export PATH="/usr/local/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/wolf/Downloads/mongodb-osx-x86_64-2.4.9/bin:/usr/local/share/npm/bin:/Applications/MAMP/bin/php/php5.4.4/bin:/Users/wolf/.rbenv/shims:/usr/local/sbin:/bin:/usr/sbin:/sbin:/Users/wolf/pear/bin:/Applications/MAMP/Library/bin:/opt/local/bin:/usr/local/mysql-5.6.19-osx10.7-x86/bin:/Users/danielwolf/.composer/vendor/bin:/opt/local/sbin:/usr/bin:/usr/local/mysql-5.7.12-osx10.11-x86_64/bin:/opt/vagrant/embedded/gems/bin/:/Users/danielwolf/bin:/usr/local/share/dotnet"

# case-insensitive auto-complete with tab
bind "set completion-ignore-case on"
# if tab auto-complete ambiguous, just show options
bind "set show-all-if-ambiguous on"

# listing directory shortcuts
alias ll="ls -la"

# clear git branches that are already merged
alias git-branch-clear='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# ctags using macports version
#alias ctags="/opt/local/bin/ctags"

# vagrant
alias vu="vagrant up --provision"
alias vd="vagrant suspend"
alias vdf="vagrant destroy -f"
alias vs="vagrant ssh"
alias vgs="vagrant global-status"

# git autocomplete
source ~/dotfiles/git-completion.bash
source ~/dotfiles/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
PS1='\u@\h \[\e[0;91m\]\w \[\e[0;33m\]$(__git_ps1 "(%s)") \[\e[0;39m\]\n\[\e[0;36m\]$\[\e[0;39m\] '

# NVM
if [ -s ~/.nvm/nvm.sh ]; then
    NVM_DIR=~/.nvm
    source ~/.nvm/nvm.sh
fi

# Android Studio Env Vars
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
