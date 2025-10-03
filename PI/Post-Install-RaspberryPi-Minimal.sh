#!/bin/bash

##########################################
# Scrpit RaspberryPi Post-Installation   #
# 01/11/2023 - ver 0.8 - 04/10/2025      #
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
sudo apt install -y  bat btop borgbackup dfc dysk duf ethstatus ethtool fastfetch fonts-powerline htop inxi irssi lnav mc nano ncdu nethogs nload \
			mmc-utils nmon oping ranger screen tmux tldr tty-clock vnstat wavemon zsh zsh-theme-powerlevel9k

################ Autoremove
echo -e "\n${GREEN}>>> ${WHITE}Nettoyage des paquets."
sudo apt autoremove -y
