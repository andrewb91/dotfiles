#!/bin/sh

INTERN="eDP-1"
EXTERN="HDMI-1"
XRANDR="/usr/bin/xrandr"

echo "$(date '+%Y-%m-%d %H:%M:%S'): Triggered" >> /tmp/monitor-toggle.log

# Refresh connection state
$XRANDR --auto >/dev/null 2>&1
sleep 1.0

if $XRANDR | grep -q "^${EXTERN} connected"; then
    echo "→ EXTERNAL ONLY" >> /tmp/monitor-toggle.log
    # Critical order for AMD: disable internal FIRST
    $XRANDR --output "$INTERN" --off
    sleep 0.8
    $XRANDR --output "$EXTERN" --auto --primary
else
    echo "→ LAPTOP ONLY" >> /tmp/monitor-toggle.log
    $XRANDR --output "$INTERN" --auto
    $XRANDR --output "$EXTERN" --off
fi
