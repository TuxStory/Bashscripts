#!/bin/bash

IP="192.168.1.61"

while :; do
	result=$(ping -c1 $IP | grep -oP ".*temps=\K\d+")
	#echo $result
	if [ $result -gt 20 ]; then
        	echo -e "\033[0;31m>>> Danger <<< $result ms\033[0m"
	fi
done

################################################################################
