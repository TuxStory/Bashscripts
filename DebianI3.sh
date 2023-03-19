##############################
# Date : 	18/08/2022   #
# Maj  :	19/03/2023   #
# Auteur:	Antoine Even #
# Version :	0.8          #
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
echo "====================================="
echo "          Installation de I3         "
echo "====================================="
echo
echo ">>> Mise à jour des dépots et du système :"
sudo apt update && sudo apt upgrade -y

echo ">>> I3"
sudo apt install -y lightdm i3 i3-wm kitty thunar nitrogen

echo ">>> Multimedia :"
sudo apt install -y audacious vlc eom hexchat transmission-gtk

echo ">>>> Utils :"
sudo apt install -y htop ncdu ranger neofetch dfc bleachbit inxi tmux nano nload nmon

echo ">>>> Admin :"
sudo apt install -y synaptic borgbackup openssh-server

echo ">>> Nettoyage :"
sudo apt clean
sudo apt autoremove -y

#screen resolution for VirtualBox
#echo "exec --no-startup-id xrandr --output Virtual1 --mode 1360x768" >> $HOME/.config/i3/config

#Wallpaper
nitrogen --set-scaled Wallpaper/debian2.png

echo "exec --no-startup-id nitrogen --restore" >> /home/$username/.config/i3/config

echo "===================================================="
echo "               Installation Terminée                "
echo "===================================================="

