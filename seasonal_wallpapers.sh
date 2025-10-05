#!/bin/bash
# Intended for use as CRON job which runs intermittently 
# and updates the current wallpaper based on what season it is
# Cronjob does not inherit graphical environment variables like 
export XDG_RUNTIME_DIR=/run/user/1000
export WAYLAND_DISPLAY=$(ls /run/user/1000 | grep '^wayland-[0-9]\+$')
echo $WAYLAND_DISPLAY

# Assumes northern hemisphere
month=$(date +%m)
if   ((month == 12 || month <= 2)); then season="Winter"
elif ((month >= 3 && month <= 5));  then season="Spring"
elif ((month >= 6 && month <= 8));  then season="Summer"
else                                 season="Autumn"
fi

case "$season" in
  Winter)
    ln -sf $HOME/wallpapers/winter_wallpaper.jpg $HOME/wallpapers/wallpaper.jpg
    ;;

  Autumn)
    ln -sf $HOME/wallpapers/autumn_wallpaper.jpg $HOME/wallpapers/wallpaper.jpg
    ;;

  Spring)
    ln -sf $HOME/wallpapers/spring_wallpaper.jpg $HOME/wallpapers/wallpaper.jpg
    ;;

  Summer)
    ln -sf $HOME/wallpapers/summer_wallpaper.jpg $HOME/wallpapers/wallpaper.jpg
    ;;

  *)
    echo "No wallpaper found"
    ;;
esac

# Reload sway
pkill swaybg
swaybg -i "$HOME/wallpapers/wallpaper.jpg" &
