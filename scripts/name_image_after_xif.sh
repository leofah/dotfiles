#!/bin/sh
# https://stackoverflow.com/questions/25152995/linux-shell-renaming-files-to-creation-time

shopt -s nocaseglob

cd $1
for f in *.jpeg *.jpg
do     
	mv -n "$f" "$(exiftool -d "%Y%m%d_%H%M%S" -CreateDate "$f" | awk '{print "IMG_"$4".jpg"}')"
done
