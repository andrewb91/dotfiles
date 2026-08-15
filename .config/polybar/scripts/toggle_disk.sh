#!/usr/bin/env bash

if pgrep -f "polybar disks" >/dev/null; then
    pkill -f "polybar disks"
else
    polybar disks &
    
    # auto-close after 30 seconds
    (
        sleep 30
        pkill -f "polybar disks"
    ) &
fi
