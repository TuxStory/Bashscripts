##############################
# Date : 	02/04/2023   #
# Maj  :	23/08/2025   #
# Auteur:	Antoine Even #
# Version :	1.4          #
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
sudo apt install -y task-xfce-desktop xfce4 xfce4-goodies

echo ">>> Multimedia & Internet :"
sudo apt install -y audacious cava eom filezilla hexchat thunderbird \
		transmission-gtk remmina vlc mpv

echo ">>>> Utils :"
sudo apt install -y bash-completion bleachbit btop curl dfc ethstatus ethtool fastfetch htop ncdu ranger inxi tmux nano \
		 nload nmon mediainfo vnstat screen tilix wget tty-clock

echo ">>>> Admin :"
sudo apt install -y bat borgbackup lm-sensors nano openssh-server pluma rsync synaptic tldr timeshift

echo ">>> Nettoyage :"
sudo apt clean
sudo apt autoremove -y

echo "===================================================="
echo "               Installation Terminée                "
echo "===================================================="
