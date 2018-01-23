#! /bin/bash

# adjust these variables for your scenario:
dat="/opt/data"
bak="/mnt/backup"
dir="family"
 
sudo umount ${bak}
sudo mount ${bak}
 
if [ $? -eq 0 ]; then
  rsync -avvi --progress "${dat}/${dir}/" "${bak}/${dir}/"
  rsync -avvi --progress "${bak}/${dir}/" "${dat}/${dir}/"
fi
 
sudo umount ${bak}
