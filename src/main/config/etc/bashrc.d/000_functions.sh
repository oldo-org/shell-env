#! /bin/bash

# custom remote login command for shared servers
# where others use the same user account
sbash() {
  ssh -t "$1" "bash --rcfile ~/.etc/bashrc"
}