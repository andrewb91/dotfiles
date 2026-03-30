#!/bin/sh
# fix issues

# Load X resources if present
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# Start keyring if you use it
eval "$(gnome-keyring-daemon --start)"

xset s 0 0
xset s noblank
xset -dpms

# Start i3
exec i3
#exec openbox

