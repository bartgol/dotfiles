# .bashrc
if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

# Change the annoyng fact that HOME is set to /ascldap/users/lbertag
# due to the fact that /ascldap/users -> /home
HOME=/home/lbertag

# Load git completion stuff
source $HOME/.git-completion.bash

# Not storing consecutive commands duplicates
export HISTCONTROL=ignoredups

# Enabling 256 colors
export TERM=xterm-256color

# Colors
export GREEN='\[\033[38;5;40m\]'   # Green
export BROWN='\[\033[38;5;130m\]'  # Brown

#LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
#export LS_COLORS

export LS_COLORS='di=33:fi=32:ln=94:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=93:*.rpm=90'

# Function that retrieves the current branch name if we're in a git repo tree
function parse_git_branch {
  command git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ (\1)/'
}

PS1="$GREEN\u@\h:[\W${BROWN}\$(parse_git_branch)${GREEN}]\$ "
#PS1="$GREEN\u@\h:[\W]\$ "

export EDITOR=vim

export PRINTER=Lead

# User specific aliases and functions
alias ls='ls --color'
alias vi='vim'
alias ping='ping -c3'
alias load-modules-common='source ~/modules/common'
alias load-modules-gcc='source ~/modules/gcc'
alias load-modules-intel='source ~/modules/intel'
alias load-modules-trilinos-gcc='source ~/modules/trilinos-gcc'
alias load-modules-trilinos-debug-gcc='source ~/modules/trilinos-debug-gcc'
alias load-modules-trilinos-intel='source ~/modules/trilinos-intel'
alias octave='octave --no-gui'

# PATH env variable
PATH=$PATH:$HOME/bin/hwloc
PATH=$PATH:$HOME/bin/trilinos
export PATH

# LD_LIBRARY_PATH env variable
LD_LIBRARY_PATH=/usr/lib64
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/lbertag/lib/hwloc

export LD_LIBRARY_PATH
