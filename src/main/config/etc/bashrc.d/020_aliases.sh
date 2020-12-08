#! /bin/bash

# determine if a command is an executable, alias, keyword or function
alias whatis='type -a'

# Interactive verbose operation...
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
 
# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Use colours when grepping
alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
 
# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

# database
alias pg='sudo su - postgres -c "psql postgres"'
