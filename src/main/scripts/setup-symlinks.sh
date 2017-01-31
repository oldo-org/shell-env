#! /bin/bash -ex

cd

test -d .etc || (echo "~/.etc : directory missing" && exit 1)

symlink() {
  file=".$1"
  test -e "$file" && mv --no-clobber "$file" "$file.orig"
  rm -f "$file"
  ln -s ".etc/$1" "$file"
}

symlink bashrc
symlink bash_profile
symlink minttyrc
symlink inputrc
symlink vimrc

