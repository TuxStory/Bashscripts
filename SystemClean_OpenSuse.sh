#!/bin/bash

####################################
# Nom		: SystemCleaner.sh #
# Auteur 	: Antoine Even	   #
# Date 		: 21/08/23	   #
# Revision	: 21/08/23         #
####################################

VERSION=0.0.1
EACCES=13 # Permission denied
ESPACE=0

############### Couleurs
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
echo -e "\n${GREEN}===== System${WHITE}Cleaner Ver: ${BLUE}$VERSION ${WHITE}for${RED} OpenSuse ${WHITE}base system${GREEN} ====="

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

############### Chromium - Chromium
if [ -d /home/"$SUDO_USER"/.config/chromium/Default/Service\ Worker/ ]
then
  CHROME=$(du -sh /home/"$SUDO_USER"/.config/chromium/Default/Service\ Worker/ | awk '{print $1}')
  echo -e "\n${GREEN}>>> [ Chrome ] ${WHITE}La taille du dossier de Chrome ${BLUE}.cache${WHITE} est de : ${GREEN}$CHROME${WHITE}."
  rm -rf /home/antoine/.config/chromium/Default/Service\ Worker/
  echo "Le cache de chrome a été vidé."
fi

################ Poubelle
POUBELLE=$(du -sh /home/"$SUDO_USER"/.local/share/Trash/files | awk '{print $1}')
echo -e "\n${GREEN}>>> [ Trash ] ${WHITE}La taille de la poubelle ${BLUE}~/.local/share/Trash/files${WHITE} est de : ${GREEN}$POUBELLE${WHITE}."
sudo rm -rf /home/"$SUDO_USER"/.local/share/Trash/files/*
echo "La poubelle à été vidée."

################ Zypper
echo -e "\n${GREEN}>>> [ Zypper Cache ] ${WHITE}Nettoyage du dossier ${BLUE}cache${WHITE}."
#sudo du -sh /var/cache/apt
sudo zypper clean --dry-run
sudo zypper clean -y

echo -e "\n${GREEN}>>> [ Zypper Dependances ] ${WHITE}Verification des dépendances des paquets ."
sudo zypper verify -y

echo -e "\n${GREEN}>>> [ Zypper Autoremove ] ${WHITE}Nettoyage des porgrammes."
sudo zypper autoremove -y

echo -e "\n${GREEN}>>> [ Résidus ] ${WHITE}Recherche de résidus ... "
zypper packages --unneeded -y | awk -F'|' 'NR==0 || NR==1 || NR==2 || NR==3 || NR==4 {next} {print $3}' | grep -v Name | sudo xargs zypper remove --clean-deps

################ TMP
TEMPORY=$(du -sh /tmp/ | awk '{print $1}')
echo -e "\n${GREEN}>>> [ TMP ] ${WHITE}La taille du dossier ${BLUE}/tmp/${WHITE} est de : ${GREEN}$TEMPORY${WHITE}."
sudo find /tmp -type f -atime +10 -delete
echo "Les fichiers temporaires de plus de 10 jours ont été éffacés."

################ The end
echo -e "\n${BLUE}>>> ${WHITE}Nettoyage Effectué."
