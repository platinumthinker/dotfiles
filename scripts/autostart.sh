#!/bin/sh
for i in "gnome-keyring-d clipit workrave";
do
	killall -9 $i;
done

wmname LG3D
gnome-keyring-daemon&
blueman-applet&
workrave&
dropbox start&
clipit&
