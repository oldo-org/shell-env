#! /bin/bash

function symlinks() {
  find -L . -xtype l -samefile $1
}
function directories() {
  find -maxdepth 1 -name '[^\.]*' -type d -printf '%P\n'
}
function title() {
  echo "${1%.*}" | tr '-' ' '
}
function prefix() {
  for link in $(symlinks $1); do
    prefix+="$(basename $link) "
  done
  echo "$prefix"
}
function anchors() {
  echo "<p>"
  for x in $@; do
    echo "<a href='$(basename $x)' title="$(title $x)">$(prefix $x)</a>"
  done
  echo "</p>"
}

cd "$1"

rm -f index.html

shopt -s nullglob

cat << EOF > index.html
<!DOCTYPE html>
<html>
<head>
 <title>$(title $(basename $(pwd)))</title>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="/site.css"/>
 <link rel="stylesheet" href="/index.css"/>
</head>
<body>

$(anchors $(directories))
$(anchors *.html)
$(anchors *.txt)
$(anchors *.epub)
$(anchors *.mp4)
$(anchors *.pdf)
$(anchors *.zip)

</body>
</html>
EOF

shopt -u nullglob
