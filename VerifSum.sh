#!/bin/bash
#########################
# Nom      VerifSum     #
# Auteur   Antoine Even #
# Date	   20/08/2022   #
# Version  0.1.1        #
#########################

############### Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m

############### Dossier à Analyser
#Dossier="$HOME/GitHub/Bashscripts/"
Dossier="$HOME/Documents/"

############## Fichier & Espace de Travail
DATE=$(date +"%d-%m-%Y_%H:%M")
WorkSpace="$HOME/.VerifSum"
Data="$HOME/.VerifSum/Data_VerifSum_$DATE"
Old="$HOME/.VerifSum/Data_Old"

###############A completesr
if [ ! -d $WorkSpace ]
then
  mkdir $WorkSpace
  touch $Data
  touch $Old
fi

# Il faudrait des fichiers avec Dates
SAVEIFS=$IFS
IFS=$(echo -en "\n\b") #Résoud le problème des epaces dans les noms de fichiers
for fichier in "$Dossier"/*
do
  if [ ! -d "$fichier" ]; then
    sha256sum $fichier >> $Data
  fi
done
IFS=$SAVEIFS

#Comparer les fichiers
diff $Data $Old
if [[ $? == 1 ]]
then
  echo -e "\nChangements détéctés - Status [ FAILED ]"
else
  echo -e "\nAucuns changements détéctés - Status [${GREEN} OK ${WHITE}]"
fi

#Création de l'archive
cp $Data $Old
cp $Old $WorkSpace/"Archive_"$DATE

#Efface le fichier de Données.
rm $Data
echo -e "Fichier sauvé : ${GREEN} $WorkSpace/"Archive_"$DATE${WHITE}\nPour une comparaison manuelle."

