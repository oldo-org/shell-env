#! /bin/bash

# remote login on shared servers
sbash() {
  ssh -t "$1" "bash --rcfile ~/.etc/bashrc"
}

