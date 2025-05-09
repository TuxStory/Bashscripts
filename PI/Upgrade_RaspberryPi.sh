#! /bin/bash

#########################################
#	Upgrade Raspberry Pi Script	#
#	Version :	0.6		#
#########################################

EACCES=13 # Permission denied

############### Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m
RED='\033[0;91m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'

################ Fonction Check
function Check()
{
if [ $? -eq 0 ]; then
	printf "Résultat de la commande %40s [\e[1;32m OK \e[0m]\n"
else
	printf "Résultat de la commande %40s [\e[1;91m Erreur \e[0m]\n"
fi
}

################ Root
if [ "$UID" -ne 0 ]; then # Vous êtes ROOT
  echo "Permission denied : you must be root."
exit $EACCES
fi

################ Clean apt cache.
echo -e "${GREEN}>>> ${WHITE}Nettoyage du cache de APT."
sudo apt clean
Check

############### Mise à jour du système.
echo -e "${GREEN}>>> ${WHITE}Mise à jour du système."
sudo apt update -y && sudo apt upgrade -y
Check

################ Full-upgrade
echo -e "${GREEN}>>> ${WHITE}Mise à niveau du système."
sudo apt full-upgrade -y
Check

################ Autoremove
echo -e "\n${GREEN}>>> ${WHITE}Nettoyage des paquets."
sudo apt autoremove -y
Check
