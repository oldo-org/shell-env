#! /bin/bash -ex

cd
test -d .etc || (echo "~/.etc missing" && exit 1)

symlink() {
  dot_file=".$1"
  rm -f "$dot_file"
  ln -s ".etc/$1" "$dot_file"
}

symlink bashrc
symlink bash_profile
symlink minttyrc
symlink inputrc
symlink vimrc