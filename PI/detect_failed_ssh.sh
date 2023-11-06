#!/bin/bash

# Version : 0.4
# Author  : Antoine Even

echo "================== "
echo " Failed SSH Login "
echo "=================="
echo
#Without journalctl
#grep "Failed password" /var/log/auth.log
#grep "Failed password" /var/log/auth.log | awk ‘{print $10}’ | uniq -c | sort -nr

#With journalctl
journalctl _SYSTEMD_UNIT=ssh.service | grep -E "Failed|Failure"
# journalctl _SYSTEMD_UNIT=sshd.service | egrep "Failed|Failure"  #In RHEL, CentOS

echo "============"
echo " Banned IPs "
echo "============"
echo
grep 'Ban' /var/log/fail2ban.log* 2>/dev/null

echo "==========================="
echo " Successful Login Attempts "
echo "==========================="
echo
#journalctl -u ssh.service -g opened
journalctl _SYSTEMD_UNIT=ssh.service | grep -E "opened"
