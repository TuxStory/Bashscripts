#!/bin/bash

./temp.sh > fichier.temp
echo >> fichier.temp
uptime -p >> fichier.temp
echo >> fichier.temp
dfc >> fichier.temp
echo >> fichier.temp
vnstat -d >> fichier.temp
echo >> fichier.temp
ansiweather -l Grez-Doiceau -F -a True >> fichier.temp

cat fichier.temp | mail -s "Temperature & Espace" antoine.even@gmail.com
rm fichier.temp
