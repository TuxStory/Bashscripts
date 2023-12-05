#!/bin/bash

#########################
# Date 05/12/23         #
# Auteur : Antoine Even #
#########################

########## Sources
source ZenityAdresse.sh

########### Variables
Version=0.1
Reponse=0

########## Fonction
question(){
zenity --question --text "Voulez vous ajouter un autre contact ?" --ok-label "Oui" --cancel-label "Non"
}

main(){

while [ $Reponse == 0 ]
do
  addContact
  question ; Reponse=$?
done
}

########## Main
main
