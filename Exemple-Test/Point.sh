#!/bin/bash

#Cache le curseur
tput civis

for ((l=0 ; l<3; l++))
do
  for i in {0..20} {19..0}
  do
    for j in {0..20}
      do
      if [ $j -eq $i ] ; then
        echo -n "."
        sleep 0.1
      else
        echo -n " "
      fi
      done
      echo -ne "\r"
  done
done

#Active le curseur
tput cvvis
