#!/bin/bash

d=".logins-remaining/"

u="$1"
n="$2"

if [ "$n" -eq "$n" ]; then
  # n is a number and we can go ahead
  cd /home/$u
  rm -rf $d
  mkdir -p $d/$n
  cd $d
  chown -R $u.$u .
  echo "ls $(pwd) : $(ls)"
fi
