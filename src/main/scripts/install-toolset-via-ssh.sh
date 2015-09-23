#! /bin/bash -ex

target=$1

ssh $1 -C 'svn co https://github.com/guppy4j/shell-env/trunk ~/.shell-env'
ssh $1 -C '~/.shell-env/src/main/scripts/setup-symlinks.sh'
