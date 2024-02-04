#!/bin/bash

#################
# version : 1.0 #
#################

# NE FONCTIONNE PLUS 

echo ">>> Vérification des paquets obsolètes."
zypper packages --unneeded | awk -F'|' 'NR==0 || NR==1 || NR==2 || NR==3 || NR==4 {next} {print $3}' | grep -v Name | sudo xargs zypper remove --clean-deps
