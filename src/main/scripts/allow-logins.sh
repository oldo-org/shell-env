#!/bin/bash

usage() {
  echo "Usage: $(basename $0) user number-of-logins"
}
test $# -ne 2 && usage && exit 2

u="$1"
n="$2"

d=".logins-remaining/"

if [ "$n" -eq "$n" ]; then
  # n is a number and we can go ahead
  cd /home/$u
  rm -rf $d
  mkdir -p $d/$n
  cd $d
  chown -R $u.$u .
  echo "ls $(pwd) : $(ls)"
fi
