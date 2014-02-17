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

link_files() 
{
    ln -f -s $1 $2
    success "linked $1 to $2"
}

sudo_link_files() 
{
    sudo ln -f -s $1 $2
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
    rm -rf $HOME/.local/share/clipit/
    rm -rf $HOME/.config/clipit/
    mkdir -p $HOME/.local/share/clipit/
    mkdir -p $HOME/.config/clipit/
    link_files $DOTFILES_ROOT/clipit/actions $HOME/.local/share/clipit/actions
    link_files $DOTFILES_ROOT/clipit/clipitrc $HOME/.config/clipit/clipitrc
}

install_dotfiles_root()
{
    sudo_link_files $DOTFILES_ROOT/fonts.symlink /root/.fonts
    sudo_link_files $DOTFILES_ROOT/themes.symlink /root/.themes
    sudo_link_files $DOTFILES_ROOT/zshrc.symlink /root/.zshrc
    sudo_link_files $DOTFILES_ROOT/bashrc.symlink /root/.bashrc
    sudo_link_files $DOTFILES_ROOT/aliases.symlink /root/.aliases
    sudo_link_files $HOME/.oh-my-zsh /root/.oh-my-zsh
    sudo_link_files $DOTFILES_ROOT/gtkrc-2.0.symlink /root/.gtkrc-2.0
}

install_dotfiles
install_dotfiles_root
success "All installed!"
