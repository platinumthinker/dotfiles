#!/bin/bash

MUTE_FILE=/home/thinker/scripts/pa_mute
ICON_PATH=/usr/share/icons/Faenza/status/48

function getVolume() {
    amixer get Master | grep -Eo '[0-9]+%' | head -1
}

function doMute() {
	NEW_VOLUME=$(getVolume)
	NEW_VOLUME=${NEW_VOLUME%%%}
    MUTE_FILE=$(amixer get Master | grep -E 'Playback.*?\[o' | grep -Eo '\[o.+\]')
    if [[ $MUTE_FILE == '[on]' ]];
    then
        amixer set Master mute
    else
		amixer set Master unmute
    	amixer set Speaker unmute
    	amixer set Headphone unmute
    fi 
}

function doChangeVolume() {
	amixer -q sset Master "$1"
	NEW_VOLUME=$(getVolume)
	NEW_VOLUME=${NEW_VOLUME%%%}
	if [ "$NEW_VOLUME" -lt 0 ];
    then
        exit 0
    fi
	if [ "$NEW_VOLUME" -eq 0 ];
	then
		ICON=$ICON_PATH/audio-volume-muted.png
	elif [ "$NEW_VOLUME" -lt 25 ];
	then
		ICON=$ICON_PATH/audio-volume-off.png
	elif [ "$NEW_VOLUME" -lt 50 ];
	then
		ICON=$ICON_PATH/audio-volume-low.png
	elif [ "$NEW_VOLUME" -lt 75 ];
	then
		ICON=$ICON_PATH/audio-volume-medium.png
	else
		ICON=$ICON_PATH/audio-volume-high.png
	fi
	# killall xfce4-notifyd
	# notify-send "M" -h int:value:"$NEW_VOLUME" -i $ICON&
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
