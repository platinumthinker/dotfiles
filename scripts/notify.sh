#!/bin/bash

notify-send "$(mocp -Q "%artist\n%album")" "$(mocp -Q "%song")"
