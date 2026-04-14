#!/bin/sh
export DISPLAY=:0
export XAUTHORITY="$HOME/.Xauthority"

INTERN="eDP-1"
EXTERN="HDMI-1"
XRANDR="/usr/bin/xrandr"

$XRANDR --auto
sleep 1

if $XRANDR | grep -q "^${EXTERN} connected"; then
    $XRANDR --output "$INTERN" --off
    sleep 0.5
    $XRANDR --output "$EXTERN" --auto --primary
    notify-send "Display" "External monitor only"
else
    $XRANDR --output "$INTERN" --auto
    $XRANDR --output "$EXTERN" --off
    notify-send "Display" "Laptop screen only"
fi
