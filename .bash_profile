export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

export PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

### alias
alias ll="ls -la"
alias mampsql="/Applications/MAMP/Library/bin/mysql -uroot -p --socket=/Applications/MAMP/tmp/mysql/mysql.sock"
alias sc="screen"
alias phpunit="phpunit --process-isolation"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### apportable
# export PATH="/Users/abeyuya/.apportable/SDK/bin:$PATH"


### nvm
source ~/.nvm/nvm.sh
nvm use "v0.8.15"
export NODE_PATH=${NVM_PATH}_modules
export PATH=/usr/local/bin:$PATH


### android development 2013/5/31
export PATH=$PATH:/Users/abeyuya/android-sdks/platform-tools 

### MySQL Path Setting
export PATH=$PATH:/usr/local/mysql/bin

### php path
export PATH="/Applications/MAMP/bin/php/php5.4.4/bin:$PATH"


### git
#if [ -r "/usr/share/git-core/git-completion.bash" ]; then
#source "/usr/share/git-core/git-completion.bash"
#PS1="[\u \[\033[1m\]\$(__git_ps1 \"%s \")\[\033[0m\]\w]\\$ "
#else
#:
#fi
