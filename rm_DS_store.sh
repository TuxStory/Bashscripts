#!/bin/bash

# Fonction pour supprimer tous les fichiers .DS_Store
delete_ds_store() {
    # Utilisation de la commande `find` pour rechercher et supprimer les fichiers .DS_Store
    find / -type f -name ".DS_Store" -print -exec rm -f {} \;
    echo "Tous les fichiers .DS_Store ont été supprimés."
}

# Si aucun argument n'est passé, on supprime à partir du répertoire actuel
if [ -z "$1" ]; then
    delete_ds_store .
else
    delete_ds_store "$1"
fi

#Need to be corected
