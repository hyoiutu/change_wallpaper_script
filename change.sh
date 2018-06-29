#!/bin/bash
# when run this script, run a command line the following
# gconftool-2 --set /apps/nautilus/preferences/show_desktop --type boolean false
now=$(date +"%H")
day_time=6
night_time=20

if [ $now -lt $night_time -a $now -gt $day_time ]; then
  horizontal_file_path=~/wallpaper/dayLight/horizontal/*
  vertical_file_path="~/wallpaper/dayLight/vertical/*"
else
  horizontal_file_path="~/wallpaper/night/horizontal/*"
  vertical_file_path="~/wallpaper/night/vertical/*"
fi
# gsettings set org.gnome.desktop.background picture-uri `$horizontal_file_path | shuf -n 1` `ls -d $vertical_file_path | shuf -n 1`
gsettings set org.gnome.desktop.background picture-uri `ls -d $horizontal_file_path | shuf -n 1`
