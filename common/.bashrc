# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

### Paul's User .bashrc file
### /home/paul/.bashrc

set -o vi
clear
TMOUT=0

if dpkg -l | grep --quiet curl; then
	echo ""
else
	echo "Curl is necessary for certain features"
fi
if dpkg -l | grep --quiet wmctrl; then
	echo ""
else
	echo "wmctrl is necessary for urxvt fullscreen"
fi

## Run the universal program for connecting network shares and syncing config files
if [[ ! -f /tmp/BrakConnections.pid ]]; then
	#BrakConnections Connect
  	touch /tmp/BrakConnections.pid
fi

## things I don't want public
if [[ -f ~/.bash_dark ]]; then
	. ~/.bash_dark
fi

## my file where I store server specific applications to start
if [[ -f ~/.bash_start ]] && [[ ! -f /tmp/bash_start.pid ]]; then
	. ~/.bash_start
	touch /tmp/bash_start.pid
fi

# kde overrides this
# a small script is in ~/.kde/autostart
if [[ -f ~/.Xdefaults ]]; then
	xrdb -load ~/.Xdefaults
fi

## Xdefaults is deprecated upstream
if [[ -f ~/.Xresources ]]; then
	xrdb -load ~/.Xresources
fi

### Startx on Login
### For this to work $SERVER and $HEADLESS must be set in .profile before this file is sourced
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]] && [[ $SERVER ]] && [[ ! $HEADLESS ]]; then
	startx
fi

PROMPTGREEN='\e[0;32m'
# bash colors
if [ -f ~/.bash_color ]; then
  . ~/.bash_color
  PROMPTGREEN=$IGreen
fi

# directory to store other specific bash files not for use on all setups
if [ -d ~/.bash ]; then
	for $f in ~/.bash; do source $f; done;
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias pacman='pacman-color'
fi

## Custom Aliases
if [ ! $SERVER ]; then
  alias help='cat /home/paul/Documents/Templates/ForgettableCommands.txt'
  alias gpg='gpg2'
fi

alias weather='curl http://wttr.in/${WLOCATION}'
alias moon='curl http://wttr.in/Moon'

alias mc='mc -S dark'
#alias screen='byobu-screen'
alias ed='vim'
#alias tmux='byobu-tmux'
alias mux='byobu-tmux' 
alias ncmpc='ncmpc -c'
alias img='fim -d /dev/fb0 -o fb --no-history-save -a'
alias fim='fim --no-history-save -a'
alias rg='snap run rg'

###Colorizied Command Prompt
## Red Prompt, Blue Directory, Green text
PS1="\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \t \[\e[0;31m\]\$ \[\e[m\]\[$PROMPTGREEN\]"

### Paths
export PATH=~/.local/bin:$PATH
#export PATH=/opt/android-sdk-linux/tools:$PATH
#export PATH=/opt/android-sdk-linux/platform-tools:$PATH

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
