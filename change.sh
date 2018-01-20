#!/bin/bash
# when run this script, run a command line the following
# gconftool-2 --set /apps/nautilus/preferences/show_desktop --type boolean false
now=$(date +"%H")

if [ $now -lt 20 -a $now -gt 6 ]; then
  feh --randomize --bg-fill ~/wallpaper/dayLight/*
else
  feh --bg-fill `ls -d ~/wallpaper/night/* | shuf -n 1` `ls -d ~/wallpaper/dayLight/* | shuf -n 1`
fi
