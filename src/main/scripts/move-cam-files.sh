#! /bin/bash -x

storage=/opt/family
 
move() {
  exiftool -r -v -ext $2 '-directory<DateTimeOriginal' \
           -d "${storage}/$3/%Y/%m" "$1"
}
 
# directory where to read media files from is $1
# if unspecified use current directory
dir=${1:-.}
 
move $dir AVI videos
move $dir JPG photos
