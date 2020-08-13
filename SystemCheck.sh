#!/bin/bash

#Variable
Ver="0.0.0"

#root acces
EACCES=13 # Permission denied

if [ "$UID" -ne 0 ]; then # Vous êtes ROOT
  echo "Permission denied : you must be root."
  exit $EACCES
fi


clear
echo "=================================================================="
echo -e "			System Check				"
echo "=================================================================="
echo
echo -n "UPTIME : ";  uptime -p
echo "Journalctl Disk Usage : "; journalctl --disk-usage
echo
echo "--------------------------- who ---------------------------------"
who
#echo "---------------------------- w ----------------------------------"
#w
echo "-------------------------- last ---------------------------------"
last | head
#echo "-----------------------------------------------------------------"
#blast

echo "-------------------------- Login  --------------------------------"
if [ -e /etc/debian_version ]
then
	tail -n 20 /var/log/auth.log
else
	#echo "--------------------- Acces aux fichier ------------------------"
	#lsof +D /home/$USER/
	echo "---------------------------- Login -------------------------------"
	#Fedora pas de /var/log/auth.log
	journalctl -q _AUDIT_TYPE=1112 _TRANSPORT=audit | grep USER_LOGIN --color
	echo "------------------------- Login failed ---------------------------"
	journalctl -q _AUDIT_TYPE=1112 _TRANSPORT=audit | grep failed --color
	echo "------------------------- ssh Login --------------------------------"
	journalctl -q _AUDIT_TYPE=1112 _TRANSPORT=audit | grep sshd --color
fi

echo "------------------ Connection Reseau active ---------------------"
lsof -i
#echo "------------ processus qui écoutent sur le port 80 --------------"
#sudo lsof -nP -i tcp:80 | grep LISTEN
#lsof -nP -i tcp:80
