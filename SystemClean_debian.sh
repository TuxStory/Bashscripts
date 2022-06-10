#!/bin/bash

#################################
# Nom		: SystemCleaner.sh	#
# Auteur 	: Antoine Even	    #
# Date 		: 10/06/22	        #
# Revision	: 10/06/22      	#
#################################

VERSION=0.1.1
EACCES=13 # Permission denied
ESPACE=0

############## Couleurs
GREEN='\033[0;32m'
WHITE='\033[1;0m' #real white \033[1;37m
RED='\033[0;91m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'

if [ "$UID" -ne 0 ]; then # Vous êtes ROOT
  echo -e "Permission denied : you must be ${RED}root${WHITE}."
  exit $EACCES
fi

#Intro
echo -e "SystemCleaner Ver:${BLUE}$VERSION ${WHITE}for${RED} Debian ${WHITE}base system"

# journalctl
JOURNAL=$(sudo journalctl --disk-usage | awk '{print $7}')
ESPACE=$JOURNAL
echo -e "\n${GREEN}>>> ${WHITE}La taille du journal système est de : ${RED}$JOURNAL${WHITE}."
sudo journalctl --vacuum-size 50M
JOURNAL=$(sudo journalctl --disk-usage | awk '{print $7}')
echo -e "La taille du journal a été réduite à : ${GREEN}$JOURNAL${WHITE}."

# dossier .cache
CACHE=$(du -sh /home/$SUDO_USER/.cache/ | awk '{print $1}')
echo -e "\n${GREEN}>>> ${WHITE}La taille du dossier personnel ${BLUE}.cache${WHITE} est de : ${GREEN}$CACHE${WHITE}."
sudo rm -rf /home/$SUDO_USER/.cache/
echo "Le cache à été vidé."
ESPACE=$ESPACE+$CACHE

# Poubelle
POUBELLE=$(du -sh /home/$SUDO_USER/.local/share/Trash/files | awk '{print $1}')
echo -e "\n${GREEN}>>> ${WHITE}La taille de la poubelle ${BLUE}~/.local/share/Trash/files${WHITE} est de : ${GREEN}$POUBELLE${WHITE}."
sudo rm -rf /home/$SUDO_USER/.local/share/Trash/files/*
echo "La poubelle à été vidée."

# Apt
echo -e "\n${GREEN}>>> ${WHITE}Nettoyage du dossier ${BLUE}/var/cache/apt${WHITE}."
sudo du -sh /var/cache/apt
sudo apt-get clean

echo -e "\n${GREEN}>>> ${WHITE}Nettoyage des porgrammes."
sudo apt autoremove

#echo "$ESPACE ont été nettoyé !"
