#!/bin/bash

INPUT=addr.csv
OLDIFS=$IFS
IFS=","

while read Prenom Nom Courriel Adresse Numero Ville Anniversaire
do
echo -e "$Prenom $Nom $Courriel $Adresse $Numero $Ville $Anniversaire"
done <$INPUT


