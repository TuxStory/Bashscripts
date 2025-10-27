#!/bin/bash

#####################################
# Scrpit Ubuntu Post-Installation   #
# 27/10/2025 ver 0.0.6             #
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
  echo -e "Accès refusé : vous devez être ${RED}root${WHITE}."
exit $EACCES
fi

#Dépots ########################################################################
echo -e "${GREEN}>>> ${WHITE}Ajout des dépots"
sudo add-apt-repository universe -y
sudo add-apt-repository multiverse -y
sudo add-apt-repository restricted -y
echo -e "Activation des dépots.   [ ${GREEN}fait${WHITE} ]"

################ Clean apt cache
echo -e "${GREEN}>>> ${WHITE}Nettoyage du cache de APT."
sudo apt clean

############### Update
echo -e "${GREEN}>>> ${WHITE}Mise à jour du système."
sudo apt update && sudo apt upgrade -y

################ Install Administration
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares d'Administration."
sudo apt install -y ansiweather bash-completion bmon bat btop curl clamav ethtool ethstatus dfc duf nano tmux \
	inxi screen htop ncdu nload nethogs nmon nvtop rsync ranger radeontop fbi fail2ban firewalld \
	firewall-config smartmontools synaptic slurm scrot timeshift tilix tldr-py tty-clock gsmartcontrol vnstat wavemon #ptyxis nvidia-detect fastfetch dysk 

############### Install Internet
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares Internet."
sudo apt install -y hexchat transmission-gtk filezilla

############### Install Multimédia
echo -e "\n${GREEN}>>> ${WHITE}Installation Multimédia."
sudo apt install -y adwaita-icon-theme asunder audacious cava cmus eog mpg123 vlc mpv ffmpegthumbnailer gthumb

############### Install DVD + Codecs
echo -e "\n${GREEN}>>> ${WHITE}Installation des codecs."
sudo apt install -y  libdvd-pkg

################ Install Code
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares de Programmation."
sudo apt install -y gedit python3 #codium

############### Gnome
#echo -e "\n${GREEN}>>> ${WHITE}Installation des extensions de Gnome"
#sudo apt install -y gnome-extensions-app gnome-shell-extension-appindicator #gnome-shell-extension-dash-to-dock

############### Snap
echo -e "\n${GREEN}>>> ${WHITE}Mise à jour des snaps"
sudo snap refresh

############### Nettoyage
echo -e "\n${GREEN}>>> ${WHITE}Nettoyage des packets."
sudo apt autoremove -y

############### Done
echo -e "\n${GREEN}>>> ${WHITE}Installation Terminée."
