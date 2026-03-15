#!/bin/bash

####################################
# Nom		: SystemCleaner.sh #
# Auteur 	: Antoine Even	   #
# Date 		: 15/03/26	   #
# Revision	: 15/03/26         #
####################################

VERSION=0.0.1
EACCES=13 # Permission denied
ESPACE=0

############### Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m
RED='\033[1;91m'
BLUE='\033[1;94m'
MAGENTA='\033[0;95m'

if [ "$UID" -ne 0 ]; then # Vous êtes ROOT
  echo -e "Permission denied : you must be ${RED}root${WHITE}."
  exit $EACCES
fi

# Intro
echo -e "\n${GREEN}===== System${WHITE}Cleaner Ver: ${BLUE}$VERSION ${WHITE}for${RED} Debian Servers ${WHITE}base system${GREEN} ====="

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

################ Apt
echo -e "\n${GREEN}>>> [ Apt Cache ] ${WHITE}Nettoyage du dossier ${BLUE}/var/cache/apt${WHITE}."
sudo du -sh /var/cache/apt
sudo apt clean --dry-run
sudo apt clean

echo -e "\n${GREEN}>>> [ Apt Obseletes] ${WHITE}Nettoyage des porgrammes obselètes."
sudo apt purge '~o' -y

echo -e "\n${GREEN}>>> [ Apt Autoremove ] ${WHITE}Nettoyage des porgrammes."
sudo apt autoremove --purge -y

echo -e "\n${GREEN}>>> [ Résidus ] ${WHITE}Recherche de résidus ... "
[[ $(dpkg -l | grep ^rc) ]] && sudo dpkg -P $(dpkg -l | awk '/^rc/{print $2}') || echo "Aucun résidu trouvé."

################ TMP
TEMPORY=$(du -sh /tmp/ | awk '{print $1}')
echo -e "\n${GREEN}>>> [ TMP ] ${WHITE}La taille du dossier ${BLUE}/tmp/${WHITE} est de : ${GREEN}$TEMPORY${WHITE}."
sudo find /tmp -type f -atime +10 -delete
echo "Les fichiers temporaires de plus de 10 jours ont été éffacés."

################ The end
echo -e "\n${BLUE}>>> ${WHITE}Nettoyage Effectué."


