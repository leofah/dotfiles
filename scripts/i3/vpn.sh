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
# The config path is hardcoded, as this script is run by root
config_path=/home/leo/.config/vpn
wg=wg1-ssn

case "$2" in
    $tum)
    case "$1" in
        $connect) openconnect --config $config_path/tum asa-cluster.lrz.de < $config_path/tumpwd;;
        $disconnect) kill -s INT $(cat "$config_path/tum.pid");;
        *) echo $usage
           exit 2;;
    esac ;;
    $stusta)
    case "$1" in
        $connect) wg-quick up $wg;;
        $disconnect) wg-quick down $wg;;
        *) echo $usage
           exit 2;;
    esac ;;
    *)
        echo $usage
        exit 2
esac

exit 0
