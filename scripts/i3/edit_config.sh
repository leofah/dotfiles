#!/bin/sh

: ${TERMINAL="/usr/bin/alacritty"}
: ${EDITOR="/usr/bin/vim"}

DOTSLS="/usr/bin/git --git-dir=$HOME/.dots.git --work-tree=$HOME ls-files"
FILE="$HOME/$($DOTSLS | rofi -dmenu -i -p 'Edit dot-file')";
if [ $? != 0 ]
then
    exit
fi

if [ -f "$FILE" ]
then
    $TERMINAL -e $EDITOR "$FILE"
else
    rofi -e "'$FILE' is not a file"
fi

