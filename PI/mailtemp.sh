#!/bin/bash

./temp.sh > fichier.txt
echo >> fichier.txt
uptime -p >> fichier.txt
echo >> fichier.txt
dfc >> fichier.txt
echo >> fichier.txt
vnstat -d >> fichier.txt
echo >> fichier.txt
ansiweather -l Grez-Doiceau -F -a True >> fichier.txt

swaks -t serverpimail@gmail.com --h-Subject "Rapport du système" --body "Rapport du système" --attach fichier.txt
echo "Mail sent!"
#cat fichier.temp | mail -s "Temperature & Espace" antoine.even@gmail.com
rm fichier.txt
