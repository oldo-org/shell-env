#! /bin/bash -ex

cd

ln -s --force --backup=simple .toolset/src/main/config/etc .etc
ln -s --force --backup=simple .toolset/src/main/scripts .
chmod ugo+x scripts/*.sh

test -d .etc || (echo "~/.etc : directory missing" && exit 1)

symlink() {
  dot_file=".$1"
  test -e "$dot_file" && mv --no-clobber "$dot_file" "$dot_file.orig"
  rm -f "$dot_file"
  ln -s ".etc/$1" "$dot_file"
}

symlink bashrc
symlink bash_profile
symlink minttyrc
symlink inputrc
symlink vimrc

