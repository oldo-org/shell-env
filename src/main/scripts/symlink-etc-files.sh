#! /bin/bash -ex

cd
test -d .etc || (echo "~/.etc missing" && exit 1)

symlink() {
  dot_file=".$1"
  mv --no-clobber "$dot_file" "$dot_file.orig"
  rm -f "$dot_file"
  ln -s ".etc/$1" "$dot_file"
}

symlink bashrc
symlink bash_profile
symlink minttyrc
symlink inputrc
symlink vimrc