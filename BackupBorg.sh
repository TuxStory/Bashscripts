#!/bin/bash

#########################
# Nom	 : BackupBorg   #
# Auteur : Antoine Even #
# Date	 : 24/02/2023   #
#########################

############### Variables
VERSION="0.0.7"
DOSSIER="/home/$USER"
DESTINATION="/run/media/$USER/data/Backup/$HOSTNAME/"

USERSSH="fr"
IP="192.168.1.23"
DESTINATION_DISTANTE="/media/fr/Data/Backup/$HOSTNAME/"
PORT="22"
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
		--exclude '/home/*/VirtualBox VMs' \
		--exclude '/home/*/Bureau/backup2' \
		--exclude '/home/*/Samba' \
		--exclude '/home/*/Youtube' \
		--exclude '/home/*/eternallands' \
		$DESTINATION::$DATE_ARCHIVE $DOSSIER
	logger ===== Sauvegarde locale effectuée : $DATE ====
}
################ Backup Distant. >>> Si possible utilisez une clé ssh ou ssh-agent. <<<
Backup_Distant() {
	if [[ $(ping -c 1 -W 1 $IP | grep -c "ttl=64") -eq 0 ]] #Verification que la cible est présente.
	then
		echo -e "${RED}>>> ${WHITE}Le serveur $IP ne répond pas [\033[1;31mfalse\033[0m]"
		exit $EACCES
	else
		echo -e "${GREEN}>>> ${WHITE}Réponse du serveur $IP [\033[1;32mok\033[0m]"
	fi
	###### Création du dossier
	echo -e "${GREEN}>>> ${WHITE}Creation du dossier de sauvegarde."
        ssh $USERSSH@$IP -p $PORT "mkdir -p $DESTINATION_DISTANTE"
	#ssh $USERSSH@$IP -p $PORT '[ -d $DESTINATION_DISTANTE ] || mkdir -p $DESTINATION_DISTANTE ]'

	#Backup
	echo -e "${GREEN}>>> ${WHITE}Backup Distant."
	borg init -e none ssh://$USERSSH@$IP:$PORT$DESTINATION_DISTANTE
	echo -e "${GREEN}>>> ${WHITE}La sauvegarde distante commence.."
	borg create --progress -C zstd,10 \
		--exclude '/home/*/.?*' \
		--exclude '.home/*/.config' \
		--exclude '/home/*/.cache' \
		--exclude '/home/*/.mozilla' \
		--exclude '/home/*/Téléchargements' \
		--exclude '/home/*/Musique' \
		--exclude '/home/*/Youtube' \
		--exclude '/home/*/VirtualBox VMs' \
		ssh://$USERSSH@$IP:$PORT$DESTINATION_DISTANTE::$DATE_ARCHIVE $DOSSIER
	logger ===== Sauvegarde distante effectuée : $DATE ====
}

Verif
Backup_Local
#Backup_Distant
