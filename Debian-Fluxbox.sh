##############################
# Date : 	21/03/2023   #
# Maj  :	12/03/2025   #
# Auteur:	Antoine Even #
# Version :	0.9.1        #
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
sudo apt install -y lightdm lightdm-gtk-greeter x-window-system-core fluxbox \
	fbautostart fbpager

echo ">>> Multimedia :"
sudo apt install -y audacious vlc mediainfo

echo ">>>> Utils :"
sudo apt install -y htop btop ncdu ranger fastfetch dfc dysk bleachbit inxi xfce4-terminal arandr \
	xcompmgr nitrogen thunar tilix ptyxis pluma wbar wbar-config eom psmisc #idesk

####################################################################
# This part of the script may be run at the first start of FluxBox #
####################################################################

#Wallpaper
echo ">>>> Wallpaper :"
fbsetbg -f Wallpaper/debian1.png
echo "session.screen0.rootCommand: fbsetbg -l" >> /home/$username/.fluxbox/init
#resolution
echo "xrandr -s 1360x768 &" >> /home/$username/.fluxbox/startup
echo "exec xcompmgr &" >> /home/$username/.fluxbox/startup
echo "idesk &" >> /home/$username/.fluxbox/startup
echo "wbar &" >> /home/$username/.fluxbox/startup
#menu
#echo ">>>> Menu/"
#./fluxbox-generate_menu

echo "===================================================="
echo "               Installation Terminée                "
echo "===================================================="
