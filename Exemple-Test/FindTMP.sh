#!/bin/bash

# Recherche des fichiers .tmp dans tout le système
echo "Recherche des fichiers .tmp dans le système de fichiers..."
TMP_FILES=$(find / -type f -name "*.tmp" 2>/dev/null)

# Vérifie si des fichiers .tmp ont été trouvés
if [ -z "$TMP_FILES" ]; then
    echo "Aucun fichier .tmp trouvé dans le système."
else
    echo "Fichiers .tmp trouvés :"
    echo "$TMP_FILES"

    # Demande confirmation avant de supprimer
    read -p "Voulez-vous supprimer ces fichiers ? (o/n) : " CONFIRMATION
    if [[ "$CONFIRMATION" == "o" || "$CONFIRMATION" == "O" ]]; then
        # Suppression des fichiers .tmp
        echo "$TMP_FILES" | xargs rm -f
        echo "Tous les fichiers .tmp ont été supprimés."
    else
        echo "Aucune suppression effectuée."
    fi
fi
