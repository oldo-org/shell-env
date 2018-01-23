#!/bin/bash

# Retrieves a remote database dump file and loads it into the local server
# Script should work for MySql, MariaDb and derivatives

# adjust these variable for your scenario:
remote_host="bamboo"
remote_path_prefix="/opt/backup/current/fmas_"

# Script parameters (positional, for simplicity)
# e.g. 'fmas_itests'
db=$1
# e.g. 'schema' or 'data'
dump_type=$2
 
# get the remote mysql dump file
scp ${remote_host}:${remote_path_prefix}${dump_type}.sql.gz .
 
# drop and recreate the database (i.e. the empty hull)
mysql -e "drop database ${db}"
mysql -e "create database ${db}"
 
# pipe the dump file into the local database server
pv fmas_${dump_type}.sql.gz | gunzip |  mysql -u root -p "${db}"
