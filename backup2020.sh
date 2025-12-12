#!/bin/bash

########################
# scrpit de backup !   #
# 2007 - 2020 ver 0.7  #
# Auth - Antoine Even  #
########################

# Déclarations de quelques variables.
files="
/etc/fstab
/etc/default/grub
/etc/apt/sources.list
/etc/ssh/sshd_config
/etc/fail2ban/fail2ban.conf
/etc/fail2ban/jail.conf
/etc/fail2ban/jail.local
/etc/samba/smb.conf
/etc/updatedb.conf
/etc/apache2/apache2.conf
/home/$USER/.vimrc
/home/$USER/.nanorc
/home/$USER/.tmux.conf
/home/$USER/.bashrc
"

clear

# Création du dossier de sauvegarde
if [ ! -d "$HOME/Backup" ]; then
    echo "$HOME/Backup n'existe pas !"
    echo "Création du répertoire."
    mkdir "$HOME/Backup"
else
    echo "Le répertoire $HOME/Backup existe."
fi

# Création du sous-répertoire avec la date
jour=$(date +%d-%m-%y)
if [ ! -d "$HOME/Backup/$jour" ]; then
    echo "$HOME/Backup/$jour n'existe pas !"
    echo "Création du sous répertoire $jour."
    mkdir "$HOME/Backup/$jour"
else
    echo "Le répertoire $HOME/Backup/$jour existe."
    echo -n "Voulez-vous ecraser les fichiers ? (o/n) "
    read reponse
    case $reponse in
   'o')
    echo "Les fichiers vont être écrasés !"    ;;
   'n')
    exit   ;;
   *)
    echo "Relancez le script !"
    exit    ;;
    esac
fi

# Sauvegarde des fichiers
echo "Sauvegarde des fichiers."

for f in $files; do
    echo -n "Copie du fichier $(basename $f)"
    if [ ! -f "$f" ]; then
        echo -e " 		[\033[1;31mfalse\033[0m]"
    else
        cp "$f" "$HOME/Backup/$jour"
        echo -e " 		[\033[1;32mok\033[0m]"
    fi
done
