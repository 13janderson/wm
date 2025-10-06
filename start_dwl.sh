#!/bin/sh

# Enable hotkey daemon
swhks & swhkd & 
slstatus -s | dwl -s "sh -c 'swaybg -i $HOME/wallpapers/wallpaper.jpg'" >> /$HOME/.dwl.log &
source $HOME/wl/lock.sh

# Kill hotkey daemon so that it can
# start back up again later in the event 
# that we exited dwl and went back to a TTY
# and had to start dwl again
# MAKE SURE YOU SLEEP HERE OTHERWISE THIS SCRIPT 
# WILL HOG THE CPU HAHAHHA
while [ -S "$XDG_RUNTIME_DIR/wayland-0" ]; do
  echo "" >> /dev/null
  sleep 10
done
killall swhkd
