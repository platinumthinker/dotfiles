#!/bin/bash
set -e
DOTFILES_ROOT="$(pwd)"

info()
{
    printf "  [ \033[00;34m..\033[0m ] $1\n"
}

success()
{
    printf "\r\033[2K [ \033[00;32m0K\033[0m ] $1\n"
}

link_files () 
{
    ln -s $1 $2
    success "linked $1 to $2"
}

install_dotfiles()
{
    for file in $(find $DOTFILES_ROOT -maxdepth 2 -name \*.symlink)
    do
        dest="$HOME/.$(basename ${file%.*})"
        if [ -f $dest ] || [ -d $dest ]
        then
            mkdir -p $HOME/backup

            info "Moved original $dest to $HOME/backup" 
            mv $dest $HOME/backup
        fi

        rm -rf $dest
        link_files $file $dest
    done
    link_clipit
}

link_clipit()
{
    rm $HOME/.local/share/clipit/actions
    rm $HOME/.config/clipit/clipitrc
    link_files $DOTFILES_ROOT/clipit/actions $HOME/.local/share/clipit/actions
    link_files $DOTFILES_ROOT/clipit/clipitrc $HOME/.config/clipit/clipitrc
}

install_dotfiles
success "All installed!"
