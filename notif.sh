# Wait for Wayland socket
while [ ! -S "$XDG_RUNTIME_DIR/wayland-0" ]; do
  echo "" > /dev/null
  echo "not running dunst"
  sleep 0.1
done

echo "running dunst"
/usr/bin/dunst & disown
