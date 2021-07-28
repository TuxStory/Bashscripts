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
