#!/bin/bash
#########################
# Nom      VerifSum     #
# Auteur   Antoine Even #
# Date	   20/08/2022   #
# Version  0.0.5        #
#########################

# Dossier à Analyser
Dossier="$HOME/GitHub/Bashscripts/"

# Fichier & Espace de Travail
WorkSpace="$HOME/.VerifSum"
Data="$HOME/.VerifSum/Data_VerifSum"
Old="$HOME/.VerifSum/Data_Old"

#A completesr
if [ ! -d $WorkSpace ]
then
  mkdir $WorkSpace
  touch $Data
  touch $Old
fi

# Il faudrait des fichiers avec Dates

for fichier in "$Dossier"/*
do
  if [ ! -d "$fichier" ]; then
    sha256sum $fichier >> $Data
  fi
done

#Comparer les fichiers
diff $Data $Old
if [[ $? == 1 ]]
then
  echo -e "\nChangements détéctés - Status [ FAILED ]"
else
  echo -e "\nAucuns changements détéctés - Status [ OK ]"
fi

#copie temporaire pour test
cp $Data $Old

#Efface le fichier de Données.
rm $Data