##############################
# Date : 	13/08/2022   #
# Maj  :	14/08/2022   #
# Auteur:	Antoine Even #
# Version :	0.7          #
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
sudo apt install -y htop ncdu ranger neofetch dfc bleachbit inxi

echo "===================================================="
echo "               Installation Terminée                "
echo "===================================================="
