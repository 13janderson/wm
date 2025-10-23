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

current=$(readlink "$HOME/wallpapers/wallpaper.jpg")
new=$current

case "$season" in
  Winter)
    new=$HOME/wallpapers/winter_wallpaper.jpg
    ;;

  Autumn)
    new=$HOME/wallpapers/autumn_wallpaper.jpg
    ;;

  Spring)
    new=$HOME/wallpapers/spring_wallpaper.jpg
    ;;

  Summer)
    new=$HOME/wallpapers/summer_wallpaper.jpg
    ;;

  *)
    echo "No wallpaper found"
    ;;
esac

if [[ $new != $current ]]; then
  # Reload sway
  echo "Loading new wallpaper $current->$new"
  ln -sf $new "$HOME/wallpapers/wallpaper.jpg"
  pkill swaybg
  swaybg -i "$HOME/wallpapers/wallpaper.jpg" & disown
fi

