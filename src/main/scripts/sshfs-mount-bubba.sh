#! /bin/sh
 
sshfs -o ro oliver@bubba:/opt/data/family ~/bubba/family
sshfs -o rw -o idmap=user oliver@bubba:/opt/data/downloads ~/bubba/downloads
sshfs -o rw -o idmap=user oliver@bubba:/home/oliver ~/bubba/oliver
