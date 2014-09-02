# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

### Paul's User .bashrc file
### /home/paul/.bashrc

## Run the universal program for connecting network shares and syncing config files
if [[ ! -f /tmp/BrakConnections.pid ]]; then
	BrakConnections Connect
  	touch /tmp/BrakConnections.pid
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

### Startx on Login
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]] && [[ $SERVER ]] && [[ ! $HEADLESS ]]; then
	startx
fi

# bash colors
if [ -f ~/.bash_color ]; then
  . ~/.bash_color
  PROMPTGREEN=$Green
  if [ $TERM = "xterm" ]; then
	export TERM=screen-256color
	PROMPTGREEN=$IGreen
  fi
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
fi

alias mc='mc -S gotar'
alias screen='byobu-screen'
alias ed='vim'
alias tmux='byobu-tmux' 

###Colorizied Command Prompt
## Red Prompt, Blue Directory, Green text
PS1="\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[$PROMPTGREEN\]"

### Paths
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
