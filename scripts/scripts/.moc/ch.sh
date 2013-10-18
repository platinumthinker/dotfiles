#!/bin/sh
notify-send "$1 - $4" "$2"

# by Sfate
# $1 artist
# $2 album
# $3 filename
# $4 title
# $5 track
# $6 file duration in XX:YY form
# $7 file duration, number of seconds
 
# #get album cover from last.fm
# api_key='177af4343d5ebd396a4e6a3aeacb74c7'
# artist="`echo "$1" | sed -e 's/ /+/g'`"
# album="`echo "$2" | sed -e 's/ /+/g'`"
# cover="/var/spool/lastfm/cover.gif"
# album_url="http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=$api_key&artist=$artist&album=$album"
# cover_url=`wget -qO- $album_url | cat | sed -n  -e 's/<image size=\"large\">//p' | sed -n  -e 's/<\/image>//p'`
# wget -q --output-document=$cover $cover_url
 
# #display osd-notify about track with cover ^_^
# if [ ! -f $cover ]
# then
# cover_url="http://cdn.last.fm/depth/catalogue/noimage/cover_med.gif"
# wget -q --output-document=$cover $cover_url
# fi
# /usr/bin/mate-notify-send "$1 - $4" "$2" -i $cover
 
# #submit track to last.fm
# /usr/lib/lastfmsubmitd/lastfmsubmit --artist "$1" --title "$4" --length "$6" --album "$2"
