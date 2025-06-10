#!/bin/bash

#######################################
# Scrpit OpenSuse Post-Installation   #
# Date		: 10/06/2025 ver 1.9  #
# Author	: Antoine Even        #
#######################################

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
zypper install -y btop bleachbit borgbackup dfc fastfetch nano tmux inxi screen htop nload nethogs ncdu nmon ranger rsync \
	smartmontools ethtool vnstat tilix wavemon

############### Install Internet
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares Internet."
zypper install -y MozillaFirefox transmission-gtk filezilla neochat MozillaThunderbird

############### Install Multimédia
echo -e "\n${GREEN}>>> ${WHITE}Installation Multimédia."
zypper install -y cmus vlc eom audacious

################ Install Code
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares de Programmation."
zypper install -y gedit python3 git #codium

## to install Gnome or XFCE or Gnome ##
# sudo zypper install -t pattern gnome
# sudo zypper install -t pattern xfce
# sudo zypper in patterns-xfce-xfce
