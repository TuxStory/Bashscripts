##############################
# Date : 	02/04/2023   #
# Maj  :	15/09/2024   #
# Auteur:	Antoine Even #
# Version :	0.5          #
##############################

#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
clear

#installation des paquets
echo "======================================="
echo "          Installation de XFCE         "
echo "======================================="
echo
echo ">>> Mise à jour des dépots et du système :"
sudo apt update && sudo apt upgrade -y

echo ">>> XFCE"
sudo apt install -y task-xfce-desktop

echo ">>> Multimedia & Internet :"
sudo apt install -y audacious vlc eom hexchat transmission-gtk thunderbird \
		filezilla remmina

echo ">>>> Utils :"
sudo apt install -y htop ncdu ranger neofetch dfc bleachbit inxi tmux nano nload \
		nmon ethstatus vnstat btop screen

echo ">>>> Admin :"
sudo apt install -y synaptic borgbackup openssh-server

echo ">>> Nettoyage :"
sudo apt clean
sudo apt autoremove -y

echo "===================================================="
echo "               Installation Terminée                "
echo "===================================================="
