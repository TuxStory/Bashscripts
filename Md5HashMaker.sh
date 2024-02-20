#!/bin/bash

###########################
# MD5HashMaker 20/02/2024 #
###########################

for i in {1..10}
do
  read -p "Entrez un mot de passe : "
  echo -n $REPLY | md5sum | tr -d " -"
  echo -n $REPLY | md5sum | tr -d " -" >> /$HOME/HashMD5toCrack.txt
done
