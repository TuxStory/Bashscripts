#!/bin/bash

# Version : 0.8.2
# Author  : Antoine Even

JOURNAL="journalctl _SYSTEMD_UNIT=ssh.service" #Debian
#JOURNAL="journalctl _SYSTEMD_UNIT=sshd.service" #Fedora Centos Rockylinux

echo "================== "
echo " Failed SSH Login "
echo "=================="
echo

#With journalctl
$JOURNAL | grep -E "Failed|Failure"

echo
echo "==============================================="
echo " Banned IPs (In history, May be not active now)"
echo "==============================================="
echo
grep 'Ban' /var/log/fail2ban.log* 2>/dev/null
echo

echo "=============================================="
echo " Latest Successful SSH login attempts from IP "
echo "=============================================="
echo
$JOURNAL | grep -E "Accepted" | awk -F ": " '{print $1 $2}' | tail

