#!/bin/bash

#######################################
# Scrpit AlmaRocky Post-Installation  #
# 10/03/2025 ver 0.0.6                #
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
sudo dnf install epel-release -y

############### Install RPM Fusion
# From Almalinux Doc
echo -e "\n${GREEN}>>> ${WHITE}Distribution-gpg-keys."
sudo dnf install distribution-gpg-keys -y
echo -e "\n${GREEN}>>> ${WHITE}GPG Keys rpmfusion."
# RPM Fusion (free packages)
sudo rpmkeys --import /usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$(rpm -E %rhel)
# RPM Fusion (nonfree packages)
sudo rpmkeys --import /usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-el-$(rpm -E %rhel)
# RPM Fusion (free packages)
gpg --show-keys --with-fingerprint /usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-free-el-$(rpm -E %rhel)
# RPM Fusion (nonfree packages)
gpg --show-keys --with-fingerprint /usr/share/distribution-gpg-keys/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-el-$(rpm -E %rhel)
echo -e "\n${GREEN}>>> ${WHITE}Installation de RPM Fusion."
sudo dnf --setopt=localpkg_gpgcheck=1 install  https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm -y

################ Install Administration
echo -e "\n${GREEN}>>> ${WHITE}Installation des Softwares d'Administration."
sudo dnf install -y borgbackup cockpit dfc btop ethtool fastfetch htop iftop inxi iperf3 nano ncdu nethogs nload nmon \
		mediainfo mc ranger screen smartmontools timeshift tmux vnstat
