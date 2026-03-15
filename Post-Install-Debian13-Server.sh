#!/bin/bash

#####################################
# Scrpit Debian13 Post-Installation #
# 15/03/2026 ver 0.0.1              #
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

################ Clean apt cache
echo -e "${GREEN}>>> ${WHITE}Nettoyage du cache de APT."
sudo apt clean

############### Update
echo -e "${GREEN}>>> ${WHITE}Mise à jour du système."
sudo apt update && sudo apt upgrade -y

################ Install Administration
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares d'Administration."
sudo apt install -y ansiweather bash-completion bmon bat btop curl clamav cockpit ethtool ethstatus fastfetch dysk dfc duf nano tmux \
			inxi screen htop ncdu nload nethogs nmon nvtop nvidia-detect rsync ranger radeontop fbi fail2ban firewalld \
			firewall-config smartmontools slurm scrot tldr-py tty-clock vnstat wavemon

############### Done
echo -e "\n${GREEN}>>> ${WHITE}Installation Terminée."
