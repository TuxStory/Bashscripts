#!/bin/bash

# Script : emoji_demo.sh
# Affiche une table d'émojis utiles dans les scripts Bash
# Fait avec ChatGPT.

clear

echo -e "================================"
echo -e "🚀 \033[1mDEMO : Émojis utiles en Bash\033[0m"
echo -e "================================\n"

#### Fonction pour afficher une ligne du tableau #########
function print_line() {
  local emoji=$1
  local description=$2
  local example=$3
  printf "  %s  |  %-20s |  %s\n" "$emoji" "$description" "$example"
}

#### En-tête ###########
printf "\033[1m  Emoji | Description           | Exemple Bash\033[0m\n"
echo "--------|------------------------|---------------------------"

#### Lignes du tableau ##########
print_line "✅" "Succès / OK"         'echo -e "✅ Terminé"'
print_line "❌" "Erreur / échec"      'echo -e "❌ Erreur"'
print_line "⚠️" "Avertissement"        'echo -e "⚠️  Attention"'
print_line "🔄" "En cours / boucle"   'echo -e "🔄 Chargement..."'
print_line "🚀" "Lancement / début"   'echo -e "🚀 Démarrage"'
print_line "📦" "Installation"        'echo -e "📦 Installation..."'
print_line "🔧" "Configuration"        'echo -e "🔧 Configuration..."'
print_line "🛠️" "Outils / maintenance" 'echo -e "🛠️  Outils prêts"'
print_line "🧪" "Test / vérification"  'echo -e "🧪 Tests en cours"'
print_line "📂" "Dossier"             'echo -e "📂 /etc/config"'
print_line "🔍" "Recherche"           'echo -e "🔍 Scan..."'
print_line "🗑️" "Suppression"          'echo -e "🗑️  Nettoyage..."'
print_line "🕒" "Attente / temps"     'echo -e "🕒 Patience..."'
print_line "💡" "Astuce / info"       'echo -e "💡 Utilisez -h"'

echo -e "\n🎉 \033[1;32mFin de la démonstration !\033[0m"
echo -e "Tu peux copier les exemples pour tes propres scripts.\n"

