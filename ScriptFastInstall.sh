#!/bin/bash

##################################################################
# Script Fast Install : Script de reinstallation après Formatage #
# Auteur : Antoine Even  Date : 15/09/2009   Rev : 11/10/2011    #
##################################################################

ICON="/usr/share/pixmaps/synaptic.png"
#Liste des Programmes
programmes=" 	abiword
		amule
		ansiweather
		audacious
		banshee
		bleachbit
		bluez-gnome
		bmon
		cheese
		chromium-browser
		chromium-browser-l10n
		deja-dup
		dfc
		dontzap
		fail2ban
		fbi
		filezilla
		firewalld
		frozen-bubble
		geany
		gnomebaker
		gnome-disk-utils
		gnome-games
		gnome-vfs-obexftp
		gnumeric
		gparted
		grsync
		gtk-recordmydesktop
		hardinfo
		hexchat
		htop
		imagemagick
		inxi
		iptraffic
		irssi
		lm-sensors
		lnav
		mc
		moc
		mplayer
		mu-editor
		nano
		nethogs
		ncdu
		neofetch
		rsync
		samba
		sensors-applet
		teeworlds
		tmux
		transmission
		tnftp
		tilda
		tuxpuck
		ubuntu-restricted-extras
		unrar
		verbiste
		verbiste-gnome
		vim
		virtualbox
		vlc
		vnstat
		vnstati
		w3m
		w3m-img
		xterm
		youtube-dl
		"

#Génération de la fenêtre Zenity
for i in $programmes; do
	PROGS="$PROGS FALSE ${i}" ; 
done
PROG=`zenity --window-icon "$ICON" --width "310" --height "500" --title "Script Fast Install" --text="Cochez les programmes à instealler" --list --checklist --column="Choix" --column="Les programmes à installer" ${PROGS}` ;
	if [ "${PIPESTATUS[0]}" != "0" ]; 
		then zenity --error --text "L'opération n'as pas été effectuée  "
        	exit
        fi
PROG=`echo ${PROG} | sed 's/|/ /g'`

#Installation des programmes (Verifier paquet disponible gksudo/gksu ubuntu/mint)
gksudo aptitude update | zenity --progress --text="Mise à jour des dépôts" --pulsate --auto-close
gksudo "xterm -e aptitude install $PROG --assume-yes" 
sudo aptitude clean | zenity --progress --text="Nettoyage des fichiers d'installation" --pulsate --auto-close
zenity --info --text "Réinstallation éffectuée !  "
