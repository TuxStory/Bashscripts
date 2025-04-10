#!/bin/bash

###################################
# Script : zsh-install-config.sh  #
# Auteur : Tuxstory@instagram.com #
# Date C : 10/03/2024             #
# Date M : 19/10/2024             #
###################################

Version="0.1.0"

############### Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m
RED='\033[0;91m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'

#verification de curl et zsh et git
if [ ! -x /usr/bin/curl ] ; then
echo -e "\n${RED}>>>>${WHITE} Le logiciel curl est manquant, veulliez l'installer."
exit 1
fi

if [ ! -x /usr/bin/zsh ] ; then
echo -e "\n${RED}>>>>${WHITE} zsh n'est pas présent, veulliez l'installer."
exit 1
fi

if [ ! -x /usr/bin/git ] ; then
echo -e "\n${RED}>>>>${WHITE} git est manquant, veulliez l'installer."
exit 1
fi

#fonts-powerline
if [ ! -d /usr/share/powerline ] ; then
echo -e "\n${RED}>>>>${WHITE} Veulliez installer fonts-powerline."
exit 1
fi

#Set Zsh as default shell
#chsh -s /usr/bin/zsh
echo -e "\n${GREEN}>>>>${WHITE} Pour changer le shell par défaut-> chsh -s /usr/bin/zsh"
echo "Votre shell par défaut est : " $SHELL

#Lancement du script officiel de oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh/ ] ; then
echo "Le dossier oh-my-zsh n'a pas été trouvé."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" #curl
fi

#installation des fonts
echo -e "\n${GREEN}>>>>${WHITE} Installation des fonts nécessaires ..."
sudo cp Config/*.ttf /usr/share/fonts
echo -e "\n${GREEN} Copie des fonts nécessaires [ OK ] ${WHITE}"
echo -e "\n${RED}>>>>${WHITE} Veulliez changer les fonts du terminal."

#installer powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo -e "\n${GREEN}>>>>${WHITE} Changer le thème dans le fichier .zshrc -> ZSH_THEME=\"powerlevel10k/powerlevel10k\" "

#configuration de p10k
p10k configure

#Ajout du script d'autosugestion.
echo -e "\n${GREEN}>>>>${WHITE} Installation du plugins zsh-autosuggestions."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

#plugins
echo -e "\n${RED}>>>>${WHITE} Ajouter la ligne zsh-autosuggestions dans .zshrc"
echo -e "plugins=(git \n history \n zsh-autosuggestions \n)"
