#!/bin/bash

MAJ()
{
  pkexec apt update && pkexec apt upgrade -y
}

zenity --question --width=200 --title="Debian 10 : updates" --text="\nInstaller les mises à jours"
if [ $? = 0 ] ; then
  #echo "OUI !"
   MAJ | zenity --progress --text "Installation des mises à jours." --auto-close --pulsate --width=300
else
  #echo "NON !"
  exit 1
fi
