#!/bin/bash


IP="192.168.1.1"

ping $IP | cut -d"=" -f4 #| awk '{print $2}'



# Scripts trouvés sur le net
: ' #indique commentair sur plusieurs lignes
ping 192.168.70.1 | while read pong; do echo "$(awk '{print $1}' /proc/uptime): $pong"; done

# 2eme
#!/bin/bash

host=$1

if [ -z $host ]; then
    echo "Usage: `basename $0` [HOST]"
    exit 1
fi

while :; do
    result=`ping -W 1 -c 1 $host | grep 'bytes from '`
    if [ $? -gt 0 ]; then
        echo -e "`date +'%Y/%m/%d %H:%M:%S'` - host $host is \033[0;31mdown\033[0m"
    else
         echo -e "`date +'%Y/%m/%d %H:%M:%S'` - host $host is \033[0;32mok\033[0m -`echo $result | cut -d ':' -f 2`"
        sleep 1 # avoid ping rain
    fi
done
'
