#!/usr/bin/env bash
FILE="$HOME/.cache/nhl_toggle"

if [ ! -f "$FILE" ]; then
    echo "on" > "$FILE"
    exit
fi

if grep -q "on" "$FILE"; then
    echo "off" > "$FILE"
else
    echo "on" > "$FILE"
fi
