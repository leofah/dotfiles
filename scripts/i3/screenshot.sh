#!/bin/sh

file=~/Pictures/screenshots/$(date +%F_%H-%M-%S).png

if [ "$1" =  all ]
then
    scrot $file
else
    scrot --select --freeze $file
fi

# Put the path in the clipboard so the image can be pasted immediately
xclip -selection clipboard -target image/png -i < $file
