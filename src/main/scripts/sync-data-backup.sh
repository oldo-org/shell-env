#! /bin/bash

dir=/opt/data/family
bak=/mnt/backup/family
 
sudo umount $bak
sudo mount $bak
 
if [ $? -eq 0 ]; then
  rsync -avvi --progress $dir $bak
  rsync -avvi --progress $bak $dir
fi
 
sudo umount $bak
