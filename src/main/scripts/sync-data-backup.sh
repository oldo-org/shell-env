#! /bin/bash

bak=/mnt/backup
 
sudo umount $bak
sudo mount $bak
 
if [ $? -eq 0 ]; then
  rsync -avvi --progress /opt/data/family/ $bak/family/
  rsync -avvi --progress $bak/family/ /opt/data/family/
fi
 
sudo umount $bak
