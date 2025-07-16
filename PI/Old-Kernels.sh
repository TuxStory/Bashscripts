#!/bin/bash

echo ">>> Apt List"
apt list -i linux-image* linux-headers*

echo ">>> dpkg"
dpkg --list | egrep -i --color 'linux-image|linux-headers'
