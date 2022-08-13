##############################
# Date : 	13/08/2022   #
# Auteur:	Antoine Even #
# Version :	0.4          #
##############################

#!/bin/bash

clear

#installation des paquets
echo "==================================================="
echo "          Installation d'enlightenment E17         "
echo "==================================================="
echo
sudo apt install -y lightdm enlightenment linux-headers-amd64 terminology

echo ">>> Multimedia :"
sudo apt install -y audacious vlc

echo ">>>> Utils :"
sudo apt install -y htop ncdu ranger neofetch dfc bleachbit inxi

echo "===================================================="
echo "               Installation Terminée                "
echo "===================================================="
