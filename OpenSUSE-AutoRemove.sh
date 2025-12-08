#!/bin/bash

#################
# version : 1.2 #
#################

############### Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m

echo -e "\n${GREEN}>>> ${WHITE} Vérification des paquets obsolètes."
zypper packages --unneeded | awk -F'|' 'NR==0 || NR==1 || NR==2 || NR==3 || NR==4 {next} {print $3}' | grep -v Name | sudo xargs zypper remove --clean-deps

## A verifié ne fonctionne peut-être plus ##

