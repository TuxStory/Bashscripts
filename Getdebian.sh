#!/bin/bash

#########################
# Name   : Getdebian.sh #
# Author : Tuxstory     #
#########################

REGEX='https:\/\/[a-z].*.iso\"'

Link=$(wget -qO- www.debian.org/download | grep -Eo $REGEX  2>/dev/null )
Link2=${Link%?}
Link3="https://cdimage.debian.org/cdimage/weekly-builds/amd64/iso-cd/debian-testing-amd64-netinst.iso"

echo ">>> Debian iso Downloader"
echo "1. Debian Stable netinstall amd64"
echo "2. Debian Testing netinstall amd64"
read -p "Votre choix ? : " choix

if [ $choix == '1' ]
then
  Download=$Link2
else
  Download=$Link3
fi

echo ">>> Téléchargement de la dernière version de Debian."
wget $Download -P ~/

#wget -qO- www.debian.org |
#grep -Eoi '<a [^>]+>' |
#grep -Eo 'href="[^\"]+"' |
#grep -Eo '(http|https)://[^/"]+'

#Pour supprimer les derniers caractères d’une chaîne,
#tapez le nom de la variable suivi d’un symbole % et d’un nombre de ? symboles égal au nombre de caractères à supprimer.
#Exemple:
#variable="verylongstring"
#echo ${variable%??????}

#REGEX="https:\/\/[a-z]{7}.*.iso" Old Debian Website
#www.debian.org
