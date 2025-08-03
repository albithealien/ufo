stty -ixon

# Interactive
[[ $- != *i* ]] && return

# Environment
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\]\u\[$(tput setaf 7)\]@\[$(tput setaf 4)\]\h\[$(tput setaf 7)\][\w]\[$(tput setaf 7)\]\$ \[$(tput sgr0)\]"
export export HISTSIZE= HISTFILESIZE=
export EDITOR="vi" VISUAL="vi"
export PATH="$PATH:~/go/bin"

# Colored man pages
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'
export LESS_TERMCAP_ue=$'\E[0m'

# Aliases
alias ls='ls -hN --color=auto --group-directories-first'
alias cp="cp -v"
alias mv="mv -v"
alias rm="rm -v"
alias aria="aria2c"
alias objdump="objdump -M intel"
alias find="fd"
alias grep="rg"
alias dig="q"
alias free="free -h"
alias dh="dh -h"
alias df="df -h"
alias nano="micro"

# Bindings
bind '"\C-t": edit-and-execute-command'

# Attaching to a tmux session!
# tmux attach-session -t name || tmux new-session -s name
