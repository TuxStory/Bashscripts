#!/bin/bash

#####################################
# Scrpit Debian Post-Installation   #
# 07/08/2022 ver 0.9                #
# Antoine Even                      #
#####################################

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

#Backports #####################################################################

echo -e "\033[1;34mAjout dépôts Backports :"
echo -e "\033[0;0m-------------------------"

echo "#Backports" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian bullseye-backports main contrib non-free" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian bullseye-backports main contrib non-free" >> /etc/apt/sources.list

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

#Liste des programmes. #########################################################

Programmes="dfc audacious gparted inxi neofetch htop hardinfo hexchat vlc ffmpegthumbnailer
	deja-dup system-config-printer bleachbit gnome-disk-utils
	chromium-browser chromium-browser-l10n xterm rsync grsync"

Programmes_Console="ranger ansiweather irssi fbi mc cmus oping w3m w3m-img bmon ncdu slurm"

Programmes_Internet="filezilla tnftp rtorrent iptraffic transmission amule"

Games="ntetris nsnake cavezofphear bsdgames bsdgames-nonfree cmatrix freesweep bastet nettoe ninvaders frozen-bubble gnome-games xboard lbreakout2 burgerspace"

Admin="fail2ban firewalld samba nmon wavemon nload vnstat vnstati testdisk iperf3 hddtemp lnav tmux lm-sensors glances nethogs smartmontools"

Programmes_Dev="gcc git geany nano mu-editor python3-numpy python3-matplotlib ipython3"

#Questionnaire. ################################################################

printf "Voulez-vous installer la liste des programmes \e[35mcourants\e[0m: (Oui/Non) " ; read -r reponse
printf "Voulez-vous installer la liste des programmes \e[35mconsoles\e[0m: (Oui/Non) " ; read -r reponse1
printf "Voulez-vous installer la liste des programmes \e[35mInternet\e[0m: (Oui/Non) " ; read -r reponse2
printf "Voulez-vous installer la liste des programmes \e[35mAdministration\e[0m: (Oui/Non) " ; read -r reponse3
printf "Voulez-vous installer la liste des programmes \e[35mDeveloppement\e[0m: (Oui/Non) " ; read -r reponse4
printf "Voulez-vous installer la liste des \e[35mjeux\e[0m: (Oui/Non) " ; read -r reponse5

# Installation #################################################################

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

# Nettoyage ####################################################################

echo -e "\033[1;34mapt clean\033[0m"
apt clean
echo -e "\033[1;34mapt autoremove\033[0m"
apt autoremove -y
#echo -e "\033[1;34mupdatedb\033[0m"
#updatedb
echo -e "\033[1;32mLe système est à jour :)\033[0m"
