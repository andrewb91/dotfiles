#!/bin/bash

# Night Mode

# Check if hyprsunset is running
if pgrep -x "hyprsunset" > /dev/null; then
		  killall -9 hyprsunset
		  notify-send "Night Light" "Off" -u "low"
else
		  hyprsunset -t 3500 &
		  notify-send "Night Light" "On" -u "low"
fi
