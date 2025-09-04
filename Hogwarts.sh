#!/bin/bash

# Name : Hogwarts.sh
# Date : 04/09/2025
# version : 0.6
# Delete coredump file systemd


echo -e "\n>>> Hogwarts tmp file cleaner."

ls /var/lib/systemd/coredump/
echo -e "\n>>> Deleting the file."
sudo rm /var/lib/systemd/coredump/*

if [ $? -eq 0 ]; then
    echo ">>> Success ! File deleted ..."
else
    echo ">>> An Error Occurred !"
fi

