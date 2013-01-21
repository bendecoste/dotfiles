# System-wide .bashrc file for interactive bash(1) shells.
#if [ -z "$PS1" ]; then
#   return
#fi

# colors
       BLUE="\[\033[0;34m\]"
        RED="\[\033[0;31m\]"
  LIGHT_RED="\[\033[1;31m\]"
      GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
      CLEAR="\[\033[0m"

HISTCONTROL=ignoredups:ignorespace

# Make bash check its window size after a process completes
shopt -s checkwinsize
# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
	local SEARCH=' '
	local REPLACE='%20'
	local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
	printf '\e]7;%s\a' "$PWD_URL"
    }
    PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi

source ~/.nvm/nvm.sh
source ~/.rvm/scripts/rvm

if [ -f ~/.git-completetion.bash ]; then
  . ~/.git-completion.bash
fi

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

PS1="$LIGHT_GRAY\W($RED\$(parse_git_branch)$LIGHT_GRAY) ➜ $CLEAR"

alias hintbrws='cp ~/Documents/work/slashjoin/.jshintrc.browser ~/Documents/work/slashjoin/.jshintrc'
alias hintnode='cp ~/Documents/work/slashjoin/.jshintrc.node ~/Documents/work/slashjoin.jshintrc'
alias clr='clear'
alias ls='ls -GF'
alias sj='cd ~/Documents/work/slashjoin'
alias serv='cd ~/Documents/work/services'
alias starthaproxy="sudo launchctl start org.haproxy"
alias stophaproxy="sudo launchctl stop org.haproxy"

alias grep="grep --color=auto"


alias gis="node ~/Documents/work/slashjoin/server.dev.js"

alias gco='git checkout' # Checkout shortcut
alias gc='git cherry -v' # Show unpushed commits
alias gs='git status' # Status shortcut
alias gfm='git fetch; git  merge --no-ff' # Fetch and merge
alias gpr='git pull --rebase origin' # Pull rebase from origin
alias gb='git branch'
alias gd='git diff'
alias pyhub='python ~/Documents/hack/GoHub/py/gist.py'

# path exports
export PATH="$PATH:/Users/bdecoste/Documents/work/slashjoin/node_modules/.bin"
export EDITOR=vim
