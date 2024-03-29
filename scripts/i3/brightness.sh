#!/bin/sh

# adds relative $percent to the brightness

percent=20

cur=$(light)
inc=$(bc <<< $cur*$percent/100)
if [ ${inc%.*} -le 1 ]
then
    inc=1
fi

case "$1" in
    inc)
        light -A $inc
        ;;
    dec)
    if [[ ${cur%.*} -gt 1 ]]
    then
        light -U $inc
    fi
    ;;
    *)
        echo "Usage: $0 {inc|dec}"
        exit 2
esac
