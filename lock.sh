# Wait for Wayland socket
while [ ! -S "$XDG_RUNTIME_DIR/wayland-0" ]; do
  echo "" > /dev/null
  sleep 0.1
done

hypridle &
hyprlock --no-fade-in	
