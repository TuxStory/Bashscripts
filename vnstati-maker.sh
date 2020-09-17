#!/bin/bash

#############################
# Script : vnstati-maker.sh #
# Auteur : Antoine Even     #
# Date   : 16/09/2020       #
# Modif  : 17/09/2020       #
#############################

#Configuration
INTERFACE="wlan0"
DOSSIER="/home/$USER/vnstat-graph"
VERSION="0.2"

#Variables
DATE=$(date +"%d-%m-%Y")
JOUR=$(date +"%d")
MOIS=$(date +"%B")
ANNEE=$(date +"%Y")

#Vérification du dossier.
if [ ! -d $DOSSIER ]; then
mkdir $DOSSIER
fi

#Creation PNG du jour
cd $DOSSIER
vnstati -vs -i $INTERFACE -o Jour-$DATE.png

if [ $JOUR == 1 ]; then
    vnstati -m -i $INTERFACE -o $MOIS-$ANNEE.png
    vnstati -d -i $INTERFACE -o $MOIS-$ANNEE-DETAIL.png
fi

#Décommenter pour les Stats par années
#vnstati -y -i wlan0 -o Année.png
