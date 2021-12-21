#! /bin/sh
 
OLDIFS=$IFS
IFS='
'
 
for mount in $(mount | grep " type fuse.sshfs "); do
  dir=$(echo $mount | cut -f3 -d' ')
  userid=$(echo $mount | grep -o "user_id=[0-9]*" | cut -f2 -d'=')
  user=$(getent passwd $userid | cut -f1 -d':')
  su $user -c "fusermount -u $dir"
done
 
IFS=$OLDIFS

