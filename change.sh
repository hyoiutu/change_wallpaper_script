#!/bin/bash
# when run this script, run a command line the following
# gconftool-2 --set /apps/nautilus/preferences/show_desktop --type boolean false
now=$(date +"%H")
day_time=6
night_time=20

if [ $now -lt $night_time -a $now -gt $day_time ]; then
  feh --bg-fill `ls -d ~/wallpaper/dayLight/horizontal/* | shuf -n 1` `ls -d ~/wallpaper/dayLight/vertical/* | shuf -n 1`
else
  feh --bg-fill `ls -d ~/wallpaper/night/horizontal/* | shuf -n 1` `ls -d ~/wallpaper/night/vertical/* | shuf -n 1`
fi
