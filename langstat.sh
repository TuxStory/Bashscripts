#!/bin/bash

#################################
# Name 		: langstat.sh	#
# Auteur	: Antoine Even	#
# Date 		: 30/12/2017	#
# Update	: 06/06/2020	#
#################################

# Message d'aide

if [ $# -eq 1 ] && [ $1 == "-h" ]
	then
		echo "utilisation : ./langstat.sh <file> [parametre]"
		echo "-c : colorisation"
		echo "-h : aide"
		exit 1;
fi

# Vérification dictionnaire

if [ ! $# -ge 1 ] || [ ! -e $1 ]
then
	echo "Erreur : Le fichier est itrouvable !"
exit 1
fi

# Boucle de comptage & creation du fichier tmp

for lettre in {{A..Z},{a..Z}}
do
    nombre=`grep $lettre $1 | wc -l`
	if [ $# -ge 2 ] && [ $2 = "-c" ]
	then
		echo -e "$nombre - \033[34m $lettre \033[0m" >> fichier_tmp.txt
	else
		echo -e "$nombre - $lettre" >> fichier_tmp.txt
	fi
done

# Tri du fichier & suppression du fichier tmp
sort -rm fichier_tmp.txt
rm fichier_tmp.txt 







