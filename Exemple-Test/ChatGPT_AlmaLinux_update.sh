#!/bin/bash

# Script de mise à jour et d'installation de programmes pour AlmaLinux

# Fichier de log
LOG_FILE="update_install.log"

# Fonction pour écrire dans le fichier de log
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

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

echo "Démarrage du script de mise à jour et d'installation..." | tee -a "$LOG_FILE"
log "Démarrage du script de mise à jour et d'installation..."

# Demander à l'utilisateur s'il souhaite mettre à jour le système
while true; do
    read -p "Souhaitez-vous mettre à jour le système ? (oui/non) : " UPDATE_OPTION
    case $UPDATE_OPTION in
        oui ) 
            echo "Mise à jour du système en cours..." | tee -a "$LOG_FILE"
            sudo dnf check-update | tee -a "$LOG_FILE"
            sudo dnf -y upgrade | tee -a "$LOG_FILE"
            log "Mise à jour du système terminée."
            break
            ;;
        non ) 
            echo "Aucune mise à jour du système effectuée." | tee -a "$LOG_FILE"
            log "Aucune mise à jour du système effectuée."
            break
            ;;
        * ) 
            echo "Veuillez répondre par 'oui' ou 'non'." | tee -a "$LOG_FILE"
            ;;
    esac
done

# Afficher la liste des paquets à installer
echo "Les paquets suivants seront installés :" | tee -a "$LOG_FILE"
for PROGRAM in "${PROGRAMS[@]}"; do
    echo "- $PROGRAM" | tee -a "$LOG_FILE"
done

# Demander à l'utilisateur s'il souhaite installer les paquets supplémentaires
while true; do
    read -p "Souhaitez-vous installer les paquets supplémentaires ? (oui/non) : " INSTALL_OPTION
    case $INSTALL_OPTION in
        oui ) 
            # Installer les programmes de la liste
            for PROGRAM in "${PROGRAMS[@]}"; do
                echo "Installation de $PROGRAM..." | tee -a "$LOG_FILE"
                if sudo dnf install -y "$PROGRAM" >> "$LOG_FILE" 2>&1; then
                    echo "$PROGRAM installé avec succès." | tee -a "$LOG_FILE"
                    log "$PROGRAM installé avec succès."
                else
                    echo "Erreur lors de l'installation de $PROGRAM." | tee -a "$LOG_FILE"
                    log "Erreur lors de l'installation de $PROGRAM."
                fi
            done
            break
            ;;
        non ) 
            echo "Aucun paquet supplémentaire ne sera installé." | tee -a "$LOG_FILE"
            log "Aucun paquet supplémentaire ne sera installé."
            break
            ;;
        * ) 
            echo "Veuillez répondre par 'oui' ou 'non'." | tee -a "$LOG_FILE"
            ;;
    esac
done

# Nettoyer les paquets inutilisés
sudo dnf autoremove -y | tee -a "$LOG_FILE"

echo "Script terminé." | tee -a "$LOG_FILE"
log "Script terminé."
