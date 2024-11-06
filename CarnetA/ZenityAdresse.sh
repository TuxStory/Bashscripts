#!/bin/bash

addContact(){
zenity --forms --title="Ajout d'un contact" \
	--text="Saisissez les informations concernant votre contact." \
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
        zenity --info --text "Le contact a été ajouté.";;
    1)
        zenity --warnings --text "Le contact n'a pas été ajouté !";;
    -1)
        zenity --warnings --text "Une erreur inattendue est survenue.";;
esac

}
