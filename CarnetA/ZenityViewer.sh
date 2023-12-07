#!/bin/bash

INPUT=addr.csv
OLDIFS=$IFS
IFS=";"

while read Contact
do
echo -e "$Contact"

done < $INPUT|ans=$(zenity --list  --text "Contacts" --column "Prénom")
echo "You chose: $ans"

