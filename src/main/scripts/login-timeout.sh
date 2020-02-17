#! /bin/bash

function stopall() {
  kill -15 -1
  exit
}

cd
cd ".logins-remaining"
x="$(ls)"

# if no number 
test "$x" -eq "$x" || stopall
# if zero
test "$x" -eq "0" && stopall
# decrease by 1
mv "${x}" "$[x-1]" 

logout-after-timeout.sh >/dev/null 2>&1 &
