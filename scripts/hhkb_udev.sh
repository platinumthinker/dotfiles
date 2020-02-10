#!/bin/bash

sleep 1

DISPLAY=":0.0"
HOME=/home/thinker
XAUTHORITY=$HOME/.Xauthority

export DISPLAY XAUTHORITY HOME
hhkb_id=$(xinput -list | grep -i 't\.m\.k\. HHKB' | grep -o 'id=[0-9].' | grep -o '[0-9].' | tail -1)

xset r rate 200 30
if [ "${hhkb_id}" ]; then
    setxkbmap -device "${hhkb_id}" -option altwin:swap_lalt_lwin -layout us,ru -variant -option grp:toggle terminate:ctrl_alt_bksp,ctrl:nocaps
fi

echo something > /tmp/aa
