#!/bin/bash

#############################
# Script : vnstati-maker.sh #
# Auteur : Antoine Even     #
# Date   : 16/09/2020       #
#############################

#Variables

DATE=$(date +"%d-%m-%Y")
MOIS=$(date +"%B")
ANNEE=$(date +"%Y")

DOSSIER="/home/$USER/vnstat-graph"
INTERFACE="wlan0"

if [ ! -d $DOSSIER ]; then
mkdir $DOSSIER
fi

cd $DOSSIER
vnstati -vs -i $INTERFACE -o Jour-$DATE.png
vnstati -m -i $INTERFACE -o $MOIS-$ANNEE.png
vnstati -d -i $INTERFACE -o $MOIS-$ANNEE-DETAIL.png
