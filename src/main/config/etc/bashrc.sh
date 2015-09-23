#! /bin/bash -x

source() {
	if [ -r "$1" ]; then
      source "$1"
      echo "Sourced $1"
    else
      echo "Cannot read $1"
    fi
}

for script in $HOME/.etc/bashrc.d/*.sh ; do
	source "${script}"
done

source "$HOME/.bashrc.local"