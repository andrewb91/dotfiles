#!/usr/bin/env bash

# Get list of active monitor names
active_monitors=$(hyprctl monitors -j | jq -r '.[] | select(.focused == false and .dpmsStatus == true) | .name' ; hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')

# If no active monitors, exit
if [ -z "$active_monitors" ]; then
    echo "No active monitors found!"
    exit 1
fi

# Pick the first active monitor as target (usually the primary one)
target_monitor=$(echo "$active_monitors" | head -n1)
echo "Target monitor for moving workspaces: $target_monitor"

# Get all workspaces and their monitors
mapfile -t workspaces < <(hyprctl workspaces -j | jq -r '.[] | "\(.id):\(.monitor)"')

# Loop through workspaces
for ws in "${workspaces[@]}"; do
    ws_id=$(echo "$ws" | cut -d: -f1)
    ws_monitor=$(echo "$ws" | cut -d: -f2)

    # If workspace is on a non-active monitor, move it
    if ! echo "$active_monitors" | grep -q "^$ws_monitor$"; then
        echo "Moving workspace $ws_id from $ws_monitor to $target_monitor"
        hyprctl dispatch moveworkspacetomonitor "$ws_id" "$target_monitor"
    fi
done

echo "Done!"
