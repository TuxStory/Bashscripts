#####################
# TXT & colors Test #
#####################

txUnderline=$(tput smul)
echo "${txUnderline}Underlined Text"

# background color using ANSI escape

bgBlack=$(tput setab 0) # black
bgRed=$(tput setab 1) # red
bgGreen=$(tput setab 2) # green
bgYellow=$(tput setab 3) # yellow
bgBlue=$(tput setab 4) # blue
bgMagenta=$(tput setab 5) # magenta
bgCyan=$(tput setab 6) # cyan
bgWhite=$(tput setab 7) # white

# foreground color using ANSI escape

fgBlack=$(tput setaf 0) # black
fgRed=$(tput setaf 1) # red
fgGreen=$(tput setaf 2) # green
fgYellow=$(tput setaf 3) # yellow
fgBlue=$(tput setaf 4) # blue
fgMagenta=$(tput setaf 5) # magenta
fgCyan=$(tput setaf 6) # cyan
fgWhite=$(tput setaf 7) # white

# text editing options

txBold=$(tput bold)   # bold
txHalf=$(tput dim)    # half-bright
txUnderline=$(tput smul)   # underline
txEndUnder=$(tput rmul)   # exit underline
txReverse=$(tput rev)    # reverse
txStandout=$(tput smso)   # standout
txEndStand=$(tput rmso)   # exit standout
txReset=$(tput sgr0)   # reset attributes

echo "${txBold}Bold"
tput sgr0
echo "${txEndUnder}Text"
tput sgr0
echo "${txReverse}Text"
tput sgr0
echo "${fgGreen}Underlined Text"
tput sgr0
echo "${fgBlue}Blue Test"
tput sgr0
echo "${bgYellow}Yellow Test"
tput sgr0
echo "${bgBlue}Test Blue"
tput sgr0
echo "${fgBlue}Blue Test"
tput sgr0
echo "${txReset} "
echo test
tput sgr0

printf "Your username is %s\n" $USER
echo Your username is $USER

x=hello\ world
for((;n<11;)){
echo -en "\r${x:0:n}"`tr a-z A-Z<<<"${x:n:1}"`"${x:n+++1}"
sleep 0.1
}

echo
echo -e "\033[31mUn texte en rouge,\033[0m la suite ne l'est plus"
echo -e "Un texte en \e[32m\033[43mvert sur fond jaune\E[0m"
echo -e "Et voici \033[31m\033[1m\033[4m\033[5m\033[7mun texte\033[0m mis en forme selon une forme particulièrement peu explicite."

#!/bin/bash
couleurs=(Noir Rouge Vert Jaune Bleu Magenta Cyan Blanc);
for i in $(seq 1 7);
do
  echo -e " $(tput setaf $i)${couleurs[$i]}\tTexte$(tput sgr0)\t$(tput bold)$(tput setaf $i)Texte$(tput sgr0)\t$(tput sgr 0 1)$(tput setaf $i)Texte$(tput sgr0)\t(tput setaf $i)"; 
done

echo

for i in {0..256}
do
  o=00$i
  echo -ne "${o:${#o}-3:3} "$(tput setaf $i;tput setab $i)"   "$(tput sgr0)
done

echo

#https://doc.ubuntu-fr.org/tutoriel/formater_le_texte_dans_le_terminal_avec_tput
