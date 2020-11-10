#!/bin/bash

Phrase="Debian GNU/Linux"

for letter in $Phrase
do
  echo $letter | tr '[:lower:]' '[:upper:]'
  sleep 1
done

STR="This is a Test"
for L in $(seq 1 ${#STR}); do
    echo $(echo $STR | cut -c$L | tr '[:lower:]' '[:upper:]' )
    sleep 0.5
done
