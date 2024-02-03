#! /bin/bash

alias show='apt-cache show'
alias search='apt-cache search'

alias files='dpkg -L'
alias selections='dpkg --get-selections'

alias install='sudo apt-get install'
alias reinstall='sudo apt-get install --reinstall'

alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'

alias remove='sudo apt-get remove'
alias purge='sudo apt-get remove --purge'
alias autoremove='sudo apt-get autoremove'
