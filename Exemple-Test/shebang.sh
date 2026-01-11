#!/bin/sh
if [ -x /bin/bash ]; then
    exec /bin/bash "$0" "$@"
elif [ -x /bin/zsh ]; then
    exec /bin/zsh "$0" "$@"
fi

#Copier-coller la commmande dans le terminal
P=(' ' █ ░ ▒ ▓);while :;do printf "\e[$[RANDOM%LINES+1];$[RANDOM%COLUMNS+1]f${P[$RANDOM%5]}";done

#fonctionne pas merci chatgpt
