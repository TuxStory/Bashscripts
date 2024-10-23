#!/bin/bash

###################################
# Script : install-ohmybash.sh    #
# Auteur : Tuxstory@instagram.com #
# Date C : 18/10/2024             #
# Date M : 23/10/2024             #
###################################

Version="0.0.6"

############### Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m
RED='\033[0;91m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'

# curl
if [ ! -x /usr/bin/curl ] ; then
echo -e "\n${RED}>>>>${WHITE} Le logiciel curl est manquant, veulliez l'installer."
exit 1
fi

#git
if [ ! -x /usr/bin/git ] ; then
echo -e "\n${RED}>>>>${WHITE} git est manquant, veulliez l'installer."
exit 1
fi

#fonts-powerline
if [ ! -d /usr/share/powerline ] ; then
echo -e "\n${RED}>>>>${WHITE} Veulliez installer les fonts-powerline."
exit 1
fi

#echo -e "\n${GREEN}>>>>${WHITE} Installation de PowerlineSymbols."
#wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
#sudo mv PowerlineSymbols.otf /usr/share/fonts/
#sudo fc-cache -vf
#sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

echo -e "\n${GREEN}>>>>${WHITE} Installation de Oh-My-Bash."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

if [ $? -ne 0 ]; then
echo -e "\n${GREEN}>>>>${WHITE} Installation terminé."
#Theme in .bashrc theme="powerline-icons"
fi
