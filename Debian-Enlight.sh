##############################
# Date : 	13/08/2022   #
# Maj  :	21/11/2024   #
# Auteur:	Antoine Even #
# Version :	0.9          #
##############################

#!/bin/bash

clear

#installation des paquets
echo "==================================================="
echo "          Installation d'enlightenment E17         "
echo "==================================================="
echo
echo ">>> Mise à jour des dépots et du système :"
sudo apt update && sudo apt upgrade -y

echo ">>> E17"
sudo apt install -y lightdm enlightenment linux-headers-amd64 terminology

echo ">>> Multimedia :"
sudo apt install -y audacious vlc

echo ">>>> Utils :"
sudo apt install -y htop ncdu ranger fastfetch dfc bleachbit inxi

echo ">>>> Internet :"
sudo apt install -y firefox fillezilla hexchat transmission-gtk thunderbird

echo "===================================================="
echo "               Installation Terminée                "
echo "===================================================="
