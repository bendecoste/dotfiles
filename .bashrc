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

set -o vi

# Make bash check its window size after a process completes
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

. ~/.nvm/nvm.sh

if [ -f ~/.git-completetion.bash ]; then
  . ~/.git-completion.bash
fi

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

PS1="$BLUE\w $GREEN\$(parse_git_branch)$LIGHT_GRAY: $CLEAR"
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

#PS1="\033[32m[\H/\W $]\033[0m "

alias clr='clear'
alias ls='gls -F --group-directories-first'
alias sj='cd ~/Documents/slashjoin'
alias serv='cd ~/Documents/services'
alias starthaproxy="sudo launchctl start org.haproxy"
alias stophaproxy="sudo launchctl stop org.haproxy"

alias grep="grep --color=auto"


alias gis="node ~/Documents/slashjoin/server.dev.js"
alias gisd=" DEBUG_MODE=1 node ~/Documents/slashjoin/server.dev.js"

alias psrestart="fab local services:stop; fab local services:start"

# path exports
export PATH="$PATH:/Users/bdecoste/Documents/slashjoin/node_modules/.bin"
export EDITOR=vim

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm

redis-del() {
  redis-cli KEYS $1 | xargs redis-cli DEL
}
del-cache() {
  redis-del "data:*"
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/Cellar/git/1.8.2/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/share/python:$PATH"
source ~/.git-completion.bash

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
export PATH=/usr/local/bin:/usr/local/share/python:/usr/local/sbin:/usr/local/Cellar/git/1.8.2/bin:/usr/local/heroku/bin:/Users/bdecoste/.rvm/gems/ruby-1.9.2-p320/bin:/Users/bdecoste/.rvm/gems/ruby-1.9.2-p320@global/bin:/Users/bdecoste/.rvm/rubies/ruby-1.9.2-p320/bin:/Users/bdecoste/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/share/python:/usr/local/sbin:/usr/local/Cellar/git/1.8.2/bin:/usr/local/heroku/bin:/Users/bdecoste/.rvm/gems/ruby-1.9.2-p320/bin:/Users/bdecoste/.rvm/gems/ruby-1.9.2-p320@global/bin:/Users/bdecoste/.rvm/rubies/ruby-1.9.2-p320/bin:/Users/bdecoste/.rvm/bin:/Users/bdecoste/.nvm/v0.10.11/bin:/Users/bdecoste/Documents/slashjoin/node_modules/.bin:/Users/bdecoste/Documents/slashjoin/node_modules/.bin:/Users/bdecoste/.rvm/bin
