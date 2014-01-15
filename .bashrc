## Command at terminal startup (Random cowsay and fortune)
fortune | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1)

## Path declarations
export PATH=/home/thinker/erlware/bin:$PATH
export CDPATH=$CDPATH:.:/home/thinker/:/home/thinker/work/:/home/thinker/work/biser/projects/

## Russian man priority
export MANOPT="-L ru"

## 256 color support in terminal
export TERM=xterm-256color

## Set unlimit size for core dump
ulimit -c unlimited

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#Return value visualisation
PS1="\$(if [[ \$? == 0 ]]; then
    echo \"\";
else
    echo \"\[\033[03;37m\]\$?\[\033[03;31m\]\342\234\227\";
fi)"

# Turn the prompt symbol red if the user is root
if [ $(id -u) -eq 0 ]; then 
    # You are root, make the prompt red
    PS1=$PS1"\e[03;31m#\e[00m "
else        
    PS1=$PS1"\e[03;32m>\e[00m "
fi


## Color aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

## Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## Autocompletion for commands
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
