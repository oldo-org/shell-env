#!/bin/bash

usage() {
  echo "Usage: $(basename $0) minutes"
}

test $# -ne 1 && usage && exit 2

add-screentime-minutes.sh emil $1
add-screentime-minutes.sh henry $1

