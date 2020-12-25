#!/bin/bash

##############################
# Scrpit Post-Installation   #
# 12/10/2020 ver 0.6         #
# Antoine Even               #
##############################

#### A Faire une fonction pour éviter les boucles répétées ####

#The 'yes' command will echo 'y' (or whatever you ask it to) indefinitely.
#Use it as:
#yes | command-that-asks-for-input
#or, if a capital 'Y' is required:
#yes Y | command-that-asks-for-input
#yes Y | apt install $(basename $i) ; echo
#Plus necessaire avec apt install -y

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

#Liste des programmes. #########################################################
Programmes="dfc audacious gparted inxi neofetch htop hardinfo hexchat vlc ffmpegthumbnailer
	youtube-dl deja-dup system-config-printer bleachbit gnome-disk-utils
	chromium-browser chromium-browser-l10n xterm rsync grsync"

Programmes_Console="ranger ansiweather irssi fbi mc oping w3m w3m-img bmon ncdu slurm"

Programmes_Internet="filezilla tnftp rtorrent iptraffic transmission amule"

Games="ntetris nsnake cavezofphear bsdgames bsdgames-nonfree cmatrix freesweep bastet nettoe ninvaders
	frozen-bubble gnome-games xboard lbreakout2 burgerspace"

Admin="fail2ban firewalld samba nmon nload vnstat vnstati testdisk iperf3 hddtemp lnav tmux lm-sensors glances nethogs smartmontools"

Programmes_Dev="git geany nano mu-editor python3-numpy"

printf "Voulez-vous installer la liste des programmes \e[35mcourants\e[0m: (Oui/Non) " ; read reponse
printf "Voulez-vous installer la liste des programmes \e[35mconsoles\e[0m: (Oui/Non) " ; read reponse1
printf "Voulez-vous installer la liste des programmes \e[35mInternet\e[0m: (Oui/Non) " ; read reponse2
printf "Voulez-vous installer la liste des programmes \e[35mAdministration\e[0m: (Oui/Non) " ; read reponse4
printf "Voulez-vous installer la liste des programmes \e[35mDeveloppement\e[0m: (Oui/Non) " ; read reponse5
printf "Voulez-vous installer la liste des \e[35mjeux\e[0m: (Oui/Non) " ; read reponse3

#Boucle Programmes courants ####################################################
if [[ $reponse =~ ^([oO][uU][iI]|[oO])$ ]]
then
	for i in $Programmes; do
		echo -e "\033[1;32mInstallation de :" $(basename $i)
		echo -e "\033[0;0m"
		apt install -y $(basename $i) ; echo
	done
fi

#Boucle Programmes Console
if [[ $reponse1 =~ ^([oO][uU][iI]|[oO])$ ]]
then
	for i in $Programmes_Console; do
		echo -e "\033[1;32mInstallation de :" $(basename $i)
		echo -e "\033[0;0m"
		apt install -y $(basename $i) ; echo
	done
fi

#Boucle Internet
if [[ $reponse2 =~ ^([oO][uU][iI]|[oO])$ ]]
then
	for i in $Programmes_Internet; do
		echo -e "\033[1;32mInstallation de :" $(basename $i)
		echo -e "\033[0;0m"
		apt install -y $(basename $i) ; echo
	done
fi

#Boucle des Jeux
if [[ $reponse3 =~ ^([oO][uU][iI]|[oO])$ ]]
then
	for i in $Games; do
		echo -e "\033[1;32mInstallation de :" $(basename $i)
		echo -e "\033[0;0m"
		apt install -y $(basename $i) ; echo
	done
fi

#Boucle Admin
if [[ $reponse4 =~ ^([oO][uU][iI]|[oO])$ ]]
then
	for i in $Admin; do
		echo -e "\033[1;32mInstallation de :" $(basename $i)
		echo -e "\033[0;0m"
		yes Y | apt install $(basename $i) ; echo
	done
fi

#Boucle Dev
if [[ $reponse5 =~ ^([oO][uU][iI]|[oO])$ ]]
then
	for i in $Programmes_Dev; do
		echo -e "\033[1;32mInstallation de :" $(basename $i)
		echo -e "\033[0;0m"
		yes Y | apt install $(basename $i) ; echo
	done
fi

# Nettoyage ####################################################################
echo -e "\033[1;34mapt clean\033[0m"
apt clean
echo -e "\033[1;34mapt autoremove\033[0m"
apt autoremove -y
#echo -e "\033[1;34mupdatedb\033[0m"
#updatedb
echo -e "\033[1;32mLe système est à jour :)\033[0m"
