# System-wide .bashrc file for interactive bash(1) shells.
#if [ -z "$PS1" ]; then
#   return
#fi

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

PS1="\033[32m[\H/\W $]\033[0m "

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

# path exports
export PATH="$PATH:/Users/bdecoste/Documents/work/slashjoin/node_modules/.bin"
export EDITOR=vim
