#!/bin/bash

#########################
# Date 05/12/23         #
# Auteur : Antoine Even #
#########################

########## Sources
source ZenityAdresse.sh
source ZenityViewer.sh

########### Variables
Version=0.5
Reponse=0

########## Fonction
question(){
zenity --question --text "Voulez vous ajouter un autre contact ?" --ok-label "Oui" --cancel-label "Non"
}

main(){
  while true
  do
    ans=$(viewContact)
    echo $ans
    if [[ "$ans" == "Ajouter un contact" ]]; then
      while [ $Reponse == 0 ]
      do
        addContact
        question ; Reponse=$?
      done
    elif [[ "$ans" == "Quitter" || "$?" != "0" ]]; then
    break
    fi
  done
}

########## Main
main

#corriger la boucle ne peut plus ajouter de contact apres retour a la fenetre principale
