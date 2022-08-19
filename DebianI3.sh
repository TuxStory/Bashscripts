##############################
# Date : 	18/08/2022   #
# Maj  :	19/08/2022   #
# Auteur:	Antoine Even #
# Version :	0.4          #
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
sudo apt install -y audacious vlc

echo ">>>> Utils :"
sudo apt install -y htop ncdu ranger neofetch dfc bleachbit inxi

echo ">>>> Admin :"
sudo apt install -y synaptic

echo "===================================================="
echo "               Installation Terminée                "
echo "===================================================="

