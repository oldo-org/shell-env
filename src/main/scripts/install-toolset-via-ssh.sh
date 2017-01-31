#! /bin/bash -ex

name=shell-env
source="https://github.com/guppy4j/shell-env.git"
target=$1

ssh_run() {
  ssh $target -C "$1"
}

ssh_run "svn co ${source} .${name}" || ssh_run "git clone ${source} .${name}"

scripts=".${name}/src/main/scripts"
etc=".${name}/src/main/config/etc"

ssh_run "ln -s --force --backup=simple ${etc} .etc"
ssh_run "ln -s --force --backup=simple ${scripts} ."
ssh_run "chmod ugo+x ${scripts}/*.sh"

ssh_run "${scripts}/setup-symlinks.sh"

