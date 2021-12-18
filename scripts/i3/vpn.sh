#!/bin/sh
# handle vpn connections

# exit code:    0     all fine
#         2     wrong usage
#         -1    some error

tum=tum
stusta=stusta
connect=connect
disconnect=disconnect
usage="Usage: $0 {$connect|$disconnect} {$tum|$stusta}"
config_path=/home/leo/.config/vpn
wg=wg1-ssn

case "$2" in
    $tum)
    case "$1" in
        $connect)
        # connect to tum
        openconnect --config $config_path/tum asa-cluster.lrz.de < $config_path/tumpwd
        ;;
        $disconnect)
        # disconnect to tum
        kill -2 $(cat $config_path/tumpid)
        ;;
        *)
            echo $usage
            exit 2
        ;;
    esac
        ;;
    $stusta)
    case "$1" in
        $connect)
        wg-quick up $wg
        exit 0
        ;;
        $disconnect)
        wg-quick down $wg
        exit 0
        ;;
        *)
            echo $usage
            exit 2
        ;;
    esac
        ;;
    *)
        echo $usage
        exit 2
esac

exit 0
