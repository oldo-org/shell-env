#! /bin/sh

if xhost >/dev/null 2>&1 ; then 
  echo "Display exists"
else 
  echo "Display invalid"
fi
