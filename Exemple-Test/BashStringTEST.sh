#!/bin/bash

# Test su les chaînes de caractères.
# Date 10/12/20
 
name='World'
text='Hello $name' #La variable ne sera pas interprétée
text2="Hello $name" #La variable sera interprétée

str=`ls -a` #Commande exécutée -> ` = alt+`
#Moi je fais comme ceci str=$(ls -a)

echo $text
echo $text2
echo $str

echo ${text2} #Permet de faire des opérations sur la chaîne.
echo ${#text2} #Affiche la longueur du texte.
echo ${text2,} #Premier caractère en Minuscule.
echo ${text2,,} #Totalité de la chaîne en minuscule.
echo ${text2,,[W]} #recherche seulement les W.
echo ${text2^^} #Totalité de la chaîne en Majuscule.
echo ${text2:6} #Extraire la sous-chaîne
echo ${text2:0:5} #Extraire à partir du 0 à 5.
echo ${text2/l/k} #Remplace occurrence l par K.
echo ${text2//l/k} #Remplace toutes les occurrences de l par k.
echo ${text2/#H/V} #Remplace le H en début de chaîne par V.
echo ${text2/%!/_} #Remplace le ! par _ , %=fin de chaîne.
echo ${text2//l/} #Remplace tous les l par rien, efface tous les l.
echo ${text2#H*o} #Suppression de l'intervale entre H et o.
echo ${text2##H*o} #Suppression de l'intervale entre H et o (le plus grand).
echo "${text2:0:5}   ${#text2}" #Tout ce qui est entre " est interpreté (space)
echo "${text2:0:4}i${text2:5}" #remplace le caractère o par i.

