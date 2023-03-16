##############################
# Date : 	18/08/2022   #
# Maj  :	16/03/2023   #
# Auteur:	Antoine Even #
# Version :	0.6          #
##############################

#!/bin/bash

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
sudo apt install -y synaptic borgbackup

echo ">>> Nettoyage :"
sudo apt clean
sudo apt autoremove

echo "===================================================="
echo "               Installation Terminée                "
echo "===================================================="

