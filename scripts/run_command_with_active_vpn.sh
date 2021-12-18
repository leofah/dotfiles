#!/bin/bash


# executes commands with a vpn connection established
# if the vpn connection wasn't already established the connection is closed after the command is executed

USAGE="Usage: $0 vpn_activation_command vpn_deactivation_command vpn_check_command command
$0 -h | --help: for help"
HELP="$USAGE

The exit codes should be 0 if all worked correctly.
For the check command the exit code is 0 if connected, anything else otherwise"

WHICH="/usr/bin/which"; ECHO="/bin/echo";

ERROR=0

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then 
	$ECHO "$HELP"
	exit 0
fi

VPNACT="$1"
VPNDEACT="$2"
VPNCHECK="$3"
COMMAND="$4"

# check commands
if [ -z $($WHICH $VPNACT) ]; then
	$ECHO "\"$VPNACT\" is no valid activation command"
	ERROR=1
fi
if [ -z $($WHICH $VPNDEACT) ]; then
	$ECHO "\"$VPNDEACT\" is no valid deactivation command"
	ERROR=1
fi
if [ -z $($WHICH $VPNCHECK) ]; then
	$ECHO "\"$VPNCHECK\" is no valid check command"
	ERROR=1
fi
if [ -z $($WHICH $COMMAND) ]; then
	$ECHO "\"$COMMAND\" is no valid command"
	ERROR=1
fi

if [ $ERROR -ne 0 ]; then
	$ECHO "$USAGE"
	exit $ERROR
fi

# connect vpn if not connected
$VPNCHECK
WASCONNECTED=$?
if [ $WASCONNECTED -ne 0 ]; then
	$ECHO "connecting vpn..."
	$VPNACT
	if [ $? -ne 0 ]; then
		$ECHO "Error in connecting vpn"
		ERROR=1
	fi
	# wait until it is really connected
	for i in {1..10}
	do 
		$VPNCHECK
		if [ $? -eq 0 ]
		then
			$ECHO "connection estabished"
			break
		elif [ $i -ge 10 ] 
		then
			# enough time waited, maybe the wlan or internet is down
			$ECHO "timeout while connecing"
			exit 1
		fi
		sleep 1
	done

else
	$ECHO "vpn already connected"
fi

# run the desired command
$ECHO "running the command: $COMMAND"
$COMMAND
if [ $? -ne 0 ]; then
	$ECHO "Error while executing the command"
	ERROR=1
fi


# disconnect vpn if it wasn't connected before
if [ $WASCONNECTED -ne 0 ]
then
	$ECHO "disconnecting"
	$VPNDEACT
	if [ $? -ne 0 ]; then
		$ECHO "Error in disconnecting vpn"
		ERROR=1
	fi
fi

exit $ERROR
