#!/bin/bash

#################################
# Youtube Zenity Gui		#
# Date 		: 16/02/2018	#
# Revision	: 21/10/2020	#
# Version 	: 0.4		#
#################################

if ! type youtube-dl > /dev/null; then
  zenity --info --text "Veuillez installer Youtube-dl !"
  exit 1
fi

#autre facçon de faire pour xterm
if [ ! -x /usr/bin/xterm ]; then
  zenity --info --text "Il manque un programme, installez xterm."
  exit 1
fi


function out( )
{
  #gère le bouton annuler des fenêtres zenity
  if   [[ $? = "1" ]]
  then exit 0
  fi
}

Choix=$(zenity  --list  --title "Youtube ZenGui" --text "Que voulez-vous faire?" --radiolist  --column "Choix" --column "Action" TRUE "Télécharger une vidéo : Mp4" FALSE "Télécharger une vidéo : Mp3" FALSE "Télécharger une vidéo";out)
Lien=$(zenity --title "Name" --entry --text "Collez Le lien de la vidéo svp !";out)

case $? in
0)
	if  [ "$Choix" = "Télécharger une vidéo : Mp4" ]; then
	cd ~ ; mkdir "youtube ZenGui" ; cd "youtube ZenGui" ; xterm -e "youtube-dl -f mp4 $Lien
	read $test -p 'Pressez [Enter] pour continuer...'"
	fi

	if  [ "$Choix" = "Télécharger une vidéo : Mp3" ]; then
	cd ~ ; mkdir "youtube ZenGui" ; cd "youtube ZenGui" ; xterm -e "youtube-dl -x --audio-format mp3 --audio-quality 192k $Lien
	read $test -p 'Pressez [Enter] pour continuer...'"
	fi

	if  [ "$Choix" = "Télécharger une vidéo" ]; then
	cd ~ ; mkdir "youtube ZenGui" ; cd "youtube ZenGui" ; xterm -e "youtube-dl $Lien
	read $test -p 'Pressez [Enter] pour continuer...'"
	fi
	;;
1)
	zenity --window-icon "$ICON" --error --text "Une erreur est survenue.";;
-1)
	zenity --window-icon "$ICON" --error --text "Une erreur est survenue.";;
esac

#if ! foobar_loc="$(type -p "$foobar_command_name")" || [ -z "$foobar_loc" ]; then
  # install foobar here
#fi
