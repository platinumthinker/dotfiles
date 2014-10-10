#!/bin/bash

setxkbmap -layout us,ru -variant -option grp:menu_toggle, grp:rwin_toggle, grp_led:scroll, terminate:ctrl_alt_bksp, ctrl:nocaps
xmodmap /home/thinker/.xmodmaprc
