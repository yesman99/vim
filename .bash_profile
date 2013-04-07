export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

export PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

### alias
alias ll="ls -la"
alias mampsql="/Applications/MAMP/Library/bin/mysql -uroot -p --socket=/Applications/MAMP/tmp/mysql/mysql.sock"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


### nvm
source ~/.nvm/nvm.sh
nvm use "v0.8.15"
export NODE_PATH=${NVM_PATH}_modules
export PATH=/usr/local/bin:$PATH

### git
if [ -r "/usr/share/git-core/git-completion.bash" ]; then
source "/usr/share/git-core/git-completion.bash"
PS1="[\u \[\033[1m\]\$(__git_ps1 \"%s \")\[\033[0m\]\w]\\$ "
else
:
fi
