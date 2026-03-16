#!/usr/bin/env bash

if pgrep conky >/dev/null; then
    killall conky
    exit
fi

CONFIG="$HOME/.config/conky/conky.conf"

# Check if config exists
if [[ ! -f "$CONFIG" ]]; then
    echo "Conky config not found: $CONFIG"
    exit 1
fi

# Kill existing conky instances (optional)
pkill -x conky 2>/dev/null

# Start conky with the specified config
conky -c "$CONFIG" &

sleep 60

# kill conky
kill $CONKY_PID 2>/dev/null || killall conky


#disown
