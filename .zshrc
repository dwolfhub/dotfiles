# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Git
alias git-branch-clear='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# nginx
alias nginx_start='sudo launchctl load -w /Library/LaunchDaemons/org.macports.nginx.plist'
alias nginx_stop='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.nginx.plist'
alias nginx_restart='nginx_stop; nginx_start;'

#php-fpm
alias fpm_start='sudo launchctl load -w /Library/LaunchDaemons/org.macports.php56-fpm.plist'
alias fpm_stop='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.php56-fpm.plist'
alias fpm_restart='fpm_stop; fpm_start'

# ctags using macports version
alias ctags="/opt/local/bin/ctags"

# don't capture ctrl-s so we can use it to save in vim
alias vim="stty stop '' -ixoff ; /opt/local/bin/vim"
ttyctl -f

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/wolf/Downloads/mongodb-osx-x86_64-2.4.9/bin:/usr/local/share/npm/bin:/Applications/MAMP/bin/php/php5.4.4/bin:/Users/wolf/.rbenv/shims:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/wolf/pear/bin:/Applications/MAMP/Library/bin:/opt/local/bin:/usr/local/mysql-5.6.19-osx10.7-x86/bin:/Users/danielwolf/.composer/vendor/bin:/opt/local/sbin:/usr/local/mysql-5.7.12-osx10.11-x86_64/bin"
# export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/wolf/Downloads/mongodb-osx-x86_64-2.4.9/bin:/usr/local/share/npm/bin:/Applications/MAMP/bin/php/php5.4.4/bin:/Users/wolf/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/wolf/pear/bin:/Applications/MAMP/Library/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export NVM_DIR="/Users/danielwolf/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
