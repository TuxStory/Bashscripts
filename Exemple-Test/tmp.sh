#!/bin/bash

#Creation du fichier temporaire.
TMPFILE=$(mktemp /tmp/file-XXXXX)

#Creation du fichier listing
echo $TMPFILE
ls $HOME > $TMPFILE

#Affichage
cat $TMPFILE

#Nettoyage (important)
trap "rm -f $TMPFILE" EXIT

