#!/bin/bash

#Cache le curseur
tput civis

for ((l=0 ; l<3; l++))
do
  for i in {0..20} {20..0}
  do
    for j in {0..20}
      do
      if [ $j -eq $i ] ; then
        echo -n ". " #+1 espace pour effacer le poit precedent au retour.
        sleep 0.1
        #echo $i $j
      else
        echo -n " "
      fi
      done
      echo -ne "\r"
  done
done

#Active le curseur
tput cvvis
