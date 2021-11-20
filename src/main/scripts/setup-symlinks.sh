#! /bin/bash -ex

cd

test -d .etc || (echo "~/.etc : directory missing" && exit 1)

symlink() {
  file="$1"
  test ! -h "$file" -a -f "$file" && mv --no-clobber "$file" "$file.orig"
  rm -f "$file"
  ln -s "$2.etc/${file#\.}" "$file"
}

symlink .bashrc
symlink .bash_profile
symlink .minttyrc
symlink .inputrc
symlink .vimrc

cd .config

symlink user-dirs.dirs "../"


