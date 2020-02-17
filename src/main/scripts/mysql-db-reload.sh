#!/bin/bash

# Retrieves a remote database dump file and loads it into the local server
# Script should work for MySql, MariaDb and derivatives,
# requires the "pv" command for progress bar while loading dump file.

# adjust these variables for your scenario:
remote_host="bamboo"
remote_path_prefix="/opt/backup/current/fmas_"

test -z "${2}" && echo "Usage: $(basename $0) db dump_type" && exit 1

# Script parameters (positional, for simplicity)
# e.g. 'fmas_itests'
db=$1
# e.g. 'schema' or 'data'
dump_type=$2

# set shell option for exit on error behavior
set -e
 
# get the remote mysql dump file
scp ${remote_host}:${remote_path_prefix}${dump_type}.sql.gz .
 
# drop and recreate the database (i.e. the empty hull)
mysql -e "drop database if exists ${db}"
mysql -e "create database ${db}"
 
# pipe the dump file into the local database server
pv fmas_${dump_type}.sql.gz | gunzip |  mysql -u root -p "${db}"
