#!/bin/bash

###################################
# Script : install-ohmybash.sh    #
# Auteur : Tuxstory@instagram.com #
# Date C : 18/10/2024             #
# Date M : 26/10/2024             #
###################################

Version="0.0.9"

############### Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m
RED='\033[0;91m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'

check_powerline_fonts() {
  if [ -e "/usr/share/fonts/truetype/PowerlineSymbols.otf" ] || [ -e "/usr/share/fonts/opentype/PowerlineSymbols.otf" ]; then
      echo -e "\n${GREEN}>>>>${WHITE} Fonts-powerline est installé."
  else
      echo -e "\n${RED}>>>>${WHITE} Veulliez installer fonts-powerline."
      echo -e "\n${RED}>>>>${WHITE} RPM base distro : install epel-release."
  fi
}

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
check_powerline_fonts
#if [ ! -d /usr/share/powerline ] ; then
#echo -e "\n${RED}>>>>${WHITE} Veulliez installer les fonts-powerline."
#exit 1
#fi

#Theme
echo -e "\n${GREEN}>>>>${WHITE} Themes préférés : powerline-icon / agnoster / powerline."
#Execution du script
echo -e "\n${GREEN}>>>>${WHITE} Installation de Oh-My-Bash."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

if [ $? -ne 0 ]; then
echo -e "\n${GREEN}>>>>${WHITE} Installation terminé."
fi

#Autre solution pour verifier si POWERLINE est installé (moi je ne veux que les fonts)
#check_powerline_fonts() {
#    if command -v powerline-daemon &> /dev/null; then
#        echo "powerline-fonts est installé."
#    else
#        echo "powerline-fonts n'est pas installé."
#    fi
#}

