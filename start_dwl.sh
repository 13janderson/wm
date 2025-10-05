#!/bin/sh

# Enable hotkey daemon
swhks & swhkd &
slstatus -s | dwl -s "sh -c 'swaybg -i $HOME/wallpapers/wallhaven-tree.jpg'" &

source $HOME/dfiles/lock.sh

# Kill hotkey daemon so that it can
# start back up again later
killall swhkd
