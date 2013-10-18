#!/bin/bash

VOLUME_FILE=/home/thinker/scripts/pa_volume
MUTE_FILE=/home/thinker/scripts/pa_mute
ICON_PATH=/usr/share/icons/Faenza/status/48

function doMute() {
	NEW_VOLUME=$(amixer -D hw:1 get Master | egrep -o '[0-9]+%')
	NEW_VOLUME=${NEW_VOLUME%%%}
	MUTE_FILE=`amixer -D hw:1 get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]'`
    if [[ $MUTE_FILE == '[on]' ]];
    then
        amixer -D hw:1 set Master mute
    else
		amixer -D hw:1 set Master unmute
    	amixer -D hw:1 set Speaker unmute
    	amixer -D hw:1 set Headphone unmute
    fi 
}

function doChangeVolume() {
	amixer -q sset Master $1	
	NEW_VOLUME=$(amixer get Master | egrep -o '[0-9]+%')
	NEW_VOLUME=${NEW_VOLUME%%%}
	if [ $NEW_VOLUME -lt 0 ];
    then
        exit 0
    fi
	if [ $NEW_VOLUME -eq 0 ];
	then
		ICON=$ICON_PATH/audio-volume-muted.png
	elif [ $NEW_VOLUME -lt 25 ];
	then
		ICON=$ICON_PATH/audio-volume-off.png
	elif [ $NEW_VOLUME -lt 50 ];
	then
		ICON=$ICON_PATH/audio-volume-low.png
	elif [$NEW_VOLUME < 75]
	then
		ICON=$ICON_PATH/audio-volume-medium.png
	else
		ICON=$ICON_PATH/audio-volume-high.png
	fi
	killall xfce4-notifyd
	notify-send "M" -h int:value:$NEW_VOLUME -i $ICON&
}

case $1 in
inc)
    doChangeVolume 2+
    ;;
dec)
    doChangeVolume 2-
    ;;
mute)
    doMute
    ;;
esac
exit 0
