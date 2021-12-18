#!/bin/sh

breakmin=60
setWallpaper=~/scripts/i3/setWallpaper.sh

while [ true ]
do
    $setWallpaper
    sleep "$breakmin"m
done
