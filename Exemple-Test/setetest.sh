#!/bin/bash

A=10

set +e
#set -e

echo "Hello World !"
error
echo test
echo $A

<<"EXPLICATION"
antoine@Bullseye:~/GitHub/Bashscripts/Exemple-Test$ ./setetest.sh
Hello World !
./setetest.sh: ligne 6: error : commande introuvable
antoine@Bullseye:~/GitHub/Bashscripts/Exemple-Test$ nano setetest.sh
antoine@Bullseye:~/GitHub/Bashscripts/Exemple-Test$ ./setetest.sh
Hello World !
./setetest.sh: ligne 6: error : commande introuvable
test
10
EXPLICATION

: '
comment1comment1
comment2comment2
comment3comment3
comment4comment4
'
