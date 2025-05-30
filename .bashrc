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

set -o vi


# Proxy
#https://wiki.archlinux.org/title/Proxy_server
export http_proxy="http://127.0.0.1:7897"
export https_proxy=$http_proxy
export all_proxy=$http_proxy
export no_proxy="localhost,127.0.0.1,::1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,*.local"
