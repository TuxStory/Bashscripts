#!/bin/bash

#####################################
# Scrpit Debian Post-Installation   #
# 19/06/2023 - ver 0.9.1 22/11/2023 #
# Antoine Even                      #
#####################################

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
  echo "Permission denied : you must be root."
exit $EACCES
fi

clear

#Dépots ########################################################################

echo -e "\033[1;34mFichier des dépôts + (backports) :"
echo -e "\033[0;0m----------------------------------"
echo -e "\nVoulez-vous changer le fichier sources.list ? (Oui/Non) :"
read -r depot
if [[ $depot =~ ^([oO][uU][iI]|[oO])$ ]]
then
	mv /etc/apt/sources.list /etc/apt/sources.list.bak
	cp ./Config/sources.list /etc/apt/sources.list
	echo "Fichier sources.list modifié."
fi
sleep 5s
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

Programmes="audacious gparted hardinfo hexchat vlc ffmpegthumbnailer
	deja-dup system-config-printer bleachbit gnome-disk-utils
	chromium-browser chromium-browser-l10n xterm grsync"

Programmes_Console="dfc ranger ansiweather irssi fbi mc inxi rsync neofetch oping w3m w3m-img bmon ncdu slurm duf htop nmon tmux lm-sensors smartmontools wavemon btop"

Programmes_Internet="filezilla tnftp iptraffic transmission firefox" #rtorrent

Programmes_Musique="cmus moc cava"

Games="ntetris nsnake cavezofphear bsdgames bsdgames-nonfree cmatrix freesweep bastet nettoe ninvaders frozen-bubble gnome-games xboard lbreakout2 burgerspace"

Admin="fail2ban firewalld nload vnstat vnstati testdisk iperf3 hddtemp lnav nethogs" #samba apache2

Programmes_Dev="gcc geany nano python3-numpy python3-matplotlib ipython3" #mu-editor

#Questionnaire #################################################################

printf "Voulez-vous installer la liste des programmes \e[35mcourants\e[0m: (Oui/Non) " ; read -r reponse
printf "Voulez-vous installer la liste des programmes \e[35mconsoles\e[0m: (Oui/Non) " ; read -r reponse1
printf "Voulez-vous installer la liste des programmes \e[35mInternet\e[0m: (Oui/Non) " ; read -r reponse2
printf "Voulez-vous installer la liste des programmes \e[35mMusique Console\e[0m: (Oui/Non) " ; read -r reponse3
printf "Voulez-vous installer la liste des programmes \e[35mAdministration\e[0m: (Oui/Non) " ; read -r reponse4
printf "Voulez-vous installer la liste des programmes \e[35mDeveloppement\e[0m: (Oui/Non) " ; read -r reponse5
printf "Voulez-vous installer la liste des \e[35mjeux\e[0m: (Oui/Non) " ; read -r reponse6

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

if [[ $reponse4 =~ ^([oO][uU][iI]|[oO])$ ]]
then
	Install ${Programmes_Dev[@]}
fi

if [[ $reponse5 =~ ^([oO][uU][iI]|[oO])$ ]]
then
	Install ${Games[@]}
fi

#Nettoyage #####################################################################

echo -e "\033[1;34mNettoyage du cache des paquets...\033[0m"
apt clean
echo -e "\033[1;34mSupression des paquets devenus inutiles...\033[0m"
apt autoremove -y
echo -e "\033[1;32mLe système est à jour. :)\033[0m"
