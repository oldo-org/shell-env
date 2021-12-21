#! /bin/bash
 
for user in $(who -u | cut -d' ' -f1); do
  home=$(getent passwd ${user} | cut -d':' -f6)
  script="${home}/.sshfs/mount.sh"
  if [ -x "${script}" ]; then
    su ${user} -c ${script}
  fi
done
