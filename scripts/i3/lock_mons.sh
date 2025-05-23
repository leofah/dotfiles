#!/bin/sh

# i3lock-color needed
# i3lock

i3lock  --force-clock --blur=5 --radius=20 --ring-width=2 \
        --ind-pos=" x + 2*r + 150 : y + h - 2*r " --time-pos=" ix - 140 : iy + 10" --date-pos=" tx : ty - 20 "  \
        --time-align=1 --date-align=1 --time-size=15 \
        --date-str="%a, %d %b %Y" \
        --time-color=ffffff66 --date-color=ffffff66 \
        --verif-text=""
