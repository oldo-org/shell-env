#! /bin/bash -x

[ -z "$PS1" ] && return

do_source() {
	if [ -r "$1" ]; then
		source "$1"
		echo "Sourced $1"
	else
		echo "Cannot read $1"
	fi
}

for script in $HOME/.etc/bashrc.d/*.sh ; do
	do_source "${script}"
done

if [[ "${OSTYPE}" == 'linux-gnu' ]]; then 
	source /etc/os-release
	os="${ID}"
else
	os="${OSTYPE}"
fi

do_source "$HOME/.etc/bashrc.d/os-specific/${os}.sh"
do_source "$HOME/.bashrc.local"
