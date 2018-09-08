#! /bin/bash

bak=/mnt/backup

sudo /bin/umount $bak
sudo /bin/mount $bak
 
if [ $? -eq 0 ]; then
  rsync -au --progress --size-only /opt/data/family/ $bak/family/
  rsync -au --progress --size-only --chmod=o-w $bak/family/ /opt/data/family/
fi
 
sudo /bin/umount $bak
