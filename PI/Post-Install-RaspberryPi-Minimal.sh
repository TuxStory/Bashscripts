#!/bin/bash

##########################################
# Scrpit RaspberryPi Post-Installation   #
# 01/11/2023 - ver 0.1 - 01/11/2023      #
# Antoine Even                           #
##########################################

EACCES=13 # Permission denied

############### Couleurs
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

################ Clean apt cache.
echo -e "${GREEN}>>> ${WHITE}Nettoyage du cache de APT."
sudo apt clean

############### Mise à jour du système.
echo -e "${GREEN}>>> ${WHITE}Mise à jour du système."
sudo apt update -y && sudo apt upgrade -y

################ Install Administration
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares d'Administration."
sudo apt install -y dfc nano tmux inxi screen htop nload nethogs neofetch ncdu nmon ranger vnstat \
	zsh-theme-powerlevel9k fonts-powerline zsh

################ Autoremove
echo -e "\n${GREEN}>>> ${WHITE}Nettoyage des paquets."
sudo apt autoremove -y
