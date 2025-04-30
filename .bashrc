#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '
#PS1='[\033[01;32m\]\u@\h \033[01;34m\]\W\[\033[00m\]]\$ '
PS1='\033[01;32m\]\u@\h\033[00m\]:\033[01;34m\]\W\033[00m\]\$ '

#export http_proxy=http://127.0.0.1:7890
#export https_proxy=$http_proxy

set -o vi
