#!/bin/bash

# grep "Failed password" /var/log/auth.log
#grep "Failed password" /var/log/auth.log | awk ‘{print $10}’ | uniq -c | sort -nr

# journalctl
 journalctl _SYSTEMD_UNIT=ssh.service | egrep "Failed|Failure"
# journalctl _SYSTEMD_UNIT=sshd.service | egrep "Failed|Failure"  #In RHEL, CentOS
