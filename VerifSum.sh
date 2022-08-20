#!/bin/bash
#########################
# Nom      VerifSum     #
# Auteur   Antoine Even #
# Date	   20/08/2022   #
# Version  0.0.1        #
#########################

Dossier="$HOME/GitHub/Bashscripts/"
Data="$HOME/.VerifSum/Data_VerifSum"
Old="$HOME/.VerifSum/Data_Old"

#A completer
mkdir "$HOME/.VerifSum" #si n'exite pas
#touch $Data
#touch $Old
# Il faudrait des fichiers avec Dates

for fichier in "$Dossier"/*
do
  sha256sum $fichier >> $Data
done

#Comparer les fichiers
diff $Data $Old

#copie temporaire pour test
cp $Data $Old

#Efface le fichier de Données.
rm $Data
