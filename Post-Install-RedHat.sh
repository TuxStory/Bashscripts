#!/bin/bash

#######################################
# Scrpit RedHat Post-Installation     #
# 11/10/2024 ver 0.0.6                #
# Antoine Even                        #
#######################################

EACCES=13 # Permission denied

############### Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m
RED='\033[0;91m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'

################ Root
if [ "$UID" -ne 0 ]; then # Vous êtes ROOT
  echo "Permission denied : you must be root."
exit $EACCES
fi

################ Clean dnf cache
echo -e "${GREEN}>>> ${WHITE}Nettoyage du cache de DNF."
dnf clean packages # dnf clean all = Efface tout = brutal

############### Scrpit
echo -e "${GREEN}>>> ${WHITE}Mise à jour du système."
sudo dnf update -y

############### Install Epel
echo -e "${GREEN}>>> ${WHITE}Installation de EPEL."
sudo subscription-manager repos --enable codeready-builder-for-rhel-9-$(arch)-rpms #RedHat
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y
sudo dnf install epel-release epel-next-release -y

############### Install RPM Fusion
# From Almalinux Doc
#echo -e "\n${GREEN}>>> ${WHITE}Distribution-gpg-keys."
#sudo dnf install distribution-gpg-keys -y
#echo -e "\n${GREEN}>>> ${WHITE}GPG Keys rpmfusion."
# RPM Fusion (free packages)
#sudo rpmkeys --import /usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$(rpm -E %rhel)
# RPM Fusion (nonfree packages)
#sudo rpmkeys --import /usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-el-$(rpm -E %rhel)
# RPM Fusion (free packages)
#gpg --show-keys --with-fingerprint /usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$(rpm -E %rhel)
# RPM Fusion (nonfree packages)
#gpg --show-keys --with-fingerprint /usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-el-$(rpm -E %rhel)
#echo -e "\n${GREEN}>>> ${WHITE}Installation de RPM Fusion."
#sudo dnf --setopt=localpkg_gpgcheck=1 install  https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm -y

################ Install Administration
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares d'Administration."
sudo dnf install -y btop htop dfc fastfetch nano tmux inxi screen htop nload nethogs ncdu nmon ranger vnstat \
	smartmontools ethtool #duf

############### Install Internet
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares Internet."
sudo dnf install -y firefox hexchat transmission-gtk filezilla thunderbird evince

############### Install Multimédia
echo -e "\n${GREEN}>>> ${WHITE}Installation Multimédia."
sudo dnf install -y audacious vlc

############### Install Codecs
#echo -e "\n${GREEN}>>> ${WHITE}Installation des codecs."
#sudo dnf install -y gstreamer1-plugins-{base,good,bad-free,good-extras,bad-free-extras,ugly-free} gstreamer1-libav
#sudo dnf install -y gstreamer1-plugins-{bad-freeworld,ugly}
#sudo dnf install -y libdvdcss

################ Install Code
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares de Programmation."
sudo dnf install -y gedit python3 #codium

############### Gnome
echo -e "\n${GREEN}>>> ${WHITE}Installation des extensions de Gnome"
sudo dnf install -y gnome-extensions-app gnome-shell-extension-appindicator gnome-tweaks #gnome-shell-extension-dash-to-dock
