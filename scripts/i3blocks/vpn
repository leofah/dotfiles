#!/bin/sh

testc=$HOME/scripts/i3/vpn_info
activate=sudo\ $HOME/scripts/i3/vpn
up=
down=
case "$BLOCK_INSTANCE" in
    "tum")
	if [ $BLOCK_BUTTON = 1 ] # left mouse button
	then
		$activate connect tum > /dev/null
	elif [ $BLOCK_BUTTON = 3 ] # right mouse button
	then
		$activate disconnect tum > /dev/null
	fi

	$testc tum > /dev/null
	if [ $? -eq 0 ]
	then
		text="Tum: $up"
	else
		text="Tum: $down"
	fi
	;;

    "stusta")
	if [ $BLOCK_BUTTON = 1 ] # left mouse button
	then
		$activate connect stusta > /dev/null
	elif [ $BLOCK_BUTTON = 3 ] # right mouse button
	then
		$activate disconnect stusta > /dev/null
	fi

	$testc stusta > /dev/null
	if [ $? -eq 0 ]
	then
		text="Stusta: $up"
	else
		text="Stusta: $down"
	fi
	;;
    *)
	exit
	;;
esac

echo $text
