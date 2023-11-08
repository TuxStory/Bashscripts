#!/bin/bash

# Version : 0.5.1
# Author  : Antoine Even

JOURNAL="journalctl _SYSTEMD_UNIT=ssh.service"

echo "================== "
echo " Failed SSH Login "
echo "=================="
echo

#Without journalctl
#grep "Failed password" /var/log/auth.log
#grep "Failed password" /var/log/auth.log | awk ‘{print $10}’ | uniq -c | sort -nr
#With journalctl
$JOURNAL | grep -E "Failed|Failure"
# $JOURNAL | egrep "Failed|Failure"  #In RHEL, CentOS

echo
echo "=============================================="
echo " Banned IPs (In history, Maybe not active now)"
echo "=============================================="
echo
grep 'Ban' /var/log/fail2ban.log* 2>/dev/null
echo
echo "==========================="
echo " Successful Login Attempts "
echo "==========================="
echo

#journalctl -u ssh.service -g opened
$JOURNAL| grep -E "opened"
echo
