#!/bin/bash

#################
#### TESTING ####
#################

#ffmpeg -i $1 -b:a 192K -vn ~/Musique/$name.mp3
#ffmpeg -i $1 -vn -acodec copy ~/Musique/$name.mp3
#mplayer -dumpaudio -dumpfile $1 audio.mp3
#ffmpeg -i $1 -c:v libx264 -qp 0 output.mp4
name=`echo "$1" | sed -e "s/.mp4$//g"`
ffmpeg -i $1 -q:a 0 -map a $name.mp3
