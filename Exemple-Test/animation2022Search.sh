#!/bin/bash

find $HOME -iname *.mp3 > Search.txt &
pid=$!
frames="/ | \\ -"

while kill -0 $pid 2&>1 > /dev/null
do
    for frame in $frames;
    do
        printf "\r$frame Searching..."
        sleep 0.5
    done
done
printf "\n"
echo "Find results in Search.txt"
