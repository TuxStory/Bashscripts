#!/bin/bash

# Variables
LOCAL_DIR="/chemin/vers/local"          # Répertoire local à synchroniser
REMOTE_USER="utilisateur"                # Nom d'utilisateur sur le serveur distant
REMOTE_HOST="serveur.distant.com"        # Adresse du serveur distant
REMOTE_DIR="/chemin/vers/distant"        # Répertoire distant où synchroniser les fichiers

# Commande rsync
rsync -avz --delete -e "ssh -p 22" "$LOCAL_DIR/" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"

# Vérification du statut de la commande
if [ $? -eq 0 ]; then
    echo "Synchronisation réussie de $LOCAL_DIR vers $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"
else
    echo "Erreur lors de la synchronisation."
fi
