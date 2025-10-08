#!/bin/bash

# Name : Hogwarts.sh
# Date : 09/10/2025
# version : 0.7
# Delete coredump file systemd

## Couleurs ##############
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m
RED='\033[0;91m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'


echo -e "${BLUE}>>> ${WHITE} Hogwarts tmp file cleaner."

ls /var/lib/systemd/coredump/
echo -e "${GREEN}>>> ${WHITE} Deleting the file."
sudo rm /var/lib/systemd/coredump/*

if [ $? -eq 0 ]; then
    echo -e "${GREEN}>>> ${WHITE} Success ! File deleted ..."
else
    echo -e "${RED}>>> ${WHITE} An Error Occurred !"
fi

