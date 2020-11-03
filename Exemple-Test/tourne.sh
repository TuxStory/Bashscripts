#!/bin/bash

#Cache le curseur
tput civis

for j in {1..20}
do
  for i in "/" "-" "\\" "|"
  do
    echo -n $i "Processing ..."
    sleep 0.1
    echo -ne "\r"
  done
done

#Active le curseur
tput cvvis

echo -e "\r"
echo "Done"
