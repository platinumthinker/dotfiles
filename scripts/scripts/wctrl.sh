#!/bin/bash
if [ $1 = FULL ]
then
	wmctrl -r :ACTIVE: -b toggle,fullscreen
fi
if [ $1 = LEFT ] 
then
	wmctrl -r :ACTIVE: -b remove,fullscreen,maximized_vert,maximized_horz;
	wmctrl -r :ACTIVE: -b add,maximized_vert;
    wmctrl -r :ACTIVE: -e 0,0,0,683,-1;
fi
if [ $1 = RIGHT ] 
then
	wmctrl -r :ACTIVE: -b remove,fullscreen,maximized_vert,maximized_horz;
	wmctrl -r :ACTIVE: -b add,maximized_vert;
    wmctrl -r :ACTIVE: -e 0,683,0,683,-1;
fi
if [ $1 = UP ] 
then
	wmctrl -r :ACTIVE: -b remove,fullscreen,maximized_vert,maximized_horz;
	wmctrl -r :ACTIVE: -b add,maximized_horz;
    wmctrl -r :ACTIVE: -e 0,0,0,-1,384;
fi
if [ $1 = DOWN ] 
then
	wmctrl -r :ACTIVE: -b remove,fullscreen,maximized_vert,maximized_horz;
	wmctrl -r :ACTIVE: -b add,maximized_horz;
    wmctrl -r :ACTIVE: -e 0,0,384,-1,384;
fi