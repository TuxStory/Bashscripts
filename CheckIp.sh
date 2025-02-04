#!/bin/bash

#Version 0.2
#Example printf color+columnw
#printf '%-6s' "\e[1;34mThis is text\e[0m"

############### Couleurs #### not in use
GREEN='\033[1;32m'
WHITE='\033[1;0m' # real white \033[1;37m
RED='\033[0;91m'

############### Script
declare -a ip_array

############### Remplissage du tableau avec les adresses IP
for i in {1..255}; do
    ip_array+=("192.168.1.$i")
done

############### Vérification des IPs
for address in "${ip_array[@]}"; do
  ping -c1 $address > /dev/null 2>&1
  RESULT=$?
  if [ $RESULT -eq 0 ]; then
    printf "%-20s status >>> [\e[1;32m Online \e[0m]\n" $address
  else
    printf "%-20s status >>> [\e[1;91m Offline \e[0m]\n" $address
  fi
done
