#!/bin/bash

#######################################
# Scrpit ArchLinux Post-Installation  #
# 15/08/2025 ver 0.0.6                #
# Antoine Even                        #
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

################ Clean cache
echo -e "${GREEN}>>> ${WHITE}Nettoyage du cache des paquets."
sudo pacman -S --noconfirm pacman-contrib
sudo paccache -r
#sudo pacman -Scc #vide le cache de pacman

############### Scrpit
echo -e "${GREEN}>>> ${WHITE}Mise à jour du système."
sudo pacman -Suy --noconfirm

################ Install Administration
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares d'Administration."
sudo pacman -S --noconfirm bat btop borgbackup dfc duf fastfetch exfat-utils fuse3 gedit nano nmap tmux timeshift inxi screen htop ncdu nload nethogs \
	nmon nvtop ranger smartmontools tldr ethtool vnstat

############### Install Internet
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares Internet."
sudo pacman -S --noconfirm firefox filezilla hexchat transmission-gtk thunderbird

############### Install Multimédia
echo -e "\n${GREEN}>>> ${WHITE}Installation Multimédia."
sudo pacman -S --noconfirm audacious cava cmus mpg123 vlc ffmpegthumbnailer gthumb gimp

################ Install jeux
echo -e "\n${GREEN}>>> ${WHITE}Installation des Jeux."
sudo pacman -S --noconfirm luanti gnome-games shattered-pixel-dungeon

################ Install Backgrounds
echo -e "\n${GREEN}>>> ${WHITE}Installation des Wallpapers."
sudo pacman -S --noconfirm archlinux-wallpapers

############### Gnome
echo -e "\n${GREEN}>>> ${WHITE}Installation des extensions de Gnome"
sudo pacman -S --noconfirm gnome-shell-extension-appindicator
