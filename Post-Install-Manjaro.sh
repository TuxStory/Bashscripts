#!/bin/bash

#####################################
# Scrpit Manjaro Post-Installation  #
# 25/06/2025 ver 0.0.5              #
# Antoine Even                      #
#####################################

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

################ Clean cache
echo -e "${GREEN}>>> ${WHITE}Nettoyage du cache des paquets."
sudo pamac clean

############### Scrpit
echo -e "${GREEN}>>> ${WHITE}Mise à jour du système."
sudo pamac update --no-confirm

################ Install Administration
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares d'Administration."
sudo pamac install --no-confirm btop borgbackup dfc fastfetch nano tmux timeshift inxi screen htop ncdu nload nethogs nmon nvtop ranger \
	smartmontools duf ethtool vnstat

############### Install Internet
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares Internet."
sudo pamac install --no-confirm firefox filezilla hexchat transmission-gtk thunderbird

############### Install Multimédia
echo -e "\n${GREEN}>>> ${WHITE}Installation Multimédia."
sudo pamac install --no-confirm audacious cava cmus mpg123 vlc ffmpegthumbnailer gthumb gimp

################ Install jeux
echo -e "\n${GREEN}>>> ${WHITE}Installation des Jeux."
sudo pamac install --no-confirm luanti gnome-games shattered-pixel-dungeon

################ Install Backgrounds
echo -e "\n${GREEN}>>> ${WHITE}Installation des Wallpapers."
sudo pamac install --no-confirm manjaro-backgrounds mate-backgrounds gnome-backgrounds

############### Gnome
echo -e "\n${GREEN}>>> ${WHITE}Installation des extensions de Gnome"
sudo pamac install --no-confirm gnome-shell-extension-appindicator
