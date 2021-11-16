#!bin/bash

SSID=$(/sbin/iwconfig wlan0 | perl -n -e'/ESSID:"(.*?)"/ && print $1')

QUALITY=$(grep wlan0 /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')

#------------------------------------------------------------------------

echo  $QUALITY% $SSID
