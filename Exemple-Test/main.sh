#!/bin/bash

#source 'array.sh' #execute tout le code du fichier

function test() {
    echo "fonction 1"
}

function test2() {
    echo "Bonjour $1"
}

function main () {
    test
    test2 "Antoine"
}

main
echo ${names[@]}
