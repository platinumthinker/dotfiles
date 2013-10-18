#!/bin/sh

BG="#1c1c1c" 
FG="#dedede" 
DMENU="dmenu -nb $BG -nf $FG -sb $FG -sf $BG"

wnds=$(wmctrl -l | awk '{print substr($0, index($0,$4))}')

sel=$(echo "$wnds" | sort -u | $DMENU)
test -z "$sel" && exit 0
wrkid=`wmctrl -d | grep "${sel}" | awk '{print $1}'`
test $wrkid && wmctrl -s $wrkid || wmctrl -a "$sel" || exit 1
exit 0
