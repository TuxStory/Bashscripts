#!/bin/bash

####################
# NEED TO BE FIXEX #
####################

echo "Exemple de site possible : "
echo "www.debian.org"
echo "www.fedora-fr.org"


# Traitement des paramètres
# nom du fichier source
if [ ! -z $1 ]
then
    ping -c 1 $1 > /dev/null
    if [ $? -eq 0 ]; then
        echo OK
    else
        echo FAIL
        exit 1
    fi
else
	# aucun paramètre reçu
	echo "Parametre(s) manquant(s)"
	exit
fi

REGEX="https:\/\/[a-z]{7}.*.iso"
Link=$(wget -qO- $1 | grep -Eo $REGEX)
echo $Link
wget $Link -P ~/

