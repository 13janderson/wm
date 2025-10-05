# Wait for Wayland socket
while [ ! -S "$XDG_RUNTIME_DIR/wayland-0" ]; do
    sleep 0.1
done

hyprlock 
# pkill dwl
# dwl
