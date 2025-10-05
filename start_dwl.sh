#!/bin/sh

# Enable hotkey daemon
swhks & swhkd &
slstatus -s | dwl -s "sh -c 'swaybg -i $HOME/wallpapers/wallhaven-tree.jpg.jpg'" &

source $HOME/dfiles/lock.sh


# Kill hotkey daemon so that it can
# start back up again later in the event 
# that we exited dwl and went back to a TTY
# and had to start dwl again
  
while [ -S "$XDG_RUNTIME_DIR/wayland-0" ]; do
    sleep 0.1
done
killall swhkd
