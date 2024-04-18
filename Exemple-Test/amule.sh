#!/bin/bash

for i in {1..10}
do
echo "N° de Boucle" $i
amule &
echo "Etape 1 Amule [OK]"
sleep 2m
echo "Etape 2 Sleep [OK]"
killall amule
echo "Etape 3 Kill  [OK]"
sleep 10
done
