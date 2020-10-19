#!/bin/bash
# Author : Antoine Even 11/06/09
# Updates : 11/03/2012, 14/05/2013, 15/05/2013, 19/10/2020
# Réduction de photo besoin de imagemagick

EACCES=13 # Permission denied

if [ ! -x /usr/bin/mogrify ]; then
  echo "Imagemagick n'est pas installé !"
  exit $EACCES
fi

ICON="./Icon/gthumb.png"
# Change le séparateur standard (espace) pour RETURN
# Pour éviter le probleme des espaces dans les nom de dossiers
IFS='
'
function out( )
{
  #gère le bouton annuler des fenêtres zenity
  if   [[ $? = "1" ]]
  then exit 0
  fi
}

#Message
zenity --warning --window-icon "$ICON" --text="ZenityPhotos v0.5\n\nChoisissez le répertoire qui contient les photos à moddifier\nAttention : Les modifications seront irréversibles !" --width=400
#Variables
REPERTOIRE=`zenity --window-icon "$ICON" --file-selection --directory --title="choisissez un répertoire."` ; out
REDUCTION=$(zenity --window-icon "$ICON" --scale --text "Taux de réduction \nExemple : 90% réduit de 10% la taille de la photo" --min-value=2 --max-value=100 --value=50 --step 2); out ;
NOMBRE=$(ls $REPERTOIRE | wc -l)
Fich=1
EXTENSION=$(zenity --window-icon "$ICON" --list  --text "Extension des fichiers photos" --radiolist  --column "Choix" --column "Extension" TRUE JPG FALSE jpg FALSE jpeg FALSE JPEG);
echo $EXTENSION

#fonction
function progress()
{
	for fichier in $REPERTOIRE/*.$EXTENSION
	do
		mogrify -resize $REDUCTION% $fichier
			if [ $? -eq 0 ]; then
				#ok donc ne rien faire
				echo
			else
				#erreur
				exit 1
			fi
		POURC=`echo $Fich*100/$NOMBRE | bc -l`
		echo "$POURC"
		echo "# Modification de $(basename $fichier)"
		Fich=$(($Fich+1))
	done
}

case $? in
0)
	progress | zenity --window-icon "$ICON" --progress --percentage=0 --auto-close --width=500
	if [ "${PIPESTATUS[0]}" != "0" ]; then
		zenity ---window-icon "$ICON" -error --text "  Opération non effecutée" --width=200
	else
		zenity --window-icon "$ICON" --info --text "  Opération éffectuée !" --width=200
	fi
	;;
1)
	zenity --window-icon "$ICON" --error --text "Sélectionez un répertoire.";;
-1)
	zenity --window-icon "$ICON" --error --text "Sélectionez un répertoire.";;
esac
