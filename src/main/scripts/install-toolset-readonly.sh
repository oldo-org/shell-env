#! /bin/bash -ex
 
svn co https://github.com/guppy4j/toolset/trunk ~/.toolset

ln -s ~/.toolset/src/main/config/etc ~/.etc

ln -s ~/.toolset/src/main/scripts .
chmod ugo+x ~/scripts/*.sh

~/scripts/symlink-etc-files.sh 

