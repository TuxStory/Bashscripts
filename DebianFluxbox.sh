##############################
# Date : 	21/03/2023   #
# Maj  :	21/03/2023   #
# Auteur:	Antoine Even #
# Version :	0.1          #
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
echo "==================================================="
echo "          Installation de Fluxbox                  "
echo "==================================================="
echo
echo ">>> Mise à jour des dépots et du système :"
sudo apt update && sudo apt upgrade -y

echo ">>> FluxBox"
sudo apt install -y lightdm lightdm-gtk-greeter x-window-system-core fluxbox

echo ">>> Multimedia :"
sudo apt install -y audacious vlc

echo ">>>> Utils :"
sudo apt install -y htop ncdu ranger neofetch dfc bleachbit inxi xfce4-terminal arand xcompmgr nitrogen

#Wallpaper
echo ">>>> Wallpaper :"
fbsetbg -f Wallpaper/debian1.png
echo "session.screen0.rootCommand: fbsetbg -l" >> /home/$username/.fluxbox/init
#resolution
echo "xrand -s 1360x768" >>>  /home/$username/.fluxbox/startup


#menu
#echo ">>>> Menu/"
#./fluxbox-generate_menu

echo "===================================================="
echo "               Installation Terminée                "
echo "===================================================="
