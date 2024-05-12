#!/bin/bash

#######################################
# Scrpit OpenSuse Post-Installation   #
# 05/03/2023 ver 0.5                  #
# Antoine Even                        #
########################################

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

################ Clean zypper cache
echo -e "\n${GREEN}>>> ${WHITE}Nettoyage du cache de Zypper."
zypper clean --all

############### Updates
echo -e "\n${GREEN}>>> ${WHITE}Mise à jour du système."
zypper update -y

############### Updates
echo -e "\n${GREEN}>>> ${WHITE}Mise à jour des Patchs"
zypper patch -y

################ Install Administration
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares d'Administration."
zypper install -y htop dfc nano tmux inxi screen htop nload nethogs neofetch ncdu nmon ranger vnstat \
	smartmontools ethtool

############### Install Internet
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares Internet."
zypper install -y firefox hexchat transmission-gtk filezilla

############### Install Multimédia
echo -e "\n${GREEN}>>> ${WHITE}Installation Multimédia."
zypper install -y audacious cmus vlc eom

################ Install Code
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares de Programmation."
zypper install -y gedit python3 git #codium

