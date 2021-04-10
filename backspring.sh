#!/bin/bash

# Backspring - a respring command that
# supports multiple respring options 
#  will be available on github soon 
#a wanderingloner.media project

#this script is meant to be run either with sudo or with root priveleges
if [ "$EUID" -ne 0 ] ; then 
	echo "This command requires root priveleges.
	
	
	Usage: backspring <option>
	if run with no options, backspring will simply killall springboard.
	options: 
		ld - runs ldrestart.
		reboot- reboots device.
	
	a wanderingloner.media project"
else 
#This handles requests for ldrestart on supported devices
	if [ "$1" == "ld" ]; then
		#the following will check for ldrestart on device
		if [[ $(which ldrestart) ]]; then
			ldrestart
		else
			echo "ldrestart does not appear to be installed on this device."
	fi
#This command reboots the device upon user request
	elif [ "$1" == "reboot" ]; then
		reboot now
#This command displays help information
	elif [ "$1" == "help" ]; then 
		echo "Usage: backspring <option>
	if run with no options, backspring will simply killall springboard.
	options: 
		ld - runs ldrestart.
		reboot- reboots device.
	
	a wanderingloner.media project"
#if theres no arguements, standard respring
	else 
		killall SpringBoard
	fi 
fi
