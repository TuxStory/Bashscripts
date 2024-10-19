#!/bin/bash

###################################
# Script : install-ohmybash.sh    #
# Auteur : Tuxstory@instagram.com #
# Date C : 18/10/2024             #
# Date M : 20/10/2024             #
###################################

Version="0.0.3"

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
echo -e "\n${RED}>>>>${WHITE} Veulliez installer fonts-powerline."
exit 1
fi

echo -e "\n${GREEN}>>>>${WHITE} Installation de Oh-My-Bash."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

if [ $? -ne 0 ]; then
echo -e "\n${GREEN}>>>>${WHITE} Installation terminé."
#Theme in .bashrc theme="powerline-icons"
fi
