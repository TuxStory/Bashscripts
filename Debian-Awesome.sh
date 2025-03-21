##############################
# Date : 	24/03/2023   #
# Maj  :	14/03/2025   #
# Auteur:	Antoine Even #
# Version :	0.6          #
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
echo "       Installation de Awesome       "
echo "====================================="
echo
echo ">>> Mise à jour des dépots et du système :"
sudo apt update && sudo apt upgrade -y

echo ">>> Awesome"
sudo apt install -y lightdm thunar nitrogen awesome awesome-extra lxappearance xcompmgr #compton #picom

echo ">>> Multimedia & Internet :"
sudo apt install -y audacious vlc eom hexchat irssi transmission-gtk pluma cmus firefox-esr \
		firefox-esr-l10n-fr #midori

echo ">>>> Utils :"
sudo apt install -y htop ncdu ranger neofetch dfc bleachbit inxi tmux tilix nano nload nmon

echo ">>>> Admin :"
sudo apt install -y synaptic borgbackup openssh-server psmisc vnstat xfce4-terminal openssh-server

echo ">>> Nettoyage :"
sudo apt clean
sudo apt autoremove -y

#copy Awesome config file
mkdir /home/$username/.config/awesome
cp /etc/xdg/awesome/rc.lua /home/$username/.config/awesome/rc.lua

#Wallpaper not the best method for awesome
nitrogen --set-scaled Wallpaper/debian1.png --save

#add this block in rc.lua
cat <<EOT >> /home/$username/.config/awesome/rc.lua
awful.spawn.with_shell("nitrogen --restore")

do
  local cmds =
  {
    "compton",
    "xrandr -s 1360x768",
  }

  for _,i in pairs(cmds) do
    awful.util.spawn(i)
  end
end
EOT

echo "===================================================="
echo "               Installation Terminée                "
echo "===================================================="

#Méthode pour changer de thème
#https://github.com/lcpz/awesome-copycats
