#!/bin/bash

A=10
NOM="Antoine"

echo "Hello World ! This is Source.sh"

function carre(){
  A=$(($1 * $1))
  return $A
}

carre $A
echo $A
