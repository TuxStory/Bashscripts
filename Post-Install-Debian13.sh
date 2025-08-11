#!/bin/bash

#####################################
# Scrpit Debian13 Post-Installation #
# 11/08/2025 ver 0.0.3              #
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
  echo -e "Permission denied : you must be ${RED}root${WHITE}."
exit $EACCES
fi

#Dépots ########################################################################
echo -e "\033[1;34mFichier des dépôts + (backports) :"
echo -e "\033[0;0m----------------------------------"
echo -e "\nVoulez-vous changer le fichier sources.list ? (Oui/Non) :"
read -r depot
if [[ $depot =~ ^([oO][uU][iI]|[oO])$ ]]
then
	mv /etc/apt/sources.list /etc/apt/sources.list.bak
	cp ./Config/sources13.list /etc/apt/sources.list
	echo "Fichier sources.list modifié."
fi
sleep 5s
clear

################ Clean apt cache
echo -e "${GREEN}>>> ${WHITE}Nettoyage du cache de APT."
sudo apt clean

############### Update
echo -e "${GREEN}>>> ${WHITE}Mise à jour du système."
sudo apt update && sudo apt upgrade -y

################ Install Administration
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares d'Administration."
sudo apt install -y ansiweather bash-completion bmon batcat btop dfc curl ethtool ethstatus fastfetch nano tmux \
			inxi iptraffic screen htop ncdu nload nethogs nmon nvtop rsync ranger fbi clamav fail2ban firewalld \
			smartmontools synaptic slurm scrot tilix tldr tty-clock gsmartcontrol duf vnstat wavemon

############### Install Internet
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares Internet."
sudo apt install -y firefox hexchat transmission-gtk filezilla

############### Install Multimédia
echo -e "\n${GREEN}>>> ${WHITE}Installation Multimédia."
sudo apt install -y adwaita-icon-theme asunder audacious cava cmus mpg123 vlc ffmpegthumbnailer gthumb

############### Install Codecs
echo -e "\n${GREEN}>>> ${WHITE}Installation des codecs."
sudo apt install -y libdvdcss

################ Install Code
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares de Programmation."
sudo apt install -y gedit python3 git #codium

############### Gnome
echo -e "\n${GREEN}>>> ${WHITE}Installation des extensions de Gnome"
sudo apt install -y gnome-extensions-app gnome-shell-extension-appindicator #gnome-shell-extension-dash-to-dock

############### Done
echo -e "\n${GREEN}>>> ${WHITE}Installation Terminée."
