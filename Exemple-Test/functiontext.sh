#!/bin/bash

function text()
{
  local mot=$1
  n=${#mot}
  echo $n
}

read -p "Ecrivez une phrase : " phrase
longueur=$(text "$phrase")
echo "La longueur de la phrase est : $longueur"
