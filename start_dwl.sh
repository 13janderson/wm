#!/bin/sh

source $HOME/wl/lock.sh &
source $HOME/wl/notif.sh &

slstatus -s | dwl -s "sh -c 'swaybg -i $HOME/wallpapers/wallpaper.jpg'"
