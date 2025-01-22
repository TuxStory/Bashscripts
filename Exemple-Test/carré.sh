#!/bin/bash

# Fonction pour calculer le carré d'un nombre
carre() {
    local nombre=$1
    echo $((nombre * nombre))
}

# Boucle pour calculer le carré des nombres de 1 à 10
for i in {1..30}; do
    resultat=$(carre $i)
    echo "Le carré de $i est $resultat"
done
