#!/bin/bash

# Name : Hogwarts.sh
# Date : 29/03/2025
# version : 0.4
# Delete coredump file systemd

ls /var/lib/systemd/coredump/
echo -e "\n>>> Deleting the file"
sudo rm /var/lib/systemd/coredump/*

if [ $? -eq 0 ]; then
    echo ">>> Success ! File deleted ..."
else
    echo ">>> An Error Occurred !"
fi

