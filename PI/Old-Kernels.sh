#!/bin/bash

################ Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m
RED='\033[0;91m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'

################ Affichage
echo -e "\n${GREEN}>>> ${WHITE}Nettoyage des anciens noyaux!"

################ Programme
echo "\n${GREEN}>>> ${WHITE}Apt List"
apt list -i linux-image* #linux-headers*

echo "\n${GREEN}>>> ${WHITE}Dpkg"
dpkg --list | egrep -i --color 'linux-image'
#dpkg --list | egrep -i --color 'linux-image|linux-headers'
