#!/bin/bash

usage() {
  echo "Usage: $(basename $0) number-of-logins"
}

test $# -ne 1 && usage && exit 2

allow-logins.sh emil $1
allow-logins.sh henry $1

