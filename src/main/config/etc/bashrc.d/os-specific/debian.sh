#! /bin/bash

alias show='apt-cache show'
alias search='apt-cache search'

alias files='dpkg -L'
alias selections='dpkg --get-selections'

alias install='sudo apt install'
alias reinstall='sudo apt install --reinstall'

alias update='sudo apt update'
alias upgrade='sudo apt upgrade'

alias remove='sudo apt remove'
alias purge='sudo apt remove --purge'
alias autoremove='sudo apt autoremove'
