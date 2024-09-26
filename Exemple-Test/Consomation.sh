#!/bin/bash

# Vérifie si acpi est installé
if ! command -v acpi &> /dev/null
then
    echo "acpi n'est pas installé. Veuillez l'installer avec : sudo apt install acpi"
    exit 1
fi

# Affiche la consommation électrique
echo "Consommation électrique actuelle :"
acpi -V

# Optionnel : Affiche des informations supplémentaires sur l'état de la batterie
echo "Informations sur la batterie :"
cat /proc/acpi/battery/BAT0/state
