#!/usr/bin/env bash
xrdb ~/.Xdefaults
setxkbmap -layout us,ru -variant -option grp:rwin_toggle ctrl:nocaps
xmodmap ~/.xmodmaprc
kbdd &
xhost +local:&

export KDEWM=awesome
