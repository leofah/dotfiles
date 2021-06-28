#!/bin/sh

# Gives information which vpn connection is currently active

# exit code: 0  connected
#            1  disconnected
#            2  wrong usage
#           -1  error

usage="Usage: $0 {tum|stusta}"

case "$1" in
    stusta)
        # A ping to daten.stusta.de gives information if the network is reachable
        if ping daten.stusta.de -4 -c1 -W3 | grep "64 bytes"
        then
            exit 0
        else
            ping daten.stusta.de -6 -c1 -W3 | grep "64 bytes"
            exit $?
        fi
        ;;
    tum)
        # check if pid file of openconnect is present
        test -e $HOME/.config/vpn/tumpid
        exit $?
        ;;
    *)
        echo $usage
        exit 2
        ;;
esac


