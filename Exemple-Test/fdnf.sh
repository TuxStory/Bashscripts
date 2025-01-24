#!/bin/bash

# Fonction pour vérifier si un fichier existe
verifier_fichier() {
    dnf info $1
}

# Appel de la fonction avec un nom de fichier
Programme=('htop' 'btop' 'inxi' 'nmon' 'nano' 'fastfech' 'cava')
for soft in ${Programme[@]} ;do
  verifier_fichier $soft
done
