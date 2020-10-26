#!/bin/bash

#####################################################
#						    #
# Auteur : Antoine Even				    #
# Date : 16 juin 2009 				    #
# FastPics : Sctipt utilisant imagemagick et Zenity #
#					            #
#####################################################

# Verification Imagemagik
commande="convert"
if [  "`which $commande`" == "" ]; then
	zenity --info --title="FastPics" --width="350" --text="ImageMagick n'est pas installé !\n\nIl est nécésaire pour que le programme fonctionne.\nNous allons l'installer maintenant."
	pkexec apt install imagemagick -y | zenity --progress --width=350 --title="FastPics" --text="Installation d'imagemagick en cours..." --pulsate --auto-close
fi

# Change le séparateur standard (espace) pour RETURN
# Pour éviter le probleme des espaces dans les nom de dossiers
IFS='
'
# Boucle while infini
while [ 1 ]
do

# Choix de l'action
Fich=1
CHOIX=`zenity  --list  --title="FastPics" --width=350 --height=250 --text "Que voulez-vous faire?" --radiolist  --column "Choix" --column "Action" TRUE "Redimentionner des photos à 25%" FALSE "Renommer des photos" FALSE "Couleurs à Noir et Blanc" FALSE "Quitter le programme"`

#Redimentionne
function Redimentionne {

REPERTOIRE=`zenity --file-selection --directory --title="choisissez un répertoire."`
NOMBRE=$(ls $REPERTOIRE | wc -l)
Fich=1
function progress()
{
	for fichier in $REPERTOIRE/*.JPG *.jpg
	do
		mogrify -resize 25% $fichier
		POURC=`echo $Fich*100/$NOMBRE | bc -l`
		echo "$POURC"
		Fich=$(($Fich+1))
	done
}

case $? in
0)
	progress | zenity --progress --text="Opération en cours..." --percentage=0 --auto-close
	if [ "${PIPESTATUS[0]}" != "0" ]; then
		zenity --error --text "  opération non effecutée  "
	else
		zenity --info --text "  opération éffectuée !  "
	fi
	;;
1)
	zenity --error --text "sélectionez un répertoire.";;
-1)
	zenity --error --text "sélectionez un répertoire.";;
esac
}

#Renomme
function Renomme {
REPERTOIRE=`zenity --file-selection --directory --title="choisissez un répertoire."`
NOM=`zenity --entry --entry-text="image" --title="Renommer les fichiers" --text="Veuillez rentrer un nouveau nom commun à tous les images"`
NOMBRE=$(ls $REPERTOIRE | wc -l)
Fich=1
cd $REPERTOIRE
function progress()
{
	for fichier in $REPERTOIRE/*.JPG *.jpg
	do
		mv $fichier "$NOM $Fich".jpg
		POURC=`echo $Fich*100/$NOMBRE | bc -l`
		echo "$POURC"
		Fich=$(($Fich+1))
	done
}

case $? in
0)
	progress | zenity --progress --text="Opération en cours..." --percentage=0 --auto-close
	if [ "${PIPESTATUS[0]}" != "0" ]; then
		zenity --error --text "  opération non effecutée  "
	else
		zenity --info --text "  opération éffectuée !  "
	fi
esac
}

#Fonction Black&White
function BlackWhite {
REPERTOIRE=`zenity --file-selection --directory --title="choisissez un répertoire."`
NOMBRE=$(ls $REPERTOIRE | wc -l)
Fich=1
cd $REPERTOIRE
function progress()
{
	for fichier in $REPERTOIRE/*.JPG *.jpg
	do
		convert $fichier -colorspace Gray $fichier
		POURC=`echo $Fich*100/$NOMBRE | bc -l`
		echo "$POURC"
		Fich=$(($Fich+1))
	done
}
case $? in
0)
	progress | zenity --progress --text="Opération en cours..." --percentage=0 --auto-close
	if [ "${PIPESTATUS[0]}" != "0" ]; then
		zenity --error --text "  opération non effecutée  "
	else
		zenity --info --text "  opération éffectuée !  "
	fi
esac
}

case "$CHOIX" in

"Redimentionner des photos à 25%") Redimentionne ;
;;
"Renommer des photos") Renomme ;
;;
"Couleurs à Noir et Blanc") BlackWhite ;
;;
"Quitter le programme") exit 0 ;
;;
*) exit 0 ;
;;
esac
done

