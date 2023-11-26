#!/bin/bash

Linux=(Debian Fedora Ubuntu LinuxMint RedHat ArchLinux Manjaro)

LIST=(1 2 3)

for i in "${LIST[@]}"; do
  echo "example.$i"
done

for item in "${Linux[@]}"; do
  echo "Element : $item"
done
