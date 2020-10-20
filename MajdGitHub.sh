#!/bin/bash

################################
# Auteur	: Antoine Even #
# Nom		: MajdGitHub   #
# Date		: 18/10/20202  #
# Revision	: 18/10/2020   #
# Version	: 0.1	       #
################################

cd ../
for d in */ ; do
  echo -e "\033[01;32m>>> \033[00m$d "
  cd $d ; git pull
  cd ../
done
