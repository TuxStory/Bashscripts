#!/bin/bash

############### Couleurs
GREEN='\033[1;32m'
WHITE='\033[1;0m' #real white \033[1;37m
RED='\033[0;91m'

############### Programme
website=('www.google.be' 'www.yahoo.fr' 'www.distrowatch.com' 'www.debian.org' 'www.instagram.com' 'www.twitter.com' )

for site in "${website[@]}"; do
  ping -c1 $site > /dev/null 2>&1
  RESULT=$?
  if [ $RESULT -eq 0 ]; then
    #echo -e "$site : status [${GREEN} online ${WHITE}]"
    printf "%-20s status >>> [ Online ]\n" $site
  else
    #echo -e "$site : status [${RED} offline ${WHITE}]"
    printf "%-20s status >>> [ Offline ]\n" $site
  fi
done
