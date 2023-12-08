#!/bin/bash

INPUT=addr.csv
#OLDIFS=$IFS
#IFS=","

while read Prenom Nom Courriel Adresse Numero Ville Anniversaire
do
echo -e "$Prenom $Nom $Courriel $Adresse $Numero $Ville $Anniversaire"
done < $INPUT|ans=$(zenity --width=800 --height=450 --list  --text "Contacts" --column "Prenom" --column "Nom") # --column "Courriel" --column "Adresse" --column "Numero" --column "Ville" --column "Anniversaire")
echo "Vous avez choisi: $ans"

