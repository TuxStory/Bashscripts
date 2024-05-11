#!/bin/bash

#####################################
# Scrpit Fedora Post-Installation   #
# 06/06/2023 ver 0.9.3              #
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

################ Clean dnf cache
echo -e "${GREEN}>>> ${WHITE}Nettoyage du cache de DNF."
dnf clean packages # dnf clean all = Efface tout = brutal

############### Scrpit
echo -e "${GREEN}>>> ${WHITE}Mise à jour du système."
sudo dnf update -y

################ Install RPM Fusion
echo -e "\n${GREEN}>>> ${WHITE}Installation de RPM Fusion."
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install rpmfusion-free-release-tainted -y

################ Install Administration
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares d'Administration."
sudo dnf install -y htop dfc fastfetch nano tmux inxi screen htop nload nethogs ncdu nmon ranger vnstat \
	smartmontools duf ethtool

############### Install Internet
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares Internet."
sudo dnf install -y firefox hexchat transmission-gtk filezilla

############### Install Multimédia
echo -e "\n${GREEN}>>> ${WHITE}Installation Multimédia."
sudo dnf install -y audacious cmus vlc ffmpegthumbnailer gthumb

############### Install Codecs
echo -e "\n${GREEN}>>> ${WHITE}Installation des codecs."
sudo dnf install -y gstreamer1-plugins-{base,good,bad-free,good-extras,bad-free-extras,ugly-free} gstreamer1-libav
sudo dnf install -y gstreamer1-plugins-{bad-freeworld,ugly}
sudo dnf install -y libdvdcss

################ Install Code
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares de Programmation."
sudo dnf install -y gedit python3 git #codium

############### Gnome
echo -e "\n${GREEN}>>> ${WHITE}Installation des extensions de Gnome"
sudo dnf install -y gnome-extensions-app gnome-shell-extension-appindicator #gnome-shell-extension-dash-to-dock
