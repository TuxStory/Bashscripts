#!/bin/bash
#fais avec chatgpt - à corriger -

echo "==== Installation de Wifite2 pour Fedora 42 ===="

# Vérifie si le script est exécuté avec sudo
if [ "$EUID" -ne 0 ]; then
  echo "❌ Veuillez exécuter ce script avec sudo."
  exit 1
fi

echo "👉 Mise à jour des dépôts..."
dnf update -y

echo "👉 Installation des dépendances..."
dnf install -y git python3 python3-pip aircrack-ng iw tshark reaver bully cowpatty

echo "👉 Clonage du dépôt Wifite2..."
cd /opt || exit 1
git clone https://github.com/derv82/wifite2.git
cd wifite2 || exit 1

echo "👉 Création d’un lien symbolique dans /usr/local/bin (optionnel)..."
ln -sf /opt/wifite2/Wifite.py /usr/local/bin/wifite2
chmod +x /opt/wifite2/Wifite.py

echo "✅ Installation terminée."
echo "Tu peux maintenant lancer Wifite2 avec : sudo wifite2"
