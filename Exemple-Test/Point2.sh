#!/bin/bash

#Cache le curseur
tput civis

for a in {0..5}
do
  for i in {0..10} {10..0}
  do
    for j in {0..10} {10..0}
      do
      if [ $j -eq $i ] ; then
        echo -n "o " #+1 espace pour effacer le poit precedent au retour.
        sleep 0.05
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
