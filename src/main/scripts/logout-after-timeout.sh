#! /bin/bash

sleep "$(cat /etc/logins/timeout)"
mpg123 -o pulse "/usr/local/share/audio/stop-now.mp3"

if xhost >/dev/null 2>&1 ; then 
  xfce4-session-logout --logout
else 
  kill -15 -1
  exit
fi


