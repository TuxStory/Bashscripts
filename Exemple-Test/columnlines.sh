#!/bin/bash

echo "Lines: " $LINES
echo "Columns: " $COLUMNS

lines=$(tput lines)
columns=$(tput cols)

echo "Lines: " $lines
echo "Columns: " $columns
