#!/bin/bash

tput civis #cache le curseur

for ((k = 0; k <= 10 ; k++))
do
    echo -n "[ "
    for ((i = 0 ; i <= k; i++)); do echo -n "###"; done
    for ((j = i ; j <= 10 ; j++)); do echo -n "   "; done
    v=$((k * 10))
    echo -n " ] "
    echo -n "$v %" $'\r'
    sleep 0.05
done
echo

for ((k = 0; k <= 50 ; k++))
do
    echo -n "[ "
    for ((i = 0 ; i <= k; i++)); do echo -n "#"; done
    for ((j = i ; j <= 50 ; j++)); do echo -n " "; done
    v=$((k * 2)) #x2 pour avoir 100%
    echo -n " ] "
    echo -n "$v %" $'\r'
    sleep 0.05
done
echo

tput cvvis
