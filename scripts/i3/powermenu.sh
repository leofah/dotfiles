#!/bin/sh

MENU="$(rofi -sep "|" -dmenu -i -p 'System' <<< " Lock| Logout|鈴 Suspend|菱 Reboot| Shutdown")"

case "$MENU" in
    *Lock) ~/scripts/i3/lock_mons.sh;;
    *Logout) i3-msg exit;;
    *Suspend) systemctl suspend;;
    *Reboot) systemctl reboot;;
    *Shutdown) systemctl -i poweroff
esac
