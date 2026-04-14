#!/usr/bin/env bash

# Kill any running polybar instances
killall -q polybar

# Wait until polybar is fully terminated
while pgrep -u $UID -x polybar >/dev/null; do
    sleep 0.2
done

# Restart polybar (change "main" to your bar name if different)
polybar -q main &
