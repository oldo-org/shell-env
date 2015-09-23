#! /bin/bash -ex

target=$1

name=shell-env

ssh $1 -C "svn co https://github.com/guppy4j/${name}/trunk ~/.${name}"

setup_script="~/.${name}/src/main/scripts/setup-symlinks.sh"

ssh $1 -C "chmod u+x ${setup_script}"
ssh $1 -C "${setup_script}"
