#!/bin/bash

REGEX='https:\/\/[a-z].*.iso\"'

Link=$(wget -qO- www.debian.org/download | grep -Eo $REGEX)
Link2=${Link%?}
wget $Link2 -P ~/

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
