#!/bin/sh

wallpapers=~/Pictures/wallpaper
fehgb=~/.fehbg

# Moves the current active shown wallpaper to $wallpapers/.deleted so they are no longer shown
# the current wallpaper stands in ~/.fehbg 
# ! There should be no spaces in the path

CURRENT_WALL=$(awk '/^feh/ {print $4}' $fehgb | sed 's/'\''//g')
mv $CURRENT_WALL $wallpapers/.deleted/

