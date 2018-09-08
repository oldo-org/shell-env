#! /bin/bash

if [ -d /cygdrive/c ]; then
  rm -rf /cygdrive/c/Users/$USER/AppData/Local/Microsoft/Windows/Temporary*
  rm -rf /cygdrive/c/Users/$USER/AppData/Local/Temp/*
  rm -rf /cygdrive/c/tmp/*
fi

