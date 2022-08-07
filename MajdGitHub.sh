#!/bin/bash

################################
# Auteur	: Antoine Even #
# Nom		: MajdGitHub   #
# Date		: 18/10/2020   #
# Revision	: 07/08/2022   #
# Version	: 0.2	       #
################################

cd ../
for d in */ ; do
  echo -e "\033[01;32m>>> \033[00m$d "
  cd "$d" || exit ; git pull
  cd ../
done
