#!/bin/sh

file=~/Pictures/screenshots/$(date +%F_%H-%M-%S).png

if [ "$1" =  all ]
then
	scrot $file
else
	scrot -s $file
fi
xclip -selection clipboard -target image/png -i < $file
