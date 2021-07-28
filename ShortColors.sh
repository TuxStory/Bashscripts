#! /usr/bin/bash
#Test fof colors shortcuts

null="> /dev/null 2>&1"
g="\033[1;32m"
r="\033[1;31m"
b="\033[1;34m"
w="\033[0m"

echo -e $b">"$w" prepare for installing dependencies ..."
sleep 3
echo -e $b">"$w" installing pacakge: "$g"python3"$w
sleep 3
echo -e $b">"$w" installing pacakge: "$g"LibreOffice"$w
sleep 3
echo -e $b">"$w" Don't forget to "$r"update"$w

#r = "\033[31m"
#g = "\033[32m"
#y = "\033[33m"
#b = "\033[34m"
#p = "\033[35m"
#d = "\033[2;37m"
#w = "\033[0m"
