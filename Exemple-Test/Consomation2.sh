#!/bin/bash

# Vérifie si powertop est installé
if ! command -v powertop &> /dev/null
then
    echo "powertop n'est pas installé. Veuillez l'installer avec : sudo apt install powertop"
    exit 1
fi

# Génère un rapport de consommation d'énergie
echo "Génération du rapport de consommation d'énergie..."
sudo powertop --html=rapport_powertop.html

# Affiche un message de confirmation
echo "Le rapport a été généré : rapport_powertop.html"
