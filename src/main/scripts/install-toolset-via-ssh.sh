#! /bin/bash -ex

name=shell-env
target=$1

ssh_run() {
  ssh $target -C "$1"
}

ssh_run "svn co https://github.com/guppy4j/${name}/trunk ~/.${name}"

scripts="~/.${name}/src/main/scripts"

ssh_run "chmod u+x ${scripts}/setup-symlinks.sh"
ssh_run "${scripts}/setup-symlinks.sh"

ssh_run "ln -s --force --backup=simple ~/.{name}/src/main/config/etc .etc"
ssh_run "ln -s --force --backup=simple ${scripts} ."
ssh_run "chmod ugo+x ~/scripts/*.sh"
