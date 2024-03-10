#!/bash/bin

###################################
# Script : zsh-install-config.sh  #
# Auteur : Tuxstory@instagram.com #
# Date C : 10/03/2024             #
# Date M : 10/02/2024             #
###################################

Version="0.0.2"

############### Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m
RED='\033[0;91m'
BLUE='\033[0;94m'
MAGENTA='\033[0;95m'

#verification de curl et zsh et git
if [ ! -x /usr/bin/curl ] ; then
echo "Le logiciel curl est manquant, veulliez l'installer."

if [ ! -x /usr/bin/zsh ] ; then
echo "zsh n'est pas présent, veulliez l'installer"

if [ ! -x /usr/bin/git ] ; then
echo "git est manquant, veulliez l'installer"

#Set Zsh as default shell
#chsh -s /usr/bin/zsh
echo -e "\n${GREEN}>>>>${WHITE} To set zsh as default shell -> chsh -s /usr/bin/zsh"
echo "Votre shell par défaut est : " $SHELL

#Lancement du script officiel de oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh/ ] ; then
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" #curl
#sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" #wget

#installer les fonts
#fonts-powerline

#installer powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo -e "\n${GREEN}>>>>${WHITE} changer le thème dans le fichier .zshrc -> ZSH_THEME="powerlevel10k/powerlevel10k"

#configuration de p10k
p10k configure

#Ajout du script d'autosugestion.
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

#plugins
