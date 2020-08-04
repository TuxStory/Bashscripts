#!/bin/bash

#############################
# Scrpit Installation APT   #
# 15/07/2018 ver 0.3        #
# Antoine Even              #
#############################

#The 'yes' command will echo 'y' (or whatever you ask it to) indefinitely.
#Use it as:
#yes | command-that-asks-for-input
#or, if a capital 'Y' is required:
#yes Y | command-that-asks-for-input

EACCES=13 # Permission denied

if [ "$UID" -ne 0 ]; then # Vous êtes ROOT
  echo "Permission denied : you must be root."
exit $EACCES
fi

clear
echo -e "\033[1;34mMises à jour du système :"
echo -e "\033[0;0m-------------------------" 
echo
apt update ; apt upgrade -y
clear
echo -e "\033[1;34mInstallation des progammes :"
echo -e "\033[0;0m----------------------------"
echo

#Liste des programmes.
programmes="	dfc
		audacious
		gparted
		inxi
		neofetch
		htop
		hardinfo
		hexchat
		vlc
		vnstat
		slurm
		tmux
		ffmpegthumbnailer
		youtube-dl
		deja-dup
		testdisk
		system-config-printer
		lnav
		nmon
		bleachbit
		glances
		vnstat
		"
		
Programmes_Console="	ansiweather
			tnftp
			irssi
			fbi
			mc
			rtorrent
			atop
			oping
			vim
			w3m
			w3m-img
			bmon
			xterm
			"
	#filezilla

Games="	ntetris
	nsnake
	cavezofphear
	bsdgames
	bsdgames-nonfree
	cmatrix
	freesweep
	bastet
	nettoe
	ninvaders
	"

read  -r -p "Voulez-vous installer la liste des programmes habituels: (Oui/Non) " reponse
if [[ $reponse =~ ^([oO][uU][iI]|[oO])$ ]]
then
	for i in $Programmes_Console; do
		echo -e "\033[1;32mInstallation de :" $(basename $i) 
		echo -e "\033[0;0m"
		yes Y | apt install $(basename $i) ; echo
	done
fi

read  -r -p "Voulez-vous installer la liste des programmes consoles: (Oui/Non) " reponse
if [[ $reponse =~ ^([oO][uU][iI]|[oO])$ ]]
then
	for i in $programmes; do
		echo -e "\033[1;32mInstallation de :" $(basename $i) 
		echo -e "\033[0;0m"
		yes Y | apt install $(basename $i) ; echo
	done
fi

read  -r -p "Voulez-vous installer la liste des jeux consoles: (Oui/Non) " reponse
if [[ $reponse =~ ^([oO][uU][iI]|[oO])$ ]]
then
	for i in $Games; do
		echo -e "\033[1;32mInstallation de :" $(basename $i) 
		echo -e "\033[0;0m"
		yes Y | apt install $(basename $i) ; echo
	done
fi

echo -e "\033[1;34mapt clean\033[0m"
apt clean
echo -e "\033[1;34mupdatedb\033[0m"
updatedb
echo -e "\033[1;32mLe système est à jour :)\033[0m"
