#! /bin/bash -x

storage=/opt/data/family
 
move() {
  exiftool -r -v -ext $2 '-directory<AllDates' \
           -d "${storage}/$3/%Y/%m" "$1"
}
 
# directory where to read media files from is $1
# if unspecified use current directory
dir=${1:-.}
 
move $dir jpg photos
move $dir avi videos
move $dir mp4 videos
