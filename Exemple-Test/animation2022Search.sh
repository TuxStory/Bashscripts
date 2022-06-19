#!/bin/bash

find $HOME -iname *.mp3 > $HOME/Search.txt &
pid=$!
#frames="/ | \\ -"
frames='⣾ ⣽ ⣻ ⢿ ⡿ ⣟ ⣯ ⣷'

while kill -0 $pid 2&>1 > /dev/null
do
    for frame in $frames;
    do
        printf "\r$frame Searching..."
        sleep 0.2
    done
done
printf "\n"
echo "Find results in Search.txt"
