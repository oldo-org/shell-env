#! /bin/bash

# ensure sane PATH
export PATH=/bin:${PATH}

# adjust these variables for your scenario
dat="/opt/data"
bak="/mnt/backup"
dir="family"

sudo umount $bak
sudo mount $bak
 
if [ $? -eq 0 ]; then
  # we use --size-only because backup disk might have buggy timestamps
  rsync -au --progress --size-only "${dat}/${dir}/" "${bak}/${dir}/"
  rsync -au --progress --size-only --chmod=o-w "${bak}/${dir}/" "${dat}/${dir}/"
fi
 
sudo umount $bak
