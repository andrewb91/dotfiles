#!/usr/bin/env bash

# ────────────────────────────────────────────────
#   Runs your script ONLY while the laptop screen (eDP-1) is enabled/active
# ────────────────────────────────────────────────

SCRIPT_TO_RUN="~/.config/hypr/scripts/wlsunset.sh"          # ← change this
LAPTOP_OUTPUT="eDP-1"                       # change if yours is named differently

# Optional: how often to check (seconds)
INTERVAL=180

echo "Watching for ${LAPTOP_OUTPUT} to become active..."

was_active=false

while true; do
    # Two main checks people use:
    # 1. Is the monitor even listed? (most reliable when DPMS is not used)
    # 2. Is DPMS on? (extra safety if you ever use dpms off/on)

    if hyprctl monitors -j | jq -e --arg mon "$LAPTOP_OUTPUT" \
        '.[] | select(.name == $mon) | select(.disabled == false)' >/dev/null 2>&1; then

        if ! $was_active; then
            echo "[$(date '+%H:%M:%S')] Laptop screen became active → executing script"
            bash "$SCRIPT_TO_RUN" &
            was_active=true
        fi
    else
        if $was_active; then
            echo "[$(date '+%H:%M:%S')] Laptop screen no longer active"
            was_active=false
        fi
    fi

    sleep "$INTERVAL"
done
