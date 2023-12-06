#!/bin/bash

#Version 1.1
#Example printf color+columnw
#printf '%-6s' "\e[1;34mThis is text\e[0m"

############### Couleurs #### not in use
GREEN='\033[1;32m'
WHITE='\033[1;0m' # real white \033[1;37m
RED='\033[0;91m'

############### Programme
website=('www.google.be' 'smtp.gmail.com' 'www.amazon.com.be' 'www.duckduckgo.com' 'www.distrowatch.com' 'www.debian.org' 'www.instagram.com' 'www.twitter.com' 'www.amazon.com.be' )

for site in "${website[@]}"; do
  ping -c1 $site > /dev/null 2>&1
  RESULT=$?
  if [ $RESULT -eq 0 ]; then
    printf "%-20s status >>> [\e[1;32m Online \e[0m]\n" $site
  else
    printf "%-20s status >>> [\e[1;91m Offline \e[0m]\n" $site
  fi
done
