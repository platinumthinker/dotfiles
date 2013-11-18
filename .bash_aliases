function title { echo -en "\033]2;$1\007"; }
function cd { dir=$1; if [ -z "$dir" ]; then dir=~; fi; builtin cd "$dir" && title `pwd`; }
cd `pwd`

# some more ls aliases
alias py='python'
alias la='ls -la'
alias l='ls -CF'
alias v='vim'
alias gv='gvim'
alias tmux='TERM=screen-256color-bce tmux'
alias cal='ncal -b'
cl() { cd "$@" && l; }
