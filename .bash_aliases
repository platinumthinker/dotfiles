function title { echo -en "\033]2;$1\007"; }
function cd { dir=$1; if [ -z "$dir" ]; then dir=~; fi; builtin cd "$dir" && title `pwd`; }
cd `pwd`

# some more ls aliases
alias su='sudo -i'
alias py='python'
alias ll="ls -l"
alias la='ls -la'
alias l='ls -CF'
alias v='vim'
alias gv='gvim'
alias tmux='TERM=screen-256color-bce tmux'
alias cal='ncal -b'
cl() { cd "$@" && l; }
alias cdu='cd $(ls -rtd */ | tail -1)'
t() { sinan test single_app_test "$@"; }
alias h='history'
alias j="jobs -l"

