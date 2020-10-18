#!/bin/bash

zenity --forms --title="Ajout d'un ami" \
	--text="Saisissez les informations concernant votre ami." \
	--separator="," \
	--add-entry="Prénom" \
	--add-entry="Nom" \
	--add-entry="Courriel" \
	--add-entry="Adresse" \
	--add-entry="N°" \
	--add-entry="Ville" \
	--add-calendar="Anniversaire" >> addr.csv

case $? in
    0)
        echo "Ami ajouté.";;
    1)
        echo "Aucun ami ajouté."
	;;
    -1)
        echo "Une erreur inattendue est survenue."
	;;
esac
