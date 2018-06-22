#! /bin/bash

set -e

if ! [[ -f /usr/share/xfce4/terminal/colorschemes/$1.theme ]]
then
    echo "No such colorscheme: $1"
    exit 1
fi

mkdir -p ~/.config/xfce4/terminal
cd ~/.config/xfce4/terminal

# {
#     echo "[Scheme]"
#     echo "Name=971 good"
#     echo "ColorForeground=#4ccd4ccd4ccd"
#     echo "ColorBackground=#f851f465ebe7"
#     echo "TabActivityColor=#d8d8a9a97f7f"
#     echo "ColorCursor=#f0f0b6b66666"
#     echo "ColorSelection=#16163b3b5959"
#     echo "ColorPalette=rgb(0,0,0);rgb(170,0,0);rgb(0,170,0);rgb(170,85,0);rgb(0,0,170);rgb(170,0,170);rgb(0,138,138);rgb(170,170,170);rgb(85,85,85);rgb(255,85,85);rgb(85,255,85);rgb(196,160,0);rgb(85,85,255);rgb(255,85,255);rgb(68,204,204);rgb(255,255,255)"
# } > terminalrc


# strip settings from any themes
grep -Fxvf <(cat /usr/share/xfce4/terminal/colorschemes/*.theme) terminalrc > .terminalrc.tmp
grep -v -e Name -e Scheme "/usr/share/xfce4/terminal/colorschemes/$1.theme" >> .terminalrc.tmp
cp terminalrc terminalrc.bak
mv .terminalrc.tmp terminalrc
