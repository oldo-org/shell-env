#!/bin/bash

# todo: use nul separator to deal with spaces in paths

find . \ 
  -regextype 'posix-extended' \
  -iregex '.*\.(gif|jpg|png)' \ 
  -printf "%h\n" 
| sort -u



