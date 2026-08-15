#!/usr/bin/env bash

if pgrep -f "polybar system" >/dev/null; then
    pkill -f "polybar system"
else
    polybar system &
    
    # auto-close after 30 seconds
    (
        sleep 30
        pkill -f "polybar system"
    ) &
fi
