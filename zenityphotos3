#!/bin/bash
# Author : Antoine Even 11/06/09 Update 11/03/2012 
# Réduction de photo besoin de imagemagik

# sudo aptitude install imagemagik 
ICON="./Icon/gthumb.png"
# Change le séparateur standard (espace) pour RETURN 
# Pour éviter le probleme des espaces dans les nom de dossiers
IFS='
' 
function out()
{	
	#gère le bouton annuler des fenêtres zenity
	if   [[ $? = "1" ]]
	then exit 0
	fi
}
#Variables
REPERTOIRE=`zenity --window-icon "$ICON" --file-selection --directory --title="choisissez un répertoire."` ; out
REDUCTION=$(zenity --window-icon "$ICON" --scale --text "Taux de réduction \nExemple : 90% réduit de 10% la taille de la photo" --min-value=2 --max-value=100 --value=50 --step 2); out ;
NOMBRE=$(ls $REPERTOIRE | wc -l)
Fich=1
EXTENSION=$(zenity --window-icon "$ICON" --entry --title="Type de Photos" --text="Veuillez indiquer l'extension de vos fichiers photo" --entry-text="JPG" jpg jpeg JPEG) ; out
#echo $EXTENSION 

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
		Fich=$(($Fich+1))
	done
}

case $? in
0)
	progress | zenity --window-icon "$ICON" --progress --text="Opération en cours..." --percentage=0 --auto-close
	if [ "${PIPESTATUS[0]}" != "0" ]; then	
		zenity ---window-icon "$ICON" -error --text "  opération non effecutée  "
	else
		zenity --window-icon "$ICON" --info --text "  opération éffectuée !  "
	fi
	;;
1) 
	zenity --window-icon "$ICON" --error --text "sélectionez un répertoire.";;
-1)  
	zenity --window-icon "$ICON" --error --text "sélectionez un répertoire.";;
esac
