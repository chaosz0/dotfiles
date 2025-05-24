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
assignProxy(){
   PROXY_ENV="http_proxy ftp_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY"
   for envar in $PROXY_ENV
   do
      export $envar=$1
   done
   for envar in "no_proxy NO_PROXY"
   do
      export $envar=$2
   done
   echo "Proxy environment vatiable set."
}

clrProxy(){
    PROXY_ENV="http_proxy ftp_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY"
    for envar in $PROXY_ENV
    do
       unset $envar
    done
    echo "Proxy environment vatiable removed."
}

myProxy(){
   #user=YourUserName
   #read -p "Password: " -s pass &&  echo -e " "
   #proxy_value="http://$user:$pass@ProxyServerAddress:Port"
   proxy_value="http://127.0.0.1:7897"
   no_proxy_value="localhost,127.0.0.1,::1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,*.local"
   assignProxy $proxy_value $no_proxy_value
}
