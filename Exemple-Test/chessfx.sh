#!/bin/bash

for((y=0;y<$[LINES-1];y++));do for((x=0;x<=$COLUMNS;x++));do
printf "\e[${y};${x}f\e[38;5;$[232+(x^y)%24]m\u2588";done;done
