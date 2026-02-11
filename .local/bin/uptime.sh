#!/bin/bash

while true; do
    # Use 'uptime -p' for pretty format like "up 2 days, 3 hours, 45 minutes"
    UPTIME=$(uptime -p | sed 's/up //')

    # Output JSON for Waybar
    echo '{"text": "⏱ '"$UPTIME"'", "tooltip": "System uptime: '"$UPTIME"'"}'

    # Sleep for update interval (e.g., 60 seconds; adjust as needed)
    sleep 600
done
