##############################
# Date : 	21/03/2023   #
# Maj  :	21/03/2023   #
# Auteur:	Antoine Even #
# Version :	0.1          #
##############################

#!/bin/bash

clear

#installation des paquets
echo "==================================================="
echo "          Installation de Fluxbox                  "
echo "==================================================="
echo
echo ">>> Mise à jour des dépots et du système :"
sudo apt update && sudo apt upgrade -y

echo ">>> E17"
sudo apt install -y lightdm lightdm-gtk-greeter x-window-system-core fluxbox

echo ">>> Multimedia :"
sudo apt install -y audacious vlc

echo ">>>> Utils :"
sudo apt install -y htop ncdu ranger neofetch dfc bleachbit inxi

#Wallpaper
echo ">>>> Wallpaper :"
fbsetbg -f Wallpaper/debian1.png

#menu
echo ">>>> Menu/"
./fluxbox-generate_menu
echo "session.screen0.rootCommand: fbsetbg -l" >> ~/.fluxbox/init

echo "===================================================="
echo "               Installation Terminée                "
echo "===================================================="
