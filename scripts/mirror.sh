#!/bin/bash
mplayer tv:// -tv driver=v4l2:width=800:height=600:device=/dev/video0 -vf mirror,pp=tmpnoise:1:3:5 -fs
