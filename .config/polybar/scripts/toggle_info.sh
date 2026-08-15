#!/usr/bin/env bash

PID=$(pgrep -f "polybar info")

if [ -n "$PID" ]; then
    kill "$PID"
else
    polybar info &
    (sleep 30 && pkill -f "polybar info") &
fi
