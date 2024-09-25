#!/bin/bash

# Script de mise à jour et d'installation de programmes pour AlmaLinux

# Liste des programmes à installer
PROGRAMS=(
    "git"
    "vim"
    "curl"
    "wget"
    "htop"
    "nano"
    "python3"
    "gcc"
)

echo "Démarrage de la mise à jour d'AlmaLinux..."

# Mettre à jour la liste des paquets
sudo dnf check-update

# Mettre à jour tous les paquets installés
sudo dnf -y upgrade

# Demander à l'utilisateur s'il souhaite installer les paquets supplémentaires
read -p "Souhaitez-vous installer les paquets supplémentaires ? (oui/non) : " INSTALL_OPTION

if [[ "$INSTALL_OPTION" == "oui" ]]; then
    # Installer les programmes de la liste
    for PROGRAM in "${PROGRAMS[@]}"; do
        echo "Installation de $PROGRAM..."
        sudo dnf install -y "$PROGRAM"
    done
else
    echo "Aucun paquet supplémentaire ne sera installé."
fi

# Nettoyer les paquets inutilisés
sudo dnf autoremove -y

echo "Mise à jour terminée."
