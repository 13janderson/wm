#!/bin/sh

# Enable hotkey daemon
swhks & swhkd & 
slstatus -s | dwl -s "sh -c 'swaybg -i $HOME/wallpapers/wallpaper.jpg'" &
source $HOME/dfiles/lock.sh

# Kill hotkey daemon so that it can
# start back up again later in the event 
# that we exited dwl and went back to a TTY
# and had to start dwl again
while [ -S "$XDG_RUNTIME_DIR/wayland-0" ]; do
  echo "" >> /dev/null
done
killall swhkd
