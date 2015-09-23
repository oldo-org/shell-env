#! /bin/bash -ex

target=$1

ssh $1 -C 'svn co https://github.com/guppy4j/toolset/trunk ~/.toolset'
ssh $1 -C '~/.toolset/src/main/scripts/setup-symlinks.sh'
