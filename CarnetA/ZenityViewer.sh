#!/bin/bash

cat addr.csv |          # get data from file
  tr ',' '\n' |         # put each csv field on a separate line
  zenity --list --width=800 --height=450 \
    --column=Prenom \
    --column=Nom \
    --column=Courriel \
    --column=Adresse \
    --column=Numero \
    --column=Ville \
    --column=Anniversaire \
