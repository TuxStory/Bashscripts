#!/bin/bash

IP="192.168.1.1"
TIME="25"

while :; do
	result=$(ping -c1 $IP | grep -oP ".*temps=\K\d+")
	#echo $result
	if [ $result -gt $TIME ]; then
        	echo -e "\033[0;31m>>> Attention ! Ping trop haut <<< $result ms\033[0m"
	fi
done

################################################################################
