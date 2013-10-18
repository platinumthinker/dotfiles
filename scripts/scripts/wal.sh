#!/bin/bash


TMP=/home/thinker/.dbus/session-bus
#Magic command
export $(grep -h DBUS_SESSION_BUS_ADDRESS= $TMP/$(ls -1t $TMP | head -n 1))

folder='/home/thinker/Pictures/Wallpapers/'
files=( $(find $folder -type f \( -iname '*.jpeg' -o -iname '*.jpg' -o -iname '*.png' \) | /bin/sed s/' '/':'/g) )

N=${#files[@]}

((N=RANDOM%N))

file=${files[$N]//:/ }
filename=$(basename $file)

if [ $"$filename" == "1.jpg" ]
then
{
	mateconftool-2 -t str --set /desktop/mate/background/picture_options "spanned"
	mateconftool-2 -t str --set /desktop/mate/background/primary_color "#000000000000"
}
elif [ $"$filename" == "2.jpg" ] 
then
{
	mateconftool-2 -t str --set /desktop/mate/background/picture_options 'centered'
	mateconftool-2 -t str --set /desktop/mate/background/primary_color '#ffffffffffff'
}
else
	mateconftool-2 -t str --set /desktop/mate/background/picture_options 'zoom'
fi

mateconftool-2 -t str --set /desktop/mate/background/picture_filename "$file"
