#!/bin/sh
for i in "xfsettingsd gnome-keyring-d thunar wicd-client clipit xfce4-volumed";
do
	killall -9 $i;
done

wmname LG3D&
xfsettingsd&
gnome-keyring-daemon&
thunar --daemon&
wicd-client -t -a&
blueman-applet&
workrave&
dropbox start&
clipit&
xfce4-volumed&
