#!/bin/bash

############################################
# Scrpit Fedora Server Post-Installation   #
# 03/07/2025 ver 0.0.7                     #
# Antoine Even                             #
############################################

EACCES=13 # Permission denied

############### Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m
RED='\033[0;91m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'

################ Root
if [ "$UID" -ne 0 ]; then # Vous êtes ROOT
  echo -e "Permission denied : you must be ${RED}root${WHITE}."
exit $EACCES
fi

################ Clean dnf cache
echo -e "${GREEN}>>> ${WHITE}Nettoyage du cache de DNF."
dnf clean packages # dnf clean all = Efface tout = brutal

############### Scrpit
echo -e "${GREEN}>>> ${WHITE}Mise à jour du système."
sudo dnf update -y

################ Install Administration
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares d'Administration."
sudo dnf install -y btop dfc duf ethtool fastfetch fail2ban htop inxi mediainfo mc nano ncdu nethogs nload nmon nvtop ranger screen \
	smartmontools tmux vnstat
