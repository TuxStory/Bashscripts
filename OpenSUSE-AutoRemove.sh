#!/bin/bash

#################
# version : 1.1 #
#################

############### Couleurs
GREEN='\033[1;32m'

echo -e "\n${GREEN}>>> ${WHITE} Vérification des paquets obsolètes."
zypper packages --unneeded | awk -F'|' 'NR==0 || NR==1 || NR==2 || NR==3 || NR==4 {next} {print $3}' | grep -v Name | sudo xargs zypper remove --clean-deps
