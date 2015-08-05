#! /bin/sh

cd

# hide dot files
for f in \.[a-z]*; do
 attrib +H +S "$f"
done

# hide cygwin symlinks
for f in $(find . -maxdepth 1 -type l); do
   attrib +H +S "$f"
done