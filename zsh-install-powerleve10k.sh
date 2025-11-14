#!/bin/bash #chatgpt test

# Script pour installer Zsh et Powerlevel10k

# Mettre à jour les paquets
echo "Mise à jour des paquets..."
sudo apt update && sudo apt upgrade -y

# Installer Zsh si ce n'est pas déjà fait
echo "Installation de Zsh..."
sudo apt install zsh -y

# Vérifier si Zsh est installé
if ! command -v zsh &> /dev/null
then
    echo "Zsh n'a pas pu être installé. Abandon..."
    exit 1
fi

# Changer le shell par défaut pour Zsh
echo "Changement du shell par défaut à Zsh..."
chsh -s $(which zsh)

# Installer Oh My Zsh
echo "Installation de Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Cloner le thème Powerlevel10k dans le répertoire des plugins d'Oh My Zsh
echo "Installation du thème Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Modifier le fichier de configuration .zshrc pour utiliser Powerlevel10k
echo "Configuration de Zsh pour utiliser Powerlevel10k..."
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k/powerlevel10k"/g' ~/.zshrc

# Vérifier si les dépendances de Powerlevel10k sont installées (fonts)
echo "Vérification des polices nécessaires à Powerlevel10k..."
sudo apt install fonts-powerline -y

# Recharger le fichier .zshrc
echo "Rechargement de .zshrc..."
source ~/.zshrc

# Affichage de message final
echo "Installation terminée ! Fermez et rouvrez votre terminal ou tapez 'zsh' pour voir le résultat."

# Lancer Zsh (si l'utilisateur veut directement passer à Zsh)
zsh
