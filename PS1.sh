#!/bin/bash

[User] Bleu
[Dir] Mauve
export PS1="\[$(tput setaf 33)\]\u\[$(tput setaf 69)\]@\[$(tput setaf 105)\]\h \[$(tput setaf 141)\]\w \[$(tput sgr0)\]$ "

export PS1="\[\e[38;5;33m\]\u\[\e[38;5;69m\]@\[\e[38;5;105m\]\h \[\e[38;5;141m\]\w \[\033[0m\]$ "

[User] Vert
[Dir] Jaune
export PS1="\[$(tput setaf 34)\]\u\[$(tput setaf 40)\]@\[$(tput setaf 46)\]\h \[$(tput setaf 154)\]\w \[$(tput sgr0)\]$ "

RedHat Heure
export PS1="[\[\e[32m\]\A\[\e[m\]][\u@\h \W] "


export PS1="\[t][\e[38;5;33m\]\u\[\e[38;5;69m\]@\[\e[38;5;105m\]\h \[\e[38;5;141m\]\w \[\033[0m\]$ "