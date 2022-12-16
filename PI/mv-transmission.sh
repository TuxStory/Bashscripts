#!/bin/bash

#moving
echo "Déplacement des ficiers"
sudo mv /var/lib/transmission-daemon/downloads/* /home/antoine/Partage/
echo "Rectification des droits sur les fichiers"
sudo chown antoine:antoine /home/antoine/Partage/*
