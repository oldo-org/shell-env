#! /bin/bash -ex

name=shell-env
target=$1

ssh_run() {
  ssh $target -C "$1"
}

ssh_run "svn co https://github.com/guppy4j/${name}/trunk .${name}"

scripts=".${name}/src/main/scripts"
etc=".${name}/src/main/config/etc"

ssh_run "ln -s --force --backup=simple ${etc} .etc"
ssh_run "ln -s --force --backup=simple ${scripts} ."
ssh_run "chmod ugo+x ${scripts}/*.sh"

ssh_run "${scripts}/setup-symlinks.sh"

