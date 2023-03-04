#!/bin/bash

####################################
# Nom		: SystemCleaner.sh #
# Auteur 	: Antoine Even	   #
# Date 		: 26/08/22	   #
# Revision	: 11/09/22         #
####################################

VERSION=0.0.9
EACCES=13 # Permission denied
ESPACE=0

############### Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' # Real white \033[1;37m
RED='\033[0;91m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'

if [ "$UID" -ne 0 ]; then # Vous êtes ROOT
  echo -e "Permission denied : you must be ${RED}root${WHITE}."
  exit $EACCES
fi

# Intro
echo -e "\n${GREEN}===== System${WHITE}Cleaner Ver: ${BLUE}$VERSION ${WHITE}for${BLUE} Fedora ${WHITE}base system${GREEN} ====="

############## journalctl
JOURNAL=$(sudo journalctl --disk-usage | awk '{print $7}')
ESPACE=$JOURNAL
echo -e "\n${GREEN}>>> [ Journal ] ${WHITE}La taille du journal système est de : ${RED}$JOURNAL${WHITE}."
sudo journalctl --rotate #Recent entries are moved to inactive files.
sudo journalctl --vacuum-size 50M
JOURNAL=$(sudo journalctl --disk-usage | awk '{print $7}')
echo -e "La taille du journal a été réduite à : ${GREEN}$JOURNAL${WHITE}."

############### Dossier .cache
CACHE=$(du -sh /home/"$SUDO_USER"/.cache/ | awk '{print $1}')
echo -e "\n${GREEN}>>> [ Cache ] ${WHITE}La taille du dossier personnel ${BLUE}.cache${WHITE} est de : ${GREEN}$CACHE${WHITE}."
sudo rm -rf /home/"$SUDO_USER"/.cache/
echo "Le cache à été vidé."

############### Chromium - Chrome
if [ -d /home/"$SUDO_USER"/.config/chromium/Default/Service\ Worker/ ]
then
  CHROME=$(du -sh /home/antoine/.config/chromium/Default/Service\ Worker/ | awk '{print $1}')
  echo -e "\n${GREEN}>>> [ Chrome ] ${WHITE}La taille du dossier de Chrome ${BLUE}.cache${WHITE} est de : ${GREEN}$CHROME${WHITE}."
  rm -rf /home/antoine/.config/chromium/Default/Service\ Worker/
  echo "Le cache de Google Chrome/Chromium a été vidé."
fi

################ Poubelle
POUBELLE=$(du -sh /home/"$SUDO_USER"/.local/share/Trash/files | awk '{print $1}')
echo -e "\n${GREEN}>>> [ Trash ] ${WHITE}La taille de la poubelle ${BLUE}~/.local/share/Trash/files${WHITE} est de : ${GREEN}$POUBELLE${WHITE}."
sudo rm -rf /home/"$SUDO_USER"/.local/share/Trash/files/*
echo "La poubelle à été vidée."

################ DNF
echo -e "\n${GREEN}>>> [ DNF Cache ] ${WHITE}Nettoyage du dossier ${BLUE}/var/cache/dnf${WHITE}."
sudo du -sh /var/cache/dnf
sudo dnf clean packages
#sudo  dnf clean all #Efface tout ! (Brutal)

echo -e "\n${GREEN}>>> [ DNF Autoremove ] ${WHITE}Nettoyage des porgrammes."
sudo dnf autoremove -y

echo -e "\n${GREEN}>>> [ Résidus ] ${WHITE}Recherche de résidus ... "
if [ ! -x /usr/bin/package-cleanup ] ; then
  echo -e "\n${BLUE}>>> ${WHITE}Installation de dnf-utils."
  dnf install dnf-utils -y
fi
#[[ $(dpkg -l | grep ^rc) ]] && sudo dpkg -P $(dpkg -l | awk '/^rc/{print $2}') || echo "Aucun résidu trouvé."
dnf remove `package-cleanup --leaves` -y

################ TMP
TEMPORY=$(du -sh /tmp/ | awk '{print $1}')
echo -e "\n${GREEN}>>> [ TMP ] ${WHITE}La taille du dossier ${BLUE}/tmp/${WHITE} est de : ${GREEN}$TEMPORY${WHITE}."
sudo find /tmp -type f -atime +10 -delete
echo "Les fichiers temporaires de plus de 10 jours ont été éffacés."

################ The end
echo -e "\n${BLUE}>>> ${WHITE}Nettoyage Effectué."
