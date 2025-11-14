# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

### Paul's User .bashrc file
### /home/paul/.bashrc

#export TERM=xterm-256color
setterm --foreground green --store
setfont IBM3161
set -o vi
clear
TMOUT=0
unset WAYLAND_DISPLAY

which curl > /dev/null || echo "The curl packages is not installed which is necessary for certain features. Install cli_common."

clear
tput cup 10000 0
which neofetch > /dev/null && neofetch --disable de wm resolution && df -h

## Custom Environmental Variable Defaults
export DB=
export DBHOST=
export DBPASS=
export DBUSER=
export MPD_HOST=
export MUSICDIR=
export HEADLESS=
export SERVER=
export FBFONT=ter-118b


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
if [ -f ~/.local/bin/BrakConnections ]; then
  source ~/.local/bin/BrakConnections
fi

### Startx on Login
if [[ -n "$DISPLAY" ]] && [[ $TTY = /dev/tty1 ]] && [[ ! $SERVER ]] && [[ ! $HEADLESS ]]; then
	startx --:7
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
env | grep BASH && PS1="\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \t \[\e[0;31m\]\$ \[\e[m\]\[$PROMPTGREEN\]"


## Custom Aliases
alias weather='curl http://wttr.in'
alias moon='curl http://wttr.in/Moon'
alias mednafen='pasuspender; mednafen -sound.device sexyal-literal-default -video.fs 1'
alias mc='mc -S gotar'
alias ncmpc='ncmpc -c'
alias ncmpcpp='ncmpcpp -h $MPDHOST'
alias img='fim -d /dev/fb0 -o fb --no-history-save -a'
alias fim='fim --no-history-save -a'
alias rg='snap run rg -L'
alias f='fish'
alias g='git'
alias gs='git status'
alias gc='git commit'
alias gd='git diff'
alias t='tmux'
alias setcvrbg='feh --bg-fill "$(ls $MUSICDIR/"$(mpc -h $MPDHOST --format=%artist%/%album% | head -n 1)"/*.(jpeg|jpg|png) | sort -R | head -n 1)"'
alias showcvrbg='img "$(ls $MUSICDIR/"$(mpc --format=%artist%/%album% | head -n 1)"/*.(jpeg|jpg|png) | sort -R | head -n 1)"'
#alias setcvrbg2='clear; img2sixel -h 255 -w 195 /home/paul/girl2.jpg; img2sixel -h 235 -w 275 "$(ls $MUSICDIR/"$(mpc --format=%artist%/%album% > /dev/null | head -n 1)"/*.(jpeg|jpg|png) | sort -R | head -n 1)"'
#alias setcvrbg2='clear; img2sixel -h 360 /home/paul/girl2.jpg; img2sixel -h 200 "$(ls $MUSICDIR/"$(mpc --format=%artist%/%album% > /dev/null | head -n 1)"/*.(jpeg|jpg|png) | sort -R | head -n 1)"'
alias setcvrbg2='clear; img2sixel -h 200 "$(ls $MUSICDIR/"$(mpc --format=%artist%/%album% > /dev/null | head -n 1)"/*.(jpeg|jpg|png) | sort -R | head -n 1)"'
alias setcvrbg3='clear; img2sixel -h 200 -w 200 "$(ls $MUSICDIR/"$(mpc --format=%artist%/%album% > /dev/null | head -n 1)"/*.(jpeg|jpg|png) | sort -R | head -n 1)"'
alias cvr='cp "$(ls $MUSICDIR/"$(mpc --format=%artist%/%album% | head -n 1)"/*.(jpeg|jpg|png) | sort -R | head -n 1)" /home/paul/cover.jpg'
alias cvrs='touch file.jpg; rm --force /home/paul/covers/images/covid-19/*(jpeg|jpg|png|bmp) && cp $MUSICDIR/"$(mpc --format=%artist%/%album% | head -n 1)"/*.(jpeg|jpg|png|bmp) /home/paul/covers/images/covid-19/'
alias yplay='mpv --ytdl-format="bestvideo[height<=?720][fps<=?30][vcodec!=?vp9]+bestaudio/best" --cache=yes --cache-secs=8 --cache-pause-initial=yes --cache-pause-wait=5'
alias tabView="pspg --tsv -s7"
alias csvView='pspg --csv -s7'
alias cstyler='astyle -z2 --style=break --indent=spaces --convert-tabs --indent-switches -k1 -e -xb -j -c'
alias lxc-start='lxc-unpriv-start'
alias lxc-attach='lxc-unpriv-attach'
alias bandwidth="query Query \"SELECT SUM(uploaded), sum(downloaded) FROM entries JOIN servers ON servers.id=entries.server WHERE time>='$(date +"%Y-%m")-01'\""
alias treasuries30yr='squote -m 30yr treasuries; csvView ~/.cache/squote_data.csv'
alias treasuries10yr='squote -m 10yr treasuries; csvView ~/.cache/squote_data.csv'
alias graph='gnuplot ~/.local/lib/squote.gp'
alias graphui='gnuplot -p ~/.local/lib/squoteui.gp'
alias clipsync='xclip -o | xclip'
alias nmysql='ncmysql -u $DBUSER -p $DBPASS -h $DBHOST $DBDB'

export PASSWORD_STORE_GPG_OPTS='--pinentry-mode loopback'
export CHEATCOLORS=true
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  export CHEATCOLORS=true
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  which exa &> /dev/null && alias ls='exa'
  alias grep='grep --color=auto'
  alias pacman='pacman-color'
fi
export CHEAT_PATH="$HOME/.cheat:$HOME/git/cheatsheets"

## make folders for vim backups
mkdir -p  ~/.cache/vtemp/backup
mkdir -p ~/.cache/vtemp/swap
mkdir -p ~/.cache/vtemp/undo/


alias vim='vim -u ~/.config/nvim/global.vim'
EDITOR=vim
export MANPAGER="env MAN_PN=1 vim -M +MANPAGER -"
# use neovim if it is installed and spacevim
if which nvim &> /dev/null; then
  alias vim=/usr/bin/nvim
  export EDITOR=/usr/bin/nvim
fi


#alias python='/usr/bin/python3.6'

## Music Player Daemon Controls and Set Desktop Background to current album art

if [[ ! $SERVER ]] && [[ ! $HEADLESS ]]; then
    alias coverarttrack='while true; do mpc -h $MPDHOST current --wait && setcvrbg; done;'
    alias coverarttrack2='setcvrbg2; while true; do mpc current --wait && setcvrbg2; done;'
    alias coverarttrack3='setcvrbg3; while true; do mpc current --wait && setcvrbg3; done;'
fi

### Paths
test -d ~/.local/bin && export PATH=$PATH:~/.local/bin
test -d ~/.cargo && export PATH=$PATH:~/.cargo/bin
test -d ~/.sdkman/candidates/java/current && export PATH=$PATH~/.sdkman/candidates/java/current/bin
#export PATH=/opt/android-sdk-linux/tools:$PATH
#export PATH=/opt/android-sdk-linux/platform-tools:$PATH

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
env | grep BASH && test -f /etc/bash_completion && . /etc/bash_completion

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

## Disable Caps Lock Key
#if which xmodmap &> /dev/null && which setxkbmap &> /dev/null; then
  #setxkbmap -layout us -option ctrl:nocaps
  #xmodmap -e 'clear Lock'
  #xmodmap -e 'keycode 0x7e = Control_R'
  #xmodmap -e 'add Control = Control_R'
#fi


function file_replace() {
  for file in $(find . -type f -name "$1*"); do
    mv $file $(echo "$file" | sed "s/$1/$2/");
  done
}


function dir_replace() {
  for file in $(find . -type d -name "$1*"); do
    mv $file $(echo "$file" | sed "s/$1/$2/");
  done
}

export NNN_TMPFILE="$HOME/.config/nnn/.lastd"
n()
{
  nnn "$@"
  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
  fi
}

tldr()
{
    test -f ~/.cache/tldr/$1.md && /usr/bin/tldr -r ~/.cache/tldr/$1.md || /usr/bin/tldr $1;
}

stock()
{
    squote overview $1; <~/.cache/squote_data.csv;
}
quote()
{
    squote quote $1; <~/.cache/squote_data.csv;
}
chart()
{
    squote chart $1; gnuplot -p ~/.local/lib/squotedatefmt2mscol5.gp;
}
chartui()
{
    squote chart $1; gnuplot -p ~/.local/lib/squotedatefmt2mscol5ui.gp;
}

# append to the history file, don't overwrite it
env | grep BASH && shopt -s histappend

# directory to store other specific bash files not for use on all setups
if [ -d ~/.bash ]; then
	for f in ~/.bash/*; do test -f $f && source $f; done;
fi

## things I don't want public
if [[ -f ~/.bash_dark ]]; then
	. ~/.bash_dark
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
