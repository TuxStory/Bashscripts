#!/bin/bash

A=10

set -x #mode debug
#set +e #continue en cas d'erreur
set -e #Le script s'arrête completement lors dune erreur

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
