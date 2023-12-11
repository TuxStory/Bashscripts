#!/bin/sh
# Vous devez déplacer le fichier « COPYING » dans le même dossier que ce script.

FILE=`dirname $0`/addr.csv

zenity --text-info \
       --title="Licence" \
       --filename=$FILE \
       --checkbox="J'ai lu et j'accepte les termes."

case $? in
    0)
        echo "Démarrage de l'installation !"
	# next step
	;;
    1)
        echo "Arrêt de l'installation !"
	;;
    -1)
        echo "Une erreur inattendue est survenue."
	;;
