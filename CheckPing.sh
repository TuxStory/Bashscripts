#!/bin/bash

IP="192.168.1.61"
TIME="50"

while :; do
	result=$(ping -c1 $IP | grep -oP ".*temps=\K\d+")
	#echo $result
	if [ $result -gt $TIME ]; then
        	echo -e "\033[0;31m>>> Warning ! Ping too High <<< $result ms\033[0m"
	fi
done

################################################################################
