#!/bin/sh
INTERN="eDP-1"
EXTERN="HDMI-1"
XRANDR="/usr/bin/xrandr"

echo "$(date '+%Y-%m-%d %H:%M:%S'): Triggered" >> /tmp/monitor-toggle.log

$XRANDR --auto >/dev/null 2>&1
sleep 1.2

if $XRANDR | grep -q "^${EXTERN} connected"; then
    echo "→ EXTERNAL ONLY" >> /tmp/monitor-toggle.log
    $XRANDR --output "$INTERN" --off
    sleep 0.7
    $XRANDR --output "$EXTERN" --mode 1920x1080 --primary   # or whatever your preferred mode is
else
    echo "→ LAPTOP ONLY" >> /tmp/monitor-toggle.log
    $XRANDR --output "$INTERN" --auto --primary
    $XRANDR --output "$EXTERN" --off
fi
