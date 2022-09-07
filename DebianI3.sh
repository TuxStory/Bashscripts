##############################
# Date : 	18/08/2022   #
# Maj  :	07/09/2022   #
# Auteur:	Antoine Even #
# Version :	0.5          #
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
sudo apt install -y audacious vlc eom

echo ">>>> Utils :"
sudo apt install -y htop ncdu ranger neofetch dfc bleachbit inxi

echo ">>>> Admin :"
sudo apt install -y synaptic

echo ">>> Nettoyage :"
sudo apt clean
sudo apt autoremove

echo "===================================================="
echo "               Installation Terminée                "
echo "===================================================="

