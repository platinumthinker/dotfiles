#!/bin/bash
## This script for install setting env on new desktop

## Change default shell to zsh
#git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
#chsh $(which zsh)

## Copy config for vim and xmonad
#git clone git@bitbucket.org:platinumthinker/xmonadconfig.git .xmonad
#git clone git@bitbucket.org:platinumthinker/vimconfig.git .vim

## Add task for cron: Change wallpaper
( crontab -l 2>/dev/null | grep -Fv ntpdate ; printf -- \
    "*/3 * * * * /home/thinker/scripts/wal.sh >/dev/null 2>&1 \n" ) | crontab

