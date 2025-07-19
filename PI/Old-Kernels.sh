#!/bin/bash

#########################
# Script : Old-Kernels	#
# Clean old Kernels	#
# Date	 : 18/07/25	#
# Auteur : Antoine	#
#########################

Version=0.0.2

################ Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m
RED='\033[0;91m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'

################ Root
if [ "$UID" -ne 0 ]; then # Vous êtes ROOT
  echo "Permission denied : you must be root."
exit $EACCES
fi

################ Affichage
echo -e "\n${GREEN}>>> ${WHITE}Nettoyage des anciens noyaux!"

################ Programme
echo -e "\n${GREEN}>>> ${WHITE}Apt List"
apt list -i linux-image* #linux-headers*

echo -e "\n${GREEN}>>> ${WHITE}Dpkg"
dpkg --list | egrep -i --color 'linux-image'
#dpkg --list | egrep -i --color 'linux-image|linux-headers'
