#!/bin/bash

Phrase="Debian GNU/Linux"

for letter in $Phrase
do
  echo $letter | tr '[:lower:]' '[:upper:]'
  sleep 1
done

for i in {1..5} ; do
  #STR="This is a Test"
  STR="Debian10Buster"
  for L in $(seq 1 ${#STR}); do
      if [[ $STR == [A-Z] ]]; then
        echo -n $(echo $STR | cut -c$L | tr '[:upper:]' '[:lower:]' )
        sleep 0.2
      else
        echo -n $(echo $STR | cut -c$L | tr '[:lower:]' '[:upper:]' )
        sleep 0.2
      fi
  done
  echo -ne "\r\033[K"
done
echo

#$ name='test'
#$ echo $name
#$ echo ${name^} > Test
#$ echo ${name^^} > TEST

#2 To actually clear the line for the new text, you can add \033[K after the \r:

STR="debian10buster"
for i in {1..5} ; do
  for L in $(seq 1 ${#STR}); do
    echo -n $(echo $STR | cut -c$L)
    sleep 0.2
  done
  echo -ne "\r\033[K"
  if [[ $STR == [a*-z*] ]]; then
    STR=${STR^^}
  else
    STR="debian10buster"
  fi
  echo $STR
done
echo
