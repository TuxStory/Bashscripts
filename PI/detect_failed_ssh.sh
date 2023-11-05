#!/bin/bash

# Version : 0.1
# Author  : Antoine Evne

echo "================== "
echo " Failed SSH Login "
echo "=================="
#Without journalctl
#grep "Failed password" /var/log/auth.log
#grep "Failed password" /var/log/auth.log | awk ‘{print $10}’ | uniq -c | sort -nr

#With journalctl
journalctl _SYSTEMD_UNIT=ssh.service | grep "Failed|Failure"
# journalctl _SYSTEMD_UNIT=sshd.service | egrep "Failed|Failure"  #In RHEL, CentOS

echo "============"
echo " Banned IPs "
echo "============"
grep 'Ban' /var/log/fail2ban.log*
