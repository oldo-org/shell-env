#! /bin/bash -ex

host=$1
name=shell-env
repo="https://github.com/guppy4j/${name}.git"
dir=".${name}"

ssh_run() {
  ssh "${host}" -C "$1"
}

ssh_run "rm -rf ${dir}"
ssh_run "svn co ${repo}/trunk ${dir}" || ssh_run "git clone ${repo} ${dir}"

etc="${dir}/src/main/config/etc"
scripts="${dir}/src/main/scripts"

ssh_run "ln -s --force --backup=simple ${etc} .etc"
ssh_run "ln -s --force --backup=simple ${scripts} ."
ssh_run "chmod ugo+x ${scripts}/*.sh"

ssh_run "${scripts}/setup-symlinks.sh"

