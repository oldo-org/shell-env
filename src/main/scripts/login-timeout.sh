#! /bin/bash -x

stop() {
  kill -15 -1
  exit
}

cd
cd ".logins-remaining"

x="$(ls)"

# if no number 
test "$x" -eq "$x" || stop
# if zero
test "$x" -eq "0" && stop

# decrease by 1
mv "${x}" "$[x-1]" 

timeout="$(cat /etc/logins/timeout)"

sleep "${timeout}"
mpg123 -o pulse "/usr/local/share/audio/stop-now.mp3"
stop
