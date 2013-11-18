/home/thinker/scripts/wal.sh&
xrdb /home/thinker/.Xdefaults
pamusb-agent&
setxkbmap -layout us,ru -variant -option grp:caps_toggle,terminate:ctrl_alt_bksp &
kbdd &
(sleep 1 && trayer --edge top --align center --SetDockType true
--SetPartialStrut false  --height 16 --transparent true --alpha 0 --tint 0x221818 --margin 5 --width 5 --distancefrom center --distance -680)&
xscreensaver -no-splash &
(sleep 3 && xfsettingsd)&
xmonad
