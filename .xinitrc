#!/bin/sh
# fix issues

# Load X resources if present
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# Start keyring if you use it
eval "$(gnome-keyring-daemon --start)"

xset s 0 0
xset s noblank
xset -dpms

systemctl --user import-environment DISPLAY XAUTHORITY DBUS_SESSION_BUS_ADDRESS
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY DBUS_SESSION_BUS_ADDRESS

# Start window manager
exec i3
#exec openbox

