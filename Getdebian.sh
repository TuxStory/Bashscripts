#!/bin/bash

REGEX="https:\/\/[a-z]{7}.*.iso"
Link=$(wget -qO- www.debian.org/download | grep -Eo $REGEX)
echo $Link
wget $Link -P ~/

#wget -qO- www.debian.org |
#grep -Eoi '<a [^>]+>' |
#grep -Eo 'href="[^\"]+"' |
#grep -Eo '(http|https)://[^/"]+'
#
