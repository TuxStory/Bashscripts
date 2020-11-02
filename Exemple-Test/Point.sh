#!/bin/bash

for ((i=O; i<=20 ; i++))
do
  for ((j=0; j<=20 ; j++))
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
printf "\n"
