#!/bin/bash
MP4FILE=$(ls ~/Musique/ | grep .mp4)
echo $MP4FILE
for filename in $MP4FILE
do
 name=`echo "$filename" | sed -e "s/.mp4$//g"`
 ffmpeg -i ~/Musique/$filename -b:a 192K -vn ~/Musique/$name.mp3
done
