#!/bin/bash
# Continuously queries RPi3 GPU for temperature, clock rates and throttled status
# Original from https://www.raspberrypi.org/forums/viewtopic.php?t=244320
echo -e "Time      Temp     CPU     Core    Health      Vcore"
while true ; do
  Temp=$(vcgencmd measure_temp | cut -f2 -d=)
  Clockspeed=$(vcgencmd measure_clock arm | awk -F"=" '{printf ("%0.0f",$2/1000000); }' )
  Corespeed=$(vcgencmd measure_clock core | awk -F"=" '{printf ("%0.0f",$2/1000000); }' )
  Health=$(vcgencmd get_throttled | awk -F"=" '{printf("0x%08x\n",$2)}')
  CoreVolt=$(vcgencmd measure_volts | cut -f2 -d=)
  echo -ne "$(date '+%H:%M:%S')  ${Temp}  $(printf '%4s' ${Clockspeed})MHz $(printf '%4s' ${Corespeed})MHz  ${Health}  ${CoreVolt}" \\r
  sleep 5
done