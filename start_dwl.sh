#!/bin/sh

# Enable hotkey daemon
swhks & swhkd &
slstatus -s | dwl -s "sh -c 'swaybg -i $HOME/wallpapers/wallhaven-tree.jpg'"

