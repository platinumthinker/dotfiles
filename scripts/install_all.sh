#!/bin/bash
## This script for install setting env on new desktop
## Usage: 
## sudo install_all.sh

## For get list install package
## dpkg --get-selections >> list

## For install base work package
dpkg --set-selections < install.lst

## Change default shell to zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
chsh $(which zsh) 
chsh $(which zsh) root

## Copy config for vim and xmonad
git clone git@bitbucket.org:platinumthinker/xmonadconfig.git $HOME/.xmonad

git clone git@bitbucket.org:platinumthinker/vimconfig.git $HOME/.vim
$HOME/.vim/install.sh

## Add task for cron: Change wallpaper
( crontab -l 2>/dev/null | grep -Fv ntpdate ; printf -- \
    "*/27 * * * * $HOME/.dotfiles/scripts/wal.sh >/dev/null 2>&1 \n" ) | crontab

## Add automount polkit rule
echo "[Override udisks2 filesystem-mount-system rule]
Identity=unix-user:*
Action=org.freedesktop.udisks2.*
ResultAny=yes
ResultInactive=yes
ResultActive=yes" > /etc/polkit-1/localauthority/50-local.d/50-filesystem-mount-internal.pkla
