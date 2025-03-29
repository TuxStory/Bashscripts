#!/bin/bash

# Name : Hogwarts.sh
# Date : 29/03/2035
# version : 0.2
# Delete coredump file systemd


ls /var/lib/systemd/coredump/
echo "Deleting the file"
sudo rm /var/lib/systemd/coredump/*
echo "File deleted ..."
