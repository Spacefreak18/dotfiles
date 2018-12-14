# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

### Paul's User .bashrc file
### /home/paul/.bashrc

export TERM=tmux-256color
set -o vi
clear
TMOUT=0


which curl > /dev/null || echo "The curl packages is not installed which is necessary for certain features. Install cli_common."

clear
tput cup 10000 0
which neofetch > /dev/null && neofetch --disable de wm resolution


# directory to store other specific bash files not for use on all setups
if [ -d ~/.bash ]; then
	for f in ~/.bash/*; do source $f; done;
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
if [ -f ~/.Xdefaults ] && [ -z "$HEADLESS" ]; then
  xrdb -load ~/.Xdefaults
fi

## Run the universal program for connecting network shares and syncing config files
if [ ! -f /tmp/BrakConnections.pid ] && [ -f ~/.local/bin/BrakConnections ]; then
  ~/.local/bin/BrakConnections && ~/.local/bin/setCoverArt $MPD_HOST
fi

### Startx on Login
### For this to work $SERVER and $HEADLESS must be set in .profile before this file is sourced
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]] && [[ $SERVER ]] && [[ ! $HEADLESS ]]; then
	startx
fi


## Configure Colors
PROMPTGREEN='\e[0;32m'
# bash colors
if [ -f ~/.bash_color ]; then
  . ~/.bash_color
  PROMPTGREEN=$IGreen
fi

###Colorizied Command Prompt
## Red Prompt, Blue Directory, Green text
PS1="\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \t \[\e[0;31m\]\$ \[\e[m\]\[$PROMPTGREEN\]"

## Custom Aliases
alias gpg='gpg2'
alias weather='curl http://wttr.in'
alias moon='curl http://wttr.in/Moon'
alias mednafen='pasuspender; mednafen -sound.device sexyal-literal-default -video.fs 1 -nes.stretch aspect -md.stretch aspect -snes.stretch aspect'
alias mc='mc -S dark'
alias ncmpc='ncmpc -c'
alias ncmpcpp='ncmpcpp -h $MPD_HOST'
alias img='fim -d /dev/fb0 -o fb --no-history-save -a'
alias fim='fim --no-history-save -a'
alias rg='snap run rg -L'

export CHEATCOLORS=true
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  export CHEATCOLORS=true
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias pacman='pacman-color'
fi

# use neovim if it is installed and spacevim
if which nvim > /dev/null; then
  #curl -sLf https://spacevim.org/install.sh | bash
  test -d ~/.SpaceVim && export SPACEVIMDIR=~/.vim
  alias vim='nvim -u ~/.vimrc'
  alias spacevim='nvim -u ~/.vimrc'
fi

#alias python='/usr/bin/python3.6'

## Music Player Daemon Controls and Set Desktop Background to current album art
if [ ! -f /tmp/BrakConnections.pid ] && [ -z "$SERVER" ] && [ -z "$HEADLESS" ] && [ -n "$MUSICDIR" ] && [ -n "$MPD_HOST" ]; then
  if [ ! -f /tmp/mpc-next ]; then
    touch /tmp/mpc-next;
    while true; do 
      kdialog --title "Now Playing" --passivepopup "$(mpc current --wait)" 10;
      ~/.local/bin/setCoverArt $MPD_HOST;
      sleep 30;
      done &
  fi
fi

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

if which fish > /dev/null; then
  rm -f ~/.config/fish/alias.fish
  echo "$(alias)" > ~/.config/fish/alias.fish
  /usr/bin/fish
fi

# append to the history file, don't overwrite it
shopt -s histappend
