#!/bin/bash

folder='/home/thinker/Pictures/Wallpapers/'
files=( $(find $folder -type f \( -iname '*.jpeg' -o -iname '*.jpg' -o -iname '*.png' \) | /bin/sed s/' '/':'/g) )
N=${#files[@]}
((N=RANDOM%N))
file=${files[$N]//:/ }
filename=$(basename $file)

if [ $"$filename" == "1.jpg" ]
then
{
	DISPLAY=:0.0 xsetroot -solid black
	DISPLAY=:0.0 feh --bg-max "$file"
}
elif [ $"$filename" == "2.jpg" ] 
then
{
	DISPLAY=:0.0 xsetroot -solid white
	DISPLAY=:0.0 feh --bg-center "$file"
}
else
	DISPLAY=:0.0 feh --bg-scale "$file"
fi


