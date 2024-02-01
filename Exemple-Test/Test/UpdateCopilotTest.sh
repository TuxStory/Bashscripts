#!/bin/bash

# Detect the Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
elif type lsb_release >/dev/null 2>&1; then
    OS=$(lsb_release -si)
else
    OS=$(uname -s)
fi

echo $OS

# Update the package list and upgrade all packages
if [[ "$OS" == "Arch Linux" ]]; then
    sudo pacman -Syu
elif [[ "$OS" == "Debian GNU/Linux" || "$OS" == "Ubuntu" ]]; then
    sudo apt-get update && sudo apt-get upgrade -y
elif [[ "$OS" == "Fedora Linux" || "$OS" == "Red Hat Enterprise Linux"  || "$OS" == "CentOS Linux" ]]; then
    sudo dnf upgrade -y
elif [[ "$OS" == "openSUSE Leap" ]]; then
    sudo zypper update
else
    echo "Unsupported Linux distribution: $OS"
fi
