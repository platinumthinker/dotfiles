#!/bin/bash
set -e

readonly WORKDIR=$(dirname "$(readlink -f "$0")")
readonly FILE_TRIGGER=$HOME/.color

switch_to_dark() {
    "$WORKDIR"/xfce4-color-switch.sh gruvbox-dark
    echo "dark" > "$FILE_TRIGGER"
}

switch_to_light() {
    # "$WORKDIR"/xfce4-color-switch.sh solarized-light
    "$WORKDIR"/xfce4-color-switch.sh gruvbox
    echo "light" > "$FILE_TRIGGER"
}

if [[ ! -f "$FILE_TRIGGER" ]]; then
    echo "light" > .color
fi

if [[ $(cat "$FILE_TRIGGER") == "light" ]]; then
    switch_to_dark
else
    switch_to_light
fi
