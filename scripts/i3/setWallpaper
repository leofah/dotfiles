#!/bin/sh

wallpapers=~/Pictures/wallpaper

# finds alle files in wallpaper directory and subdirectories, but ignores hidden direcories to easily select which pictures want to be seen.
# One random of the found files is set as wallpaper
feh --bg-scale $(find $wallpapers -type f ! -path "*/.*" | shuf -n 1)
