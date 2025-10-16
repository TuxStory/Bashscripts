#!/bin/bash

# Couleurs
RED='\033[0;31m'
NC='\033[0m' # Reset

# Paramètres
WIDTH=20       # Largeur totale du V (doit être paire)
THICKNESS=2    # Épaisseur des bords du V

HEIGHT=$((WIDTH / 2))

echo

for ((i = 0; i < HEIGHT; i++)); do
    for ((j = 0; j < WIDTH; j++)); do
        if (( j >= i && j < i + THICKNESS )) || \
           (( j >= WIDTH - i - THICKNESS && j < WIDTH - i )); then
            echo -ne "${RED}V${NC}"
        else
            echo -n " "
        fi
    done
    echo
done
echo
