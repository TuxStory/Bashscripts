#!/bin/bash

##########################################
# Scrpit RaspberryPi Post-Installation   #
# 16/02/2023 - ver 1.0 - 05/11/2024      #
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
sudo apt install -y  dfc ethstatus fonts-powerline htop inxi lnav mc nano ncdu neofetch nethogs nload \
                     nmon ranger screen tmux vnstat wavemon zsh zsh-theme-powerlevel9k


############### Install Internet
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares Internet."
sudo apt install -y hexchat filezilla transmission-gtk

############### Install Multimédia
echo -e "\n${GREEN}>>> ${WHITE}Installation Multimédia."
sudo apt install -y audacious cmus eom vlc

############### Install Code
echo -e "\n${GREEN}>>> ${WHITE}Installation Programmation."
sudo apt install -y geany pluma

############### PenTesting
echo -e "\n${GREEN}>>> ${WHITE}Installation Sécurité Informatique."
sudo apt install -y nmap binwalk binutils gobuster hydra traceroute

################ Autoremove
echo -e "\n${GREEN}>>> ${WHITE}Nettoyage des paquets."
sudo apt autoremove -y
