#!/bin/sh

# Load X resources if present
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# Start keyring if you use it
eval "$(gnome-keyring-daemon --start)"

# Start i3
exec i3
#exec openbox

