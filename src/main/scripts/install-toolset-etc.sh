#! /bin/bash -ex

target=$1

ssh $1 -C 'svn co https://github.com/guppy4j/toolset/trunk ~/.toolset'
ssh $1 -C 'ln -s ~/.toolset/src/main/config/etc ~/.etc'
ssh $1 -C 'ln -s ~/.toolset/src/main/scripts .'
ssh $1 -C 'chmod ugo+x ~/scripts/*.sh'
ssh $1 -C '~/scripts/symlink-etc-files.sh'
