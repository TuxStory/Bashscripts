#!/bin/bash

#############################
# Script : vnstati-maker.sh #
# Auteur : Antoine Even     #
# Date   : 16/09/2020       #
# Modif  : 21/06/2021       #
#############################

# Ajouter une ligne similaire à votre crontab [commande : crontab -e]
#
#  00 23 * * * /home/pi/vnstati-maker.sh
#

#Variables
VERSION="1.2.1"
DATE=$(date +"%d-%m-%Y")
JOUR=$(date +"%d")
MOIS=$(date +"%B")
ANNEE=$(date +"%Y")

#Configuration
INTERFACE="wlan0"
USER="pi" #Besoin de le spécifier pour crontab
DOSSIER="/home/$USER/vnstat-graph/$ANNEE-$MOIS"

#Vérification de la présence de vnstat et vnstati
if [ ! -x /usr/bin/vnstat ] || [ ! -x /usr/bin/vnstati ]; then
echo "Il manque un programme, installez vnstat & vnstati."
exit 1
fi

#Vérification du dossier.
if [ ! -d $DOSSIER ]; then
mkdir -p $DOSSIER
fi

#Creation PNG du jour
vnstati -vs -i $INTERFACE -o $DOSSIER/Jour-$DATE.png

#Stats pour le mois passé
if [ $JOUR == 28 ] && [ $MOIS == 2 ] || [ $JOUR == 30 ] || [ $JOUR == 31 ]; then
    vnstati -m -i $INTERFACE -o $DOSSIER/$MOIS-$ANNEE-Mois.png
    vnstati -d -i $INTERFACE -o $DOSSIER/$MOIS-$ANNEE-jours.png
fi

#Stats par année
if [ $JOUR == 31 ] &&  [ $MOIS == 12 ]; then
    vnstati -y -i $INTERFACE -o $DOSSIER/Année.png
fi

#Décommenter pour notifier le joural (logs)
logger "$0 commande effectué à $DATE : PNG [ ok ]"

