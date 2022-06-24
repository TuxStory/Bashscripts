#!/bin/bash

#################################
# Nom		: SystemCleaner.sh	#
# Auteur 	: Antoine Even	    #
# Date 		: 10/06/22	        #
# Revision	: 22/06/22      	#
#################################

VERSION=0.2.3
EACCES=13 # Permission denied
ESPACE=0

############## Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m
RED='\033[0;91m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'

if [ "$UID" -ne 0 ]; then # Vous êtes ROOT
  echo -e "Permission denied : you must be ${RED}root${WHITE}."
  exit $EACCES
fi

# Intro
echo -e "\n${GREEN}===== ${WHITE}SystemCleaner Ver: ${BLUE}$VERSION ${WHITE}for${RED} Debian ${WHITE}base system${GREEN} ====="

# journalctl
JOURNAL=$(sudo journalctl --disk-usage | awk '{print $7}')
ESPACE=$JOURNAL
echo -e "\n${GREEN}>>> [Journal] ${WHITE}La taille du journal système est de : ${RED}$JOURNAL${WHITE}."
sudo journalctl --vacuum-size 50M
JOURNAL=$(sudo journalctl --disk-usage | awk '{print $7}')
echo -e "La taille du journal a été réduite à : ${GREEN}$JOURNAL${WHITE}."

# Dossier .cache
CACHE=$(du -sh /home/$SUDO_USER/.cache/ | awk '{print $1}')
echo -e "\n${GREEN}>>> [Cache] ${WHITE}La taille du dossier personnel ${BLUE}.cache${WHITE} est de : ${GREEN}$CACHE${WHITE}."
sudo rm -rf /home/$SUDO_USER/.cache/
echo "Le cache à été vidé."

# Chromium - Chromium
if [ -d /home/$SUDO_USER/.config/chromium/Default/Service\ Worker/ ]
then
  CHROME=$(du -sh /home/antoine/.config/chromium/Default/Service\ Worker/ | awk '{print $1}')
  echo -e "\n${GREEN}>>> [Chrome] ${WHITE}La taille du dossier de Chrome ${BLUE}.cache${WHITE} est de : ${GREEN}$CHROME${WHITE}."
  rm -rf /home/antoine/.config/chromium/Default/Service\ Worker/
  echo "Le cache de chrome a été vidé."
fi

# Poubelle
POUBELLE=$(du -sh /home/$SUDO_USER/.local/share/Trash/files | awk '{print $1}')
echo -e "\n${GREEN}>>> [Trash] ${WHITE}La taille de la poubelle ${BLUE}~/.local/share/Trash/files${WHITE} est de : ${GREEN}$POUBELLE${WHITE}."
sudo rm -rf /home/$SUDO_USER/.local/share/Trash/files/*
echo "La poubelle à été vidée."

# Apt
echo -e "\n${GREEN}>>> [Apt Cache] ${WHITE}Nettoyage du dossier ${BLUE}/var/cache/apt${WHITE}."
sudo du -sh /var/cache/apt
sudo apt clean --dry-run
sudo apt clean

echo -e "\n${GREEN}>>> [Apt Autoremove] ${WHITE}Nettoyage des porgrammes."
sudo apt autoremove

echo -e "\n${GREEN}>>> [Résidus] ${WHITE}Recherche de résidus ... "
[[ $(dpkg -l | grep ^rc) ]] && sudo dpkg -P $(dpkg -l | awk '/^rc/{print $2}') || echo "Aucun résidu trouvé."

echo -e "\n${BLUE}>>> ${WHITE}Nettoyage Effectué."
#echo "$ESPACE - $CACHE - $POUBELLE ont été nettoyé !"

#Chromium ?
#todo Chromium /home/antoine/.config/chromium/Default/Service Worker
