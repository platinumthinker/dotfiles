#!/bin/bash
SOURCE=".fonts 
        .git
        .moc
        .pentadactyl
        scripts
        .bash_aliases
        .bashrc
        .gitconfig
        .gtkrc
        .gtkrc-2.0
        .selected_editor
        .Xdefaults
        .xinitrc
        .xmobarrc
        .xscreensaver
        .xxkbrc
        .zshrc"

for file in $SOURCE
do
    ln -s ~/.dotfiles/$file ~/$file
done
