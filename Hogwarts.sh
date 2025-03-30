#!/bin/bash

# Name : Hogwarts.sh
# Date : 29/03/2035
# version : 0.3
# Delete coredump file systemd

ls /var/lib/systemd/coredump/
echo -e "\n>>> Deleting the file"
sudo rm /var/lib/systemd/coredump/*
echo ">>> File deleted ..."
