#!/bin/sh

INTERN="eDP-1"
EXTERN="HDMI-1"
XRANDR="/usr/bin/xrandr"

echo "$(date '+%Y-%m-%d %H:%M:%S'): Triggered" >> /tmp/monitor-toggle.log 2>&1

$XRANDR --auto >/dev/null 2>&1
sleep 1.5

if $XRANDR | grep -q "^${EXTERN} connected"; then
    echo "→ EXTERNAL ONLY" >> /tmp/monitor-toggle.log 2>&1
    $XRANDR --output "$INTERN" --off
    sleep 1.2
    $XRANDR --output "$EXTERN" --auto --primary
    echo "External activation command finished" >> /tmp/monitor-toggle.log 2>&1
else
    echo "→ LAPTOP ONLY" >> /tmp/monitor-toggle.log 2>&1
    $XRANDR --output "$INTERN" --auto
    $XRANDR --output "$EXTERN" --off
fi
