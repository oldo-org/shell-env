#!/bin/bash
echo "<!DOCTYPE html>"
echo "<html>"
echo "<head>"
echo "<meta name="robots" content="noindex,nofollow" />"
echo "<style>img { float:left;padding:1em;height:15em; }</style>"
echo "</head>"
echo "<body>"
shopt -s nocaseglob nullglob
for img in *.jpg *.png *.gif; do
echo "<img src='$img' />"
done
echo "</body>"
echo "</html>"
