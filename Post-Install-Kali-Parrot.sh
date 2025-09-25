#!/bin/bash

########################################
# Scrpit Kali-Parrot Post-Installation #
# 21/03/2024 - ver 0.1.9 25/09/2025    #
# Antoine Even                         #
########################################

#The 'yes' command will echo 'y' (or whatever you ask it to) indefinitely.
#Use it as:
#yes | command-that-asks-for-input
#or, if a capital 'Y' is required:
#yes Y | command-that-asks-for-input
#yes Y | apt install $(basename $i) ; echo
#Plus necessaire avec apt install -y

#arr=($line) convert a string into an array

EACCES=13 # Permission denied

if [ "$UID" -ne 0 ]; then # Vous êtes ROOT
  echo "Permission refusée : vous devez être root."
exit $EACCES
fi

clear

#Update System #################################################################

echo -e "\033[1;34mMises à jour du système :"
echo -e "\033[0;0m-------------------------"
echo
apt update && apt upgrade -y
clear

#Install #######################################################################

echo -e "\033[1;34mInstallation des progammes :"
echo -e "\033[0;0m----------------------------"
echo

#Fonction ######################################################################

function Install()
{
  arr=("$@")
  for prog in "${arr[@]}"; do
  	echo -e "\033[1;32mInstallation de :" $(basename $prog)
	echo -e "\033[0;0m"
	apt install -y $(basename $prog) ; echo
  done
}

#Liste des programmes ##########################################################

Programmes="gparted hardinfo ffmpegthumbnailer
	deja-dup system-config-printer bleachbit gnome-disk-utils
	chromium-browser chromium-browser-l10n xterm grsync"

Programmes_Hacking="binwalk cewl foremost gobuster hashcat hcxtools hcxdumptool hydra john lynis nmap sherlock wifite wireshark libimage-exiftool-perl binutils"

Programmes_Console="ansiweather bat bmon dfc duf ethstatus ethtool fbi htop irssi inxi lm-sensors ncdu neofetch mc nmon oping ranger rsync slurm smartmontools tmux tldr wavemon w3m w3m-img"

Programmes_Internet="filezilla firefox iptraffic tnftp transmission hexchat" #rtorrent

Programmes_Musique="cava cmus moc audacious vlc"

Games="bastet bsdgames bsdgames-nonfree burgerspace cavezofphear cmatrix freesweep frozen-bubble gnome-games lbreakout2 netris nettoe ninvaders nsnake xboard"

Admin="clamav fail2ban firewalld hddtemp iperf3 nethogs nload ptyxis lnav tldr testdisk vnstat vnstati" #samba apache2

Programmes_Dev="gcc geany ipython3 nano python3-numpy python3-matplotlib" #mu-editor

#Questionnaire #################################################################

printf "Voulez-vous installer la liste des programmes \e[35mcourants\e[0m (Oui/Non) : " ; read -r reponse
printf "Voulez-vous installer la liste des programmes de \e[35mconsoles\e[0m (Oui/Non) : " ; read -r reponse1
printf "Voulez-vous installer la liste des programmes \e[35mInternet\e[0m (Oui/Non) : " ; read -r reponse2
printf "Voulez-vous installer la liste des programmes \e[35mMusique Console\e[0m (Oui/Non) : " ; read -r reponse3
printf "Voulez-vous installer la liste des programmes \e[35mAdministration\e[0m (Oui/Non) : " ; read -r reponse4
printf "Voulez-vous installer la liste des programmes de \e[35mDeveloppement\e[0m (Oui/Non) : " ; read -r reponse5
printf "Voulez-vous installer la liste des \e[35mjeux\e[0m (Oui/Non) : " ; read -r reponse6
printf "Voulez-vous installer la liste des programmes de \e[35mHacking\e[0m (Oui/Non) : " ; read -r reponse7

#Installation ##################################################################

if [[ $reponse =~ ^([oO][uU][iI]|[oO])$ ]]
then
	Install ${Programmes[@]}
fi

if [[ $reponse1 =~ ^([oO][uU][iI]|[oO])$ ]]
then
	Install ${Programmes_Console[@]}
fi

if [[ $reponse2 =~ ^([oO][uU][iI]|[oO])$ ]]
then
	Install ${Programmes_Internet[@]}
fi

if [[ $reponse3 =~ ^([oO][uU][iI]|[oO])$ ]]
then
	Install ${Programmes_Musique[@]}
fi

if [[ $reponse4 =~ ^([oO][uU][iI]|[oO])$ ]]
then
	Install ${Admin[@]}
fi

if [[ $reponse5 =~ ^([oO][uU][iI]|[oO])$ ]]
then
	Install ${Programmes_Dev[@]}
fi

if [[ $reponse6 =~ ^([oO][uU][iI]|[oO])$ ]]
then
	Install ${Games[@]}
fi

if [[ $reponse7 =~ ^([oO][uU][iI]|[oO])$ ]]
then
	Install ${Programmes_Hacking[@]}
fi

#Nettoyage #####################################################################

echo -e "\033[1;34mNettoyage du cache des paquets...\033[0m"
apt clean
echo -e "\033[1;34mSupression des paquets devenus inutiles...\033[0m"
apt autoremove -y
echo -e "\033[1;32mLe système est à jour. :)\033[0m"
