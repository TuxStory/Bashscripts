#! /bin/bash
#Script Adrien LinuxTricks

# Chemin du dictionnaire
#DICT="/usr/share/hunspell/fr-moderne.dic" #Pas dispo chez moi
DICT="/usr/share/hunspell/fr.dic"

# Calcul du nb de lignes du fichier
NBLIGNES=$(grep -c -E '^' $DICT)

# Génération d'un nb aléatoire
ALEA=$(shuf -i 1-$NBLIGNES -n 1)

# Sélection de la ligne concernée
MOT=$(head -n $ALEA $DICT | tail -1)

# Epuration des caractères bizarres
MOT=$(echo $MOT | cut -d '/' -f 1)
MOT=$(echo $MOT | awk '{print $1}')

# Affichage du mot sur la console
echo $MOT
