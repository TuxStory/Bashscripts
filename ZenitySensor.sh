#!/bin/bash
# show_cpu_temp.sh - Progress Dialog to show CPU temperature
#
echo "Press [CTRL+C] to stop..."
(
while :; do
  echo "# $(sensors | grep CPU)"
  sensors | grep CPU | awk '{print substr($2,2,4) }'
  sleep 5
done ) | zenity --progress --title="CPU Temperature"
