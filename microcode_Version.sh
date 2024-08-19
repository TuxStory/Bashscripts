#!/bin/bash

############################
# Date 		: 19/08/24 #
# Version 	: 0.0.1    #
############################

EACCES=13 # Permission denied

############### Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m

################ Root
if [ "$UID" -ne 0 ]; then # Vous êtes ROOT
  echo "Permission denied : you must be root."
exit $EACCES
fi

############### Microcode
echo -e "${GREEN}>>>${WHITE} Version du microcode :"
sudo dmesg | grep "microcode:"
