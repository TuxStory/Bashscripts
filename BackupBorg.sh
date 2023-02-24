#!/bin/bash

#########################
# Nom	 : BackupBorg   #
# Auteur : Antoine Even #
# Date	 : 24/02/2023   #
#########################

############### Variables
VERSION="0.0.4"
DOSSIER="/home/$USER"
DESTINATION="/run/media/$USER/data/Backup/$HOSTNAME/"

USERSSH="tuxstory"
IP="192.168.1.10"
DESTINATION_DISTANTE=""
PORT="2222"
DATE_ARCHIVE=`date +"%d%m%y"`
DATE=`date +"%d %B %Y @ %T "`
EACCES=13 # Permission denied

############### Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m
RED='\033[0;91m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'

################ Vérification Borg.
Verif() {
	if [ ! -x /usr/bin/borg ]; then
    		echo -e "${RED}>>> ${WHITE}BorgBackup n'est pas installé !"
    		exit $EACCES
	else
		echo -e "${GREEN}>>> ${WHITE}BorgBackup est installé."
	fi
}

################ Backup Local.
Backup_Local() {
	echo -e "${GREEN}>>> ${WHITE}Creation du dossier de sauvegarde."
	mkdir -p $DESTINATION
	echo -e "${GREEN}>>> ${WHITE}Backup Local."
	borg init -e none $DESTINATION
	echo -e "${GREEN}>>> ${WHITE}La sauvegarde commence.."
	borg create --progress -C zstd,10 \
		--exclude '/home/*/.?*' \
		--exclude '.home/*/.config' \
		--exclude '/home/*/.cache' \
		--exclude '/home/*/.mozilla' \
		--exclude '/home/*/Téléchargements' \
		--exclude '/home/*/Musique' \
		$DESTINATION::$DATE_ARCHIVE $DOSSIER

}
################ Test si le serveur est présent #
Backup_Distant() {
	if [[ $(ping -c 1 -W 1 $IP | grep -c "time=") -eq 0 ]]
	then
		echo -e "Le serveur $IP ne répond pas [\033[1;31mfalse\033[0m]"
		exit 41
	else
		echo -e "Réponse du serveur $IP [\033[1;32mok\033[0m]"
	fi
}

Verif
Backup_Local
