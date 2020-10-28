#!/bin/bash

Fich=1
Dossier1="/home/antoine/Bureau/Mp3/"
Dossier2="/home/antoine/Bureau/CopeiTEST/"
Nombre=$(ls -R $Dossier1 | wc -l)
echo $Nombre
# Pour éviter le probleme des espaces dans les nom de dossiers
IFS='
'

copie()
{
  for fichier in $Dossier1/*/*
  do
    POURC=$Fich*100/$NOMBRE
    echo "$POURC"
    echo "# copie de $(basename $fichier)"
    cp -rf $fichier $Dossier2
    Fich=$(($Fich+1))
  done
}

zenity --question --width=200 --title="Backup" --text="\nFaut-il faire le backup"
if [ $? = 0 ] ; then
  copie | zenity --progress --percentage=0 --width=400 --auto-close
else
  exit 1
fi
