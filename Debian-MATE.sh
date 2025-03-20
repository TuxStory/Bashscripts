##############################
# Date : 	17/04/2025   #
# Maj  :	20/04/2025   #
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
echo "          Installation de MATE         "
echo "======================================="
echo
echo ">>> Mise à jour des dépots et du système :"
sudo apt update && sudo apt upgrade -y

echo ">>> XFCE"
sudo apt install -y pluma task-mate-desktop mate-desktop-environment mate-desktop-environment-extras

echo ">>> Multimedia & Internet :"
sudo apt install -y audacious cava eom filezilla gnome-games hexchat thunderbird \
		transmission-gtk remmina vlc

echo ">>>> Utils :"
sudo apt install -y bash-completion bleachbit btop curl dfc ethstatus ethtool htop ncdu ranger inxi tmux nano \
		neofetch nload nmon mediainfo vnstat screen tilix wget tty-clock

echo ">>>> Admin :"
sudo apt install -y borgbackup gnome-disk-utility gnome-firmware gparted firewall-config lm-sensors nano openssh-server  rsync synaptic smartmontools \
		timeshift

echo ">>> Nettoyage :"
sudo apt clean
sudo apt autoremove -y

echo "===================================================="
echo "               Installation Terminée                "
echo "===================================================="
