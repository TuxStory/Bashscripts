#!/bin/bash

#############################
# Script : vnstati-maker.sh #
# Auteur : Antoine Even     #
# Date   : 16/09/2020       #
#############################

#Variables

DATE=$(date +"%d-%m-%Y")
MOIS=$(date +"%m")

DOSSIER="/home/$USER/vnstat-graph"
INTERFACE="wlan0"

mkdir $DOSSIER
cd $DOSSIER
vnstati -vs -i $INTERFACE -o Jour-$DATE.png
vnstati -m -i $INTERFACE -o Mois-$MOIS.png
vnstati -d -i $INTERFACE -o MoisJours-$MOIS.png
