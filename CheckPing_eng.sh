ls#!/bin/bash

IP="192.168.1.1"
TIME="25"

while :; do
	result=$(ping -c1 $IP | grep -oP ".*time=\K\d+")
	#echo $result
	if [ $result -gt $TIME ]; then
        	echo -e "\033[0;31m>>> Warning ! Ping too High <<< $result ms\033[0m"
	fi
done

################################################################################
