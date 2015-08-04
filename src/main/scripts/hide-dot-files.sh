#! /bin/sh

cd

for f in \.[a-z]*; do
 attrib +H +S "$f"
done
