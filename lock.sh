# Wait for Wayland socket
while [ ! -S "$XDG_RUNTIME_DIR/wayland-0" ]; do
  echo "" > /dev/null
done

hypridle &
hyprlock 
# hyprlock --no-fade-in --immediate-render
