# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

case $HOSTNAME in
	"ZitZ") export ZitZ=true;;
	"Sardo") export Sardo=true;;
	"Zorak") export Zorak=true;;
	"Moltar") export Moltar=true;;
	"Boner") export Boner=true;;
	"Vink")	export Vink=true;;
	"Darkwing") export Darkwing=true;;
	"Paulson") export Paulson=true;;
esac

if [[ $Sardo ]] || [[ $Zorak ]] || [[ $Vink ]] || [[ $Darkwing ]] || [[ $Moltar ]]; then
	export SERVER=true
	PATH="/opt/bin:$PATH"
	if [[ ! $Sardo ]]; then
		export HEADLESS=true
	fi
fi

if [[ -f "$HOME/.bash_start" ]] && [[ ! -f "/tmp/bash_start.pid" ]]; then
	. "$HOME/.bash_start"
	touch "/tmp/bash_start.pid"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
