#!/usr/bin/env bash

# ============================================
# 🔮 METEO.SH — Météo actuelle avec wttr.in
# Affiche la météo actuelle joliment dans le terminal
# Auteur : ChatGPT / OpenAI
# Dépendances : curl
# ============================================

# Vérifie que curl est installé
if ! command -v curl &> /dev/null; then
  echo "❌ Erreur : curl n'est pas installé."
  exit 1
fi

# Ville par défaut
CITY="${1:-Grez-Doiceau}"

# Couleurs
GREEN='\033[1;32m'
CYAN='\033[1;36m'
RED='\033[1;31m'
RESET='\033[0m'

# Entête
echo -e "${CYAN}"
echo "==========================================="
echo "    ☀️  Météo actuelle pour : ${CITY}"
echo "    📅 Date : $(date '+%A %d %B %Y')"
echo "==========================================="
echo -e "${RESET}"

# Appelle wttr.in
curl -s "wttr.in/${CITY}?format=3" | while IFS= read -r line; do
  echo -e "${GREEN}📍 $line${RESET}"
done

echo ""
echo -e "${CYAN}Détails plus riches :${RESET}"
curl -s "wttr.in/${CITY}?0" | sed 's/\x1b\[[0-9;]*m//g'

# Fin
echo -e "${CYAN}===========================================${RESET}"

