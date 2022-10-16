#!/bin/bash

#############################
# Script : ytubedlpBash.sh  #
# Auteur : Antoine Even     #
# Date   : 17/11/2021       #
# Modif  : 16/10/2022       #
#############################

#Variables
VERSION="0.1.8"
DOSSIER="/home/$USER/Youtube"

#Vérification de la présence du logiciel.
if [ ! -x /usr/local/bin/yt-dlp ] ; then
echo "Le logiciel yt-dlp n'est manquant, veulliez l'installer."
echo "Instrucrion :"
echo "sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp"
echo "sudo chmod a+rx /usr/local/bin/yt-dlp"
exit 1
fi

#message
clear
echo "=============================="
echo "      Youtube Downloader      "
echo "=============================="
echo
echo "0. Liste des formats."
echo "1. Vidéo au format webp."
echo "2. Vidéo au format mp4."
echo "3. Vidéo au format mp4. [BESTVIDEO]"
echo "4. Bande sonore au format mp3."
echo "5. Mise à jour de yt-dlp."

read -p $'\n'"Votre choix ? : " choix

if [[ $choix != 4 ]]; then
	if [ ! -d "$DOSSIER" ]; then
    		cd ~ ; mkdir Youtube
        	echo "Création du dossier de sauvegarde."
        	cd $DOSSIER
    	else
        	cd $DOSSIER
        	echo "Le dossier de sauvegarde est /home/$USER/Youtube."
    	fi
    	read -p "Lien de la page Youtube : " URL
fi

#Traitement
if [[ $choix = 0  ]]
then
	yt-dlp --list-formats $URL
fi

if [[ $choix = 1  ]]
then
	yt-dlp $URL
fi

if [[ $choix = 2 ]]
then
	yt-dlp $URL -f mp4
fi

if [[ $choix = 3 ]]
then
	yt-dlp $URL --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best"
fi


if [[ $choix = 4 ]]
then
	yt-dlp -f 'ba' -x --audio-format mp3 $URL
fi

if [[ $choix = 5 ]]
then
    sudo yt-dlp -U
fi
