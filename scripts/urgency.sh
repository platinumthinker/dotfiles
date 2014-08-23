#!/bin/bash
## Usage: ./urgency WINDOWS_NAME NOTIFY_TITTLE NOTIFY_MESSAGE
wmctrl -r $1 -b add,demands_attention
notify-send $2 $3
